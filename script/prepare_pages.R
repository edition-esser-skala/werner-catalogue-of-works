library(tidyverse)
library(fs)
library(gt)
source("script/utils.R")
source("script/parse_mei.R")



# Parameters --------------------------------------------------------------

# columns names in the works table with catalogue of works numbers
cols_identifiers <- c("Dopf", "WK")



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
### [{group}{subgroup}.{number}]{{.header-section-number}}<br/>{title} {{.unnumbered #work-{group}{subgroup}.{number}}}

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

  # (1) PNG incipits available
  incipit_image <- str_glue("{target_dir}/main_1.png")
  if (file_exists(incipit_image)) {
    main_incipits <-
      dir_ls(target_dir) %>%
      path_file() %>%
      path_ext_remove() %>%
      path_filter("main*low")
    info("  found {length(main_incipits)} incipits '{incipit_image}' etc")

    # Quarto currently does not support lightbox images with a different zoomed
    # image; hence, we create HTML code that shows the first orchestral incipit
    # of the work (1_*.ly) after clicking on the main incipit
    full_incipits <-
      dir_ls(target_dir) %>%
      path_file() %>%
      path_ext_remove() %>%
      path_filter(regexp = "^\\d+") %>%
      path_filter("*_low", invert = TRUE)

    html_images <-
      map2_chr(
        main_incipits,
        full_incipits,
        \(m, f) str_glue('<a href="/{target_dir}/{f}.png" ',
                         'class="lightbox">',
                         '<img src="/{target_dir}/{m}.png" ',
                         'class="incipit img-fluid"></a>')

      ) %>%
      str_flatten("\n\n")

    return(html_images)
  }

  # (2) SVG incipit available
  incipit_image <- str_glue("{target_dir}/main_1.svg")
  if (file_exists(incipit_image)) {
    info("  found '{incipit_image}'")
    return(str_glue('<img src="/{target_dir}/main_1.svg" ',
                    'class="incipit img-fluid">'))
  }

  # (3) no incipit available
  info("  no incipit available")
  "(no incipit available)"
}


make_work_entry <- function(group, subgroup, number, sources, ...) {
  metadata <- list(...)
  work_id <- str_flatten(c(group, subgroup, number), "_", na.rm = TRUE)

  if (file_exists(str_glue("data/works_mei/{work_id}.xml"))) {
    info("Writing detailed entry for {work_id}")
    get_work_details(group, subgroup, number)
  } else {
    info("Writing overview entry for {work_id}")

    incipits <- make_incipits(group, subgroup, number)

    identification <-
      map_chr(
        cols_identifiers,
        \(catalogue) str_c(catalogue, pluck(metadata, catalogue), sep = " ")
      ) %>%
      str_flatten(" · ", na.rm = TRUE)

    sources <-
      pmap_chr(
        sources,
        \(source, rism_id, ...)
        if_else(
          is.na(rism_id),
          source,
          use_template(RISM_TEMPLATE, label = source, rism_id = rism_id)
        )
      ) %>%
      str_flatten(" · ")

    use_template(
      WORK_TEMPLATE_OVERVIEW,
      group = group,
      subgroup = str_flatten(c(".", subgroup)),
      number = number,
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

overview_template <- '---
format:
  html:
    html-table-processing: none
---

# Overview of works {{.unnumbered}}

```{{=html}}
{overview_table}
```
'

overview_table_groups <-
  work_pages %>%
  select(file, group, group_name = title) %>%
  left_join(
    subgroups %>% unnest(subgroups),
    by = "group"
  ) %>%
  unite(group_name, title, col = "group_name", sep = ": ", na.rm = TRUE) %>%
  unite(group, subgroup, col = "group", sep = ".", na.rm = TRUE)

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
  unite(group, number, col = "WerW", sep = ".") %>%
  left_join(overview_table_details, by = "WerW") %>%
  mutate(
    label = if_else(is.na(Metadata), "summary", "summary & details"),
    Description = str_glue("[{label}](/groups/{file}.html#work-{WerW})"),
    Metadata = replace_na(Metadata, "")
  ) %>%
  select(group_name, WerW, Title = title, Description, Metadata) %>%
  gt(groupname_col = "group_name") %>%
  fmt_markdown(columns = c("Description", "Metadata")) %>%
  tab_options(
    column_labels.font.weight = "bold",
    row_group.background.color = "grey90",
    row_group.font.weight =
  ) %>%
  as_raw_html(FALSE)

str_glue(overview_template) %>%
  write_file("groups/overview.qmd")
