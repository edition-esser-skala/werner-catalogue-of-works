library(tidyverse)
library(readODS)
library(fs)
source("script/utils.R")

library(reticulate)
reticulate::use_virtualenv("renv/python/virtualenvs/renv-python-3.11")
verovio <- import("verovio")



# Initialize verivio ------------------------------------------------------

verovio_tk <- verovio$toolkit()
verovio_tk$setOptions(r_to_py(list(
  adjustPageHeight = TRUE,
  adjustPageWidth = TRUE,
  header = "none",
  footer = "none",
  pageMarginBottom = 0,
  pageMarginLeft = 0,
  pageMarginRight = 0,
  pageMarginTop = 0
)))



# Load data ---------------------------------------------------------------

# (1) the manually curated catalogue of works
catalogue <- read_ods(
  "data/catalogue.ods",
  sheet = "works",
  col_types = cols(ID = "i", .default = "c")
)

# (2) known individual works/copies
# (a) RISM entries
rism_entries <-
  read_ods("data/catalogue.ods", sheet = "rism") %>%
  select(siglum, shelfmark, title, rism_id) %>%
  mutate(rism_id_end = str_sub(rism_id, -3L))

# (b) works missing in RISM
rism_missing <-
  read_ods("data/catalogue.ods", sheet = "missing_in_rism")

# (a+b) all known works
known_works <-
  bind_rows(rism_entries, rism_missing)



# Create catalogue in long form -------------------------------------------

catalogue_siglum <-
  catalogue %>%
  select(ID, title, `A-Ed`:`H-VEs`) %>%
  pivot_longer(
    !c(ID, title),
    names_to = "siglum",
    values_to = "shelfmark"
  ) %>%
  filter(!is.na(shelfmark)) %>%
  separate_longer_delim(shelfmark, " | ")

catalogue_other <-
  catalogue %>%
  select(ID, title, other) %>%
  filter(!is.na(other)) %>%
  separate_longer_delim(other, " | ") %>%
  separate_wider_delim(
    other,
    " ",
    names = c("siglum", "shelfmark"),
    too_many = "merge"
  )

catalogue_all <-
  bind_rows(catalogue_siglum, catalogue_other) %>%
  arrange(ID) %>%
  separate_wider_regex(
    shelfmark,
    c(shelfmark = ".*", " \\[", rism_id_end = "\\d\\d\\d", "\\]"),
    too_few = "align_start",
    cols_remove = TRUE
  )



# Validate data -----------------------------------------------------------

# there is no overlap between works with and without RISM entry
inner_join(
  rism_entries,
  rism_missing,
  by = join_by(siglum, shelfmark)
) %>%
  nrow() == 0

# all catalogue entries with unique siglum are in the list of known works
catalogue_all %>%
  filter(is.na(rism_id_end)) %>%
  anti_join(known_works, by = join_by(siglum, shelfmark)) %>%
  arrange(siglum, shelfmark) %>%
  nrow() == 0

# all catalogue entries with shared siglum are in RISM
catalogue_all %>%
  filter(!is.na(rism_id_end)) %>%
  anti_join(rism_entries, by = join_by(siglum, shelfmark, rism_id_end)) %>%
  nrow() == 0

# all known works not in RISM are cited in the catalogue
# NOTE: A-Wn entries are currently ignored,
#       since the Fonds Moder has not been screened!
rism_missing %>%
  anti_join(catalogue_all, by = join_by(siglum, shelfmark)) %>%
  filter(siglum != "A-Wn") %>%  # line should eventually be removed
  nrow() == 0

# all RISM entries are cited in the catalogue
rism_entries %>%
  filter(siglum != "A-KRB") %>%  # line should evtl be removed
  anti_join(catalogue_all, by = join_by(siglum, shelfmark)) %>%
  nrow() == 0



# Prepare data for group pages --------------------------------------------

## Data frames ----

# incipits extracted from RISM entries
available_incipits <-
  read_csv(
    "data_generated/rism_incipits.csv",
    col_types = cols(.default = "c")
  ) %>%
  distinct(rism_id, .keep_all = TRUE)

catalogue_all_with_rism <-
  bind_rows(
    catalogue_all %>%
      filter(is.na(rism_id_end)) %>%
      left_join(
        rism_entries %>% select(!c(title, rism_id_end)),
        by = join_by(siglum, shelfmark)
      ),
    catalogue_all %>%
      filter(!is.na(rism_id_end)) %>%
      left_join(
        rism_entries %>% select(!title),
        by = join_by(siglum, shelfmark, rism_id_end)
      )
  ) %>%
  select(ID, siglum, shelfmark, rism_id) %>%
  left_join(available_incipits, by = "rism_id") %>%
  unite(siglum, shelfmark, col = "source", sep = " ") %>%
  nest(.by = ID, .key = "sources")

works <-
  catalogue %>%
  select(ID:key) %>%
  left_join(catalogue_all_with_rism, by = "ID") %>%
  mutate(key = replace_na(key, "–"))

