library(tidyverse)
library(fs)
library(gt)
source("script/utils.R")
source("script/parse_mei.R")
options(readr.show_col_types = FALSE)



# Load data ---------------------------------------------------------------

works <- read_rds("data_generated/works.rds")



# Prepare data for group pages --------------------------------------------

subgroups <-
  read_csv("data/catalogue_overview.csv") %>%
  fill(file, group) %>%
  filter(!is.na(subgroup)) %>%
  select(group:title) %>%
  nest(subgroups = c(subgroup, title))

work_pages <-
  read_csv("data/catalogue_overview.csv") %>%
  filter(!is.na(group)) %>%
  select(file, group, title) %>%
  left_join(subgroups, by = "group")



# Templates ---------------------------------------------------------------

## Page ----

PAGE_TEMPLATE <- '---
lightbox: true
---

# [{group}]{{.chapter-number}} {title} {{.unnumbered}}

Click on an incipit to see an incipit comprising all instruments and voices.

{page_contents}

![](../images/empty.png)
'

## Subgroup ----

SUBGROUP_TEMPLATE <- '
## [{group}.{subgroup}]{{.header-section-number}} {title} {{.unnumbered}}

{work_list}
'

## Work (overview) ----

WORK_TEMPLATE_OVERVIEW <- '
### [{group}{subgroup}.{number_formatted}]{{.header-section-number}}<br/>{title} {{.unnumbered #work-{group}{subgroup}.{number}}}

{incipits}

|||
|-|-|
|*Identifiers*|{identification}|
|*Sources*|{sources}|
|*Notes*|{notes}|
|*Literature*|{literature}|

: {{tbl-colwidths="[12,87]" .movement-details}}
'



# Generate group pages ----------------------------------------------------

## Functions ----

make_incipits <- function(group, subgroup, number) {
  work_id <- str_flatten(c(group, subgroup, number), "_", na.rm = TRUE)
  target_dir <- str_glue("incipits/{work_id}")

  # no incipit available
  incipit_image <- str_glue("{target_dir}/main_1.svg")
  if (!file_exists(incipit_image)) {
    info("  no incipit available")
    return("(no incipit available)")
  }

  main_incipits <-
    dir_ls(target_dir) %>%
    path_file() %>%
    path_filter("main*")
  info("  found {length(main_incipits)} incipits")

  full_incipits <-
    dir_ls(target_dir) %>%
    path_file() %>%
    path_filter(regexp = "^\\d+")
  info("  found {length(full_incipits)} orchestral incipits")

  if (length(full_incipits) == 0) {
    html_images <-
      map_chr(
        main_incipits,
        \(m) str_glue("![](/{target_dir}/{m}){{.incipit}}")
      ) %>%
      str_flatten("\n\n")
  } else {
    # Quarto does not support lightbox images with a different zoomed image;
    # hence, we create HTML code that shows the corresponding orchestral
    # incipit (1_*.ly) after clicking on the main incipit (main_1.ly)
    html_images <-
      map2_chr(
        main_incipits,
        full_incipits,
        \(m, f) str_glue('<a href="/{target_dir}/{f}" ',
                         'class="lightbox">',
                         '<img src="/{target_dir}/{m}" ',
                         'class="incipit img-fluid"></a>')

      ) %>%
      str_flatten("\n\n")
  }

  html_images
}


