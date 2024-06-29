library(tidyverse)
library(fs)
library(gt)
source("script/utils.R")



# Load data ---------------------------------------------------------------

works <-
  read_csv("data_generated/works.csv", col_types = cols(.default = "c")) %>%
  nest(.by = group:title, .key = "sources")



# Prepare data for group pages --------------------------------------------

## Data frames ----

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


## Templates ----

page_template <- '---
lightbox: true
---

# [{group}]{{.chapter-number}} {title} {{.unnumbered}}

Click on an incipit to see an incipit comprising all instruments and voices.

{work_list}

![](../images/empty.png)
'

subgroup_template <- '
## [{group}.{subgroup}]{{.header-section-number}} {title} {{.unnumbered}}

{work_list}
'

work_template <- '
### [{group}{subgroup}.{number}]{{.header-section-number}}<br/>{title} {{.unnumbered #work-{group}{subgroup}.{number}}}

{incipit}

**Sources:**&ensp;{sources}

{details}
'



# Generate group pages ----------------------------------------------------

## Functions ----

make_incipit <- function(group, number) {
  target_dir <- str_glue("incipits/{group}_{number}")

  # (1) PNG incipits available
  incipit_image <- str_glue("{target_dir}/main_1.png")
  if (file_exists(incipit_image)) {
    main_incipits <-
      dir_ls(target_dir) %>%
      path_file() %>%
      path_ext_remove() %>%
      path_filter("main*low")
    info("  … found {length(main_incipits)} incipits '{incipit_image}' etc")

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
  incipit_image <- str_glue("{target_dir}/main.svg")
  if (file_exists(incipit_image)) {
    info("  … found '{incipit_image}'")
    return(str_glue('<img src="/{target_dir}/main.svg" ',
                    'class="incipit img-fluid">'))
  }

  # (3) no incipit available
  info("  … no incipit available")
  return("(incipit TBD)")
}


make_work_entry <- function(group, subgroup, number, title, sources, ...) {
  if (!is.na(subgroup)) {
    group_subgroup <- str_c(group, subgroup, sep = "_")
    subgroup <- paste0(".", subgroup)
  } else {
    group_subgroup <- group
    subgroup <- ""
  }

  info("Writing entry for {group_subgroup}_{number}")
  incipit <- make_incipit(group_subgroup, number)
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


## Run ----

if (dir_exists("groups")) dir_delete("groups")
if (dir_exists("_book/incipits")) dir_delete("_book/incipits")
if (dir_exists("_book/works")) dir_delete("_book/works")

dir_create("groups")
dir_copy("data/works_html", "_book/works")
dir_copy("data/works_mei", "_book/works/metadata")
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
  unite(group, subgroup, col = "group", sep = ".", na.rm = TRUE) %>%
  {.}

overview_table_details <-
  tibble(
    WerW =
      dir_ls("data/works_html", type = "file") %>%
      str_extract("works_html/(.*)\\.html$", group = 1),
    Details = str_glue("[details](/works/{WerW}.html)"),
    Metadata = str_glue("[XML](/works/metadata/{WerW}.xml)"),
  ) %>%
  mutate(WerW = str_replace_all(WerW, "_", "."))

overview_table <-
  works %>%
  unite(group, subgroup, col = "group", sep = ".", na.rm = TRUE) %>%
  left_join(overview_table_groups, by = "group") %>%
  unite(group, number, col = "WerW", sep = ".") %>%
  mutate(Summary = str_glue("[summary](/groups/{file}.html#work-{WerW})")) %>%
  select(group_name, WerW, Title = title, Summary) %>%
  left_join(overview_table_details, by = "WerW") %>%
  mutate(
    Details = replace_na(Details, ""),
    Metadata = replace_na(Metadata, "")
  ) %>%
  gt(groupname_col = "group_name") %>%
  fmt_markdown(columns = c("Details", "Summary", "Metadata")) %>%
  tab_options(
    column_labels.font.weight = "bold",
    row_group.background.color = "grey90",
    row_group.font.weight =
  ) %>%
  as_raw_html(FALSE) %>%
  {.}

str_glue(overview_template) %>%
  write_file("groups/overview.qmd")