subgroups <-
  read_ods("data/catalogue.ods", sheet = "overview") %>%
  fill(file, group) %>%
  filter(!is.na(subgroup)) %>%
  select(group:title) %>%
  nest(subgroups = c(subgroup, title))

work_pages <-
  read_ods("data/catalogue.ods", sheet = "overview") %>%
  filter(!is.na(group)) %>%
  select(file, group, title) %>%
  left_join(subgroups, by = "group")


## Templates ----

page_template <- '# [{group}]{{.chapter-number}} {title} {{.unnumbered}}

{work_list}
'

subgroup_template <- '
## [{group}.{subgroup}]{{.header-section-number}} {title} {{.unnumbered}}

{work_list}
'

work_template <- '
### [{group}{subgroup}.{number}]{{.header-section-number}} {title} {{.unnumbered}}

{details}

key
: {key}

sources
: {sources}

incipit
: {incipit}
'



# Generate group pages ----------------------------------------------------

## Functions ----

make_incipit <- function(group, number, sources) {
  incipit_image <- str_glue("groups/incipits/{group}_{number}.svg")

  # (1) is there a manually created incipit? if so, render to svg
  manual_incipit <- str_glue("data/incipits/{group}_{number}/main.mei")
  if (file_exists(manual_incipit)) {
    verovio_tk$loadFile(manual_incipit)
    success <- verovio_tk$renderToSVGFile(incipit_image)
    if (!success)
      warn("Error rendering {incipit_image}")
    return(str_glue("![](incipits/{group}_{number}.svg){{width=80%}}"))
  }

  # (2) no sources -> no incipit
  if (is.null(sources))
    return("(none)")

  # (3) no incipit in RISM -> no incipit
  incipit <-
    sources %>%
    filter(!is.na(work)) %>%
    head(1)
  if (nrow(incipit) == 0)
    return("(none)")

  # (4) render RISM incipit
  if (is.na(incipit$text))
    incipit_text <- ""
  else
    incipit_text <- paste0("<br/>\n", incipit$text)

  verovio_tk$loadData(incipit$pae)
  success <- verovio_tk$renderToSVGFile(incipit_image)
  if (!success)
    warn("Error rendering {incipit_image}")

  return(str_glue("{incipit$work}.{incipit$movement}.{incipit$excerpt}<br/>\n",
                  "![](incipits/{group}_{number}.svg){{width=80%}}",
                  "{incipit_text}"))
}

# make_incipit("B", "46", NULL)
#
# make_incipit(
#   "B",
#   "47",
#   works %>%
#     filter(group == "B", number == "47") %>%
#     pull(sources) %>%
#     pluck(1)
# )

make_work_entry <- function(group, subgroup, number, title, key, sources, ...) {
  if (!is.na(subgroup)) {
    group_subgroup <- str_c(group, subgroup, sep = "_")
    subgroup <- paste0(".", subgroup)
  } else {
    group_subgroup <- group
    subgroup <- ""
  }

  info("Writing {group_subgroup}_{number}")
  incipit <- make_incipit(group_subgroup, number, sources)
  sources <- pmap(
    sources,
    \(source, rism_id, ...)
      if_else(
        is.na(rism_id),
        source,
        str_glue("[{source}](https://opac.rism.info/search?id={rism_id})")
      )
  ) %>%
    str_flatten(collapse = " · ")

  details <- ""
  if (file_exists(str_glue("data/works_html/{group_subgroup}_{number}.html")))
    details <- str_glue("[Details](/works/{group_subgroup}_{number}.html)")

  str_glue(work_template)
}

# make_work_entry("1", "B", "C", "D", catalogue_all_with_rism$sources[[1]])
# make_work_entry("B", "46", "C", "D", catalogue_all_with_rism$sources[[1]])
# make_work_entry("A", "B", "C", "D", catalogue_all_with_rism$sources[[525]])


make_group_page <- function(file, group, title, subgroups) {
  if (is.null(subgroups)) {
    work_list <-
      works %>%
      filter(group == {{group}}) %>%
      pmap(make_work_entry) %>%
      str_flatten("\n\n")
  } else {
    work_list <- pmap(
      subgroups,
      \(subgroup, title) {
        work_list <-
          works %>%
          filter(group == {{group}}, subgroup == {{subgroup}}) %>%
          pmap(make_work_entry) %>%
          str_flatten("\n\n")
        str_glue(subgroup_template)
      }
    ) %>%
      str_flatten("\n\n")
  }
  str_glue(page_template) %>%
    write_file(str_glue("groups/{file}.qmd"))
}

# pmap(work_pages[4, ], make_group_page)
# pmap(work_pages[2, ], make_group_page)


## Run ----

if (dir_exists("groups")) dir_delete("groups")
dir_create("groups/incipits")
pwalk(work_pages, make_group_page)

if (dir_exists("_book/works")) dir_delete("_book/works")
dir_copy("data/works_html", "_book/works")
