library(tidyverse)
library(yaml)
library(xml2)
library(fs)



# Load data ---------------------------------------------------------------

## Edition metadata ----

read_edition_metadata <- function(f) {
  data <- read_yaml(f)
  enframe(data$sources, "source") %>%
    unnest_wider(value) %>%
    mutate(
      shelfmark = as.character(shelfmark),
      date = if ("date" %in% names(.))
        as.character(date) %>% str_replace("NULL", "")
      else
        "",
      id = data$id,
      title = data$title,
      subtitle = data$subtitle,
      genre = data$genre,
      ark = data$ark,
      .before = 1
    ) %>%
    separate_wider_delim(
      id,
      delim = " ",
      names = c("catalogue", "id"),
      too_many = "merge"
    ) %>%
    select(!any_of(c("principal", "license", "notes")))
}

meta_edition <-
  dir_ls("~/Desktop/Werner CW/works", recurse = TRUE, regex = "metadata.yaml") %>%
  path_filter(regexp = "template", invert = TRUE) %>%
  map(read_edition_metadata) %>%
  list_rbind() %>%
  rename(rism_id = rism) %>%
  mutate(
    rism_id = as.character(rism_id),
    across(everything(), ~replace_na(.x, "NA")),
    subtitle = str_replace_all(subtitle, "\\\\\\\\", " ")
  )


## Catalogue metadata ----

meta_catalogue <-
  read_rds("data_generated/works.rds") %>%
  select(group:number, sources) %>%
  unnest(sources) %>%
  separate_wider_delim(
    source,
    delim = " ",
    names = c("siglum", "shelfmark"),
    too_many = "merge"
  ) %>%
  unite(group:number, col = "id", sep = ".", na.rm = TRUE) %>%
  mutate(
    rism_id = as.character(rism_id),
    across(everything(), ~replace_na(.x, "NA"))
  )


## MEI metadata ----

get_image_url <- function(r) {
  links <-
    map(
      names(r) %>% str_which("ptr"),
      \(i) tibble_row(
        type = attr(r[[i]], "label"),
        url = attr(r[[i]], "target")
      )
    ) %>%
    list_rbind()

  if (nrow(links) == 0)
    return("NA")

  url <-
    links %>%
    filter(type == "digitized version") %>%
    pull(url)

  if (length(url) == 0L)
    return("NA")

  url
}

get_subtitle <- function(r) {
  i_title <- str_which(names(r), "title")
  if (length(i_title) > 1)
    as.character(r[i_title[2]][[1]])
  else
    ""
}

read_mei_metadata <- function(f) {
  data <-
    read_xml(f) %>%
    as_list() %>%
    pluck("mei", "meiHead")

  map(
    data$manifestationList,
    \(m) tibble_row(
      siglum = m$itemList$item$physLoc$repository$identifier[[1]],
      shelfmark = m$itemList$item$physLoc$identifier[[1]],
      type = m$titleStmt$title[[1]],
      date = m$pubStmt$date[[1]],
      url = get_image_url(m$itemList$item$physLoc$repository)
    )
  ) %>%
    list_rbind() %>%
    mutate(
      .before = 1,
      id = path_file(f) %>%
        path_ext_remove() %>%
        str_replace_all("_", "."),
      ark = data$altId[[1]],
      genre = data$workList$work$classification$termList$term[[1]],
      subtitle = get_subtitle(data$workList$work)
    )
}

meta_mei <-
  dir_ls("~/Desktop/WerW/data/works_mei") %>%
  map(read_mei_metadata) %>%
  list_rbind()



# Comparison --------------------------------------------------------------

## Catalogue name ----

all(meta_edition$catalogue == "WerW")


## Catalogue IDs ----

# remaining: 2 (O.1–12 and P.4–9, M.17–22)
anti_join(meta_edition, meta_catalogue, by = "id")


## ARKs ----

# remaining: 2 (O.1–12 and P.4–9, M.17–22)
meta_edition %>%
  distinct(id, ark) %>%
  mutate(
    id =
      id %>%
      str_to_lower() %>%
      str_remove_all("\\."),
    ark =
      ark %>%
      str_remove("68748/e1gjw")
  ) %>%
  filter(id != ark)


## Titles ----

full_join(
  meta_catalogue %>%
    distinct(id, title),
  meta_edition %>%
    distinct(id, title) %>%
    mutate(
      title = str_replace_all(title, c("æ" = "ae", "œ" = "oe", "ſ" = "s"))
    ),
  by = "id"
) %>%
  mutate(equal = title.x == title.y) %>%
  filter(!equal)


## Subtitles ----

# remainin: 8
anti_join(
  meta_edition %>%
    distinct(id, title, subtitle) %>%
    filter(subtitle != "NA"),
  meta_mei %>%
    distinct(id, genre, subtitle) %>%
    filter(subtitle != ""),
  by = join_by(id, subtitle)
)


## Sources ----

# remaining: 3 (B.75, O.1–12, and P.4–9, M.17–22)
meta_edition %>%
  anti_join(meta_catalogue, by = c("id", "siglum", "shelfmark"))


## RISM IDs ----

# remaining: 3 (B.75, O.1–12, and P.4–9, M.17–22)
meta_edition %>%
  anti_join(meta_catalogue, by = c("id", "siglum", "shelfmark", "rism_id"))


## Genre ----

# remaining: 2 (O.1–12 and P.4–9, M.17–22)
anti_join(
  meta_edition %>%
    distinct(id, genre),
  meta_mei %>%
    distinct(id, genre),
  by = join_by(id, genre)
)


## Manuscript type ----

# remaining: 3 (B.75, M.24, and O.1–12)
meta_edition %>%
  mutate(
    type =
      source %>%
      str_sub(1, 1) %>%
      str_replace("D", "B")
  ) %>%
  anti_join(
    meta_mei %>%
      mutate(
        type = recode_values(
          type,
          "Autograph manuscript" ~ "A",
          "Partly autograph manuscript" ~ "A",
          "Manuscript copy" ~ "B",
          "Print" ~ "C",
          "Lost manuscript" ~ "X",
          unmatched = "error"
        )
      ),
    by = join_by(type, siglum, shelfmark)
  )


## URL ----

# remaining: 3 (B.75, M.24, and O.1–12)
meta_edition %>%
  anti_join(
    meta_mei,
    by = join_by(siglum, shelfmark, url)
  )


## Date ----

# all dates included in an edition are correct
# remaining: 2 (M. 24 and O.1–12)
meta_edition %>%
  anti_join(
    meta_mei,
    by = join_by(siglum, shelfmark, date)
  ) %>%
  select(id, source, date) %>%
  filter_out(date %in% c("", "NA"))

# editions include all known exact dates
meta_mei %>%
  filter(when_any(
    str_detect(date, "^\\d{4}$"),
    str_detect(date, "^\\d{4}-\\d{2}$"),
    str_detect(date, "^\\d{4}-\\d{2}-\\d{2}$")
  )) %>%
  inner_join(
    meta_edition,
    by = join_by(id, siglum, shelfmark)
  ) %>%
  select(id, siglum, shelfmark, date.x, date.y) %>%
  filter(date.x != date.y)