make_work_entry <- function(group, subgroup, number, sources, ...) {
  metadata <- list(...)
  work_id <- str_flatten(c(group, subgroup, number), "_", na.rm = TRUE)

  if (file_exists(str_glue("data/works_mei/{work_id}.xml"))) {
    info("Writing detailed entry for {work_id}")
    get_work_details(group, subgroup, number, metadata, sources)
  } else {
    info("Writing overview entry for {work_id}")

    incipits <- make_incipits(group, subgroup, number)

    number_formatted <- number
    if (str_starts(number, "S"))
      number_formatted <- str_glue("[{number}]{{.text-danger}}")
    if (str_starts(number, "L"))
      number_formatted <- str_glue("[{number}]{{.text-warning}}")

    identification <- format_identifiers(metadata, sep = " · ")

    sources <-
      pmap_chr(
        sources,
        \(source, rism_id, ...) {
          GLOBAL_sigla <<- c(GLOBAL_sigla, str_split_1(source, " ")[1])
          if_else(
            is.na(rism_id),
            source,
            use_template(RISM_TEMPLATE, label = source, rism_id = rism_id)
          )
        }
      ) %>%
      str_sort() %>%
      str_flatten(" · ")

    use_template(
      WORK_TEMPLATE_OVERVIEW,
      group = group,
      subgroup = str_flatten(c(".", subgroup)),
      number = number,
      number_formatted = number_formatted,
      title = metadata$title,
      incipits = incipits,
      identification = identification,
      sources = sources,
      notes = metadata$notes,
      literature = str_sort(metadata$literature)
    )
  }
}


make_group_page <- function(file, group, title, subgroups) {
  if (is.null(subgroups)) {
    page_contents <-
      works %>%
      filter(group == {{group}}) %>%
      pmap_chr(make_work_entry) %>%
      str_flatten("\n\n")
  } else {
    page_contents <-
      pmap_chr(
        subgroups,
        \(subgroup, title) {
          work_list <-
            works %>%
            filter(group == {{group}}, subgroup == {{subgroup}}) %>%
            pmap_chr(make_work_entry) %>%
            str_flatten("\n\n")
          use_template(
            SUBGROUP_TEMPLATE,
            group = group,
            subgroup = subgroup,
            title = title,
            work_list = work_list
          )
        }
      ) %>%
      str_flatten("\n\n")
  }

  use_template(
    PAGE_TEMPLATE,
    group = group,
    title = title,
    page_contents = page_contents
  ) %>%
    write_file(str_glue("groups/{file}.qmd"))
}


## Run ----

if (dir_exists("groups")) dir_delete("groups")
if (dir_exists("_book/incipits")) dir_delete("_book/incipits")
if (dir_exists("_book/metadata")) dir_delete("_book/metadata")

dir_create("groups")
dir_copy("data/works_mei", "_book/metadata")
pwalk(work_pages, make_group_page)

dir_copy("incipits", "_book/incipits")



# Generate overview page --------------------------------------------------

info("Generating overview table")

overview_template <- '---
format:
  html:
    html-table-processing: none
---

Currently, the catalogue describes {n_works} works, comprising

- [{n_ascertained} works]{{.text-info}} with *ascertained or likely* authorship
- [{n_lost} works]{{.text-warning}} that have been *lost* but whose existence is sufficiently supported by literature
- [{n_spurious} works]{{.text-danger}} with *uncertain or spurious* attribution


# Overview of works {{.unnumbered}}

```{{=html}}
{overview_table}
```
'

n_works <- nrow(works)
n_lost <-
  works %>%
  filter(str_starts(number, "L")) %>%
  nrow()
n_spurious <-
  works %>%
  filter(str_starts(number, "S")) %>%
  nrow()
n_ascertained <-
  n_works - n_lost - n_spurious

overview_table_count <-
  works %>%
  unite(group, subgroup, col = "group", sep = ".", na.rm = TRUE) %>%
  summarise(
    .by = group,
    n = n(),
    l = sum(str_starts(number, "L")),
    s = sum(str_starts(number, "S")),
    a = n - l -s,
  ) %>%
  mutate(
    work_count = str_glue(
      '{n} works: <span class="text-info">{a}</span> + ',
      '<span class="text-warning">{l}</span> + ',
      '<span class="text-danger">{s}</span>'
    )
  ) %>%
  select(group, work_count)

overview_table_groups <-
  work_pages %>%
  select(file, group, group_name = title) %>%
  left_join(
    subgroups %>% unnest(subgroups),
    by = "group"
  ) %>%
  unite(group, subgroup, col = "group", sep = ".", na.rm = TRUE) %>%
  left_join(
    overview_table_count,
    by = "group"
  ) %>%
  unite(group_name, title, col = "group_name", sep = ": ", na.rm = TRUE) %>%
  mutate(group_name = str_glue("**{group_name}** ({work_count})"))

overview_table_details <-
  tibble(
    WerW =
      dir_ls("data/works_mei", type = "file") %>%
      str_extract("works_mei/(.*)\\.xml$", group = 1),
    Metadata = str_glue("[XML](/metadata/{WerW}.xml)"),
  ) %>%
  mutate(WerW = str_replace_all(WerW, "_", "."))

overview_table <-
  works %>%
  unite(group, subgroup, col = "group", sep = ".", na.rm = TRUE) %>%
  left_join(overview_table_groups, by = "group") %>%
  unite(group, number, col = "WerW", sep = ".", remove = FALSE) %>%
  left_join(overview_table_details, by = "WerW") %>%
  mutate(
    number = case_when(
      str_starts(number, "S") ~
        str_glue('<span class="text-danger">{number}</span>'),
      str_starts(number, "L") ~
        str_glue('<span class="text-warning">{number}</span>'),
      .default = number
    ),
    label = if_else(is.na(Metadata), "summary", "details"),
    Description = str_glue("[{label}](/groups/{file}.html#work-{WerW})"),
    Metadata = replace_na(Metadata, "")
  ) %>%
  unite(group, number, col = "WerW", sep = ".") %>%
  select(group_name, WerW, Title = title, Description, Metadata) %>%
  gt(groupname_col = "group_name", process_md = TRUE) %>%
  fmt_markdown(columns = c("WerW", "Description", "Metadata")) %>%
  tab_options(
    column_labels.font.weight = "bold",
    row_group.background.color = "grey90",
    row_group.font.weight =
  ) %>%
  as_raw_html(FALSE)

use_template(
  overview_template,
  n_works = n_works,
  n_ascertained = n_ascertained,
  n_lost = n_lost,
  n_spurious = n_spurious,
  overview_table = overview_table
) %>%
  write_file("groups/overview.qmd")



# Generate list of abbreviations ------------------------------------------

info("Generating list of abbreviations")

abbreviations_template <- '# Abbreviations {{.unnumbered}}

## Instrument names

Generally, scoring abbreviations as defined by
[RISM](https://opac.rism.info/scoring-abbreviations) are used.

{instruments}

## Libraries

Generally, library sigla as defined by
[RISM](https://rism.info/community/sigla.html) are used.

{sigla}'

instruments <-
  GLOBAL_instruments %>%
  str_remove("\\d+$") %>%
  str_trim() %>%
  unique() %>%
  as_tibble_col("abbreviation") %>%
  left_join(
    read_csv("data/instrument_abbreviations.csv"),
    by = "abbreviation"
  ) %>%
  arrange(abbreviation, .locale = "en") %>%
  pmap_chr(
    \(abbreviation, name) {
      str_glue("|*{abbreviation}*|{name}|")
    }
  ) %>%
  str_flatten("\n")

instruments <-
  paste(
    "|||",
    "|-|-|",
    instruments,
    "",
    ': {tbl-colwidths="[15,85]" .movement-details}',
    "",
    sep = "\n"
  )

sigla <-
  GLOBAL_sigla %>%
  unique() %>%
  as_tibble_col("siglum") %>%
  left_join(
    read_csv("data/library_sigla.csv"),
    by = "siglum"
  ) %>%
  arrange(siglum) %>%
  pmap_chr(
    \(siglum, name, rism, url) {
      if (!is.na(url))
        url <- str_glue("[website]({url})")
      if (!is.na(rism))
        rism <- str_glue("[RISM](https://rism.online/institutions/{rism})")
      links <- str_flatten_comma(c(url, rism), na.rm = TRUE)
      if (links != "")
        links <- paste0("(", links, ")")
      str_glue("{siglum}\n: {name} {links}")
    }
  ) %>%
  str_flatten("\n\n")

use_template(
  abbreviations_template,
  instruments = instruments,
  sigla = sigla
) %>%
  write_file(str_glue("abbreviations.qmd"))
