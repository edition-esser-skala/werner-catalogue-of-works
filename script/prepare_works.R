library(tidyverse)
library(fs)
library(gt)
source("script/utils.R")

library(reticulate)
reticulate::use_virtualenv("renv/python/virtualenvs/renv-python-3.12")
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
  pageMarginTop = 0,
  scale = 33
)))



# Load data ---------------------------------------------------------------

# (1) the manually curated catalogue of works
catalogue <- read_csv(
  "data/catalogue_works.csv",
  col_types = cols(subgroup = "i", number = "i", .default = "c")
)

# (2) known individual works/copies
# (a) RISM entries
rism_entries <-
  read_csv(
    "data/works_in_rism.csv",
    col_types = cols(.default = "c")
  ) %>%
  select(siglum, shelfmark, title, rism_id)

# (b) works missing in RISM
rism_missing <- read_csv("data/works_missing_in_rism.csv")

# (a+b) all known works
known_works <- bind_rows(rism_entries, rism_missing)



# Create catalogue in long form -------------------------------------------

catalogue_siglum <-
  catalogue %>%
  select(group:title, `A-Ed`:`H-VEs`) %>%
  pivot_longer(
    !group:title,
    names_to = "siglum",
    values_to = "shelfmark"
  ) %>%
  filter(!is.na(shelfmark)) %>%
  separate_longer_delim(shelfmark, " | ")

catalogue_other <-
  catalogue %>%
  select(group:title, other) %>%
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
  arrange(group, subgroup, number) %>%
  separate_wider_regex(
    shelfmark,
    c(shelfmark = ".*", " \\[", rism_id = "\\d+", "\\]"),
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
  filter(is.na(rism_id)) %>%
  anti_join(known_works, by = join_by(siglum, shelfmark)) %>%
  arrange(siglum, shelfmark) %>%
  nrow() == 0

# all catalogue entries with shared siglum are in RISM
catalogue_all %>%
  filter(!is.na(rism_id)) %>%
  anti_join(rism_entries, by = join_by(siglum, shelfmark, rism_id)) %>%
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
      filter(is.na(rism_id)) %>%
      select(!rism_id) %>%
      left_join(
        rism_entries %>% select(!title),
        by = join_by(siglum, shelfmark)
      ),
    catalogue_all %>%
      filter(!is.na(rism_id)) %>%
      left_join(
        rism_entries %>% select(!title),
        by = join_by(siglum, shelfmark, rism_id)
      )
  ) %>%
  select(group:number, siglum, shelfmark, rism_id) %>%
  left_join(available_incipits, by = "rism_id") %>%
  unite(siglum, shelfmark, col = "source", sep = " ") %>%
  nest(.by = group:number, .key = "sources")

works <-
  catalogue %>%
  select(group:title) %>%
  left_join(
    catalogue_all_with_rism,
    by = join_by(group, subgroup, number)
  )

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

{work_list}
'

subgroup_template <- '
## [{group}.{subgroup}]{{.header-section-number}} {title} {{.unnumbered}}

{work_list}
'

work_template <- '
### [{group}{subgroup}.{number}]{{.header-section-number}} {title} {{.unnumbered #work-{group}{subgroup}.{number}}}

{incipit}

**Sources:**&ensp;{sources}

{details}
'



# Generate group pages ----------------------------------------------------

## Functions ----

make_incipit <- function(group, number, sources) {
  target_dir <- str_glue("incipits/{group}_{number}")
  dir_create(target_dir)

  # (1) use manually created incipits
  # (a) in PNG format
  incipit_image <- str_glue("{target_dir}/main.png")
  if (file_exists(incipit_image)) {
    info("Found '{incipit_image}'")
    # Quarto currently does not support lightbox images with a different zoomed
    # image; hence, we create HTML code that shows the first orchestral incipit
    # of the work (1_*.ly) after clicking on the main incipit
    full_incipit <-
      dir_ls(target_dir) %>%
      path_file() %>%
      path_ext_remove() %>%
      path_filter("1*") %>%
      path_filter("*_low", invert = TRUE)

    return(str_glue('<a href="/{target_dir}/{full_incipit}.png" ',
                    'class="lightbox">',
                    '<img src="/{target_dir}/main_low.png" ',
                    'class="incipit img-fluid"></a>'))
  }

  # (b) in SVG format
  incipit_image <- str_glue("{target_dir}/main.svg")
  if (file_exists(incipit_image)) {
    info("Found '{incipit_image}'")
    return(str_glue("![](/{target_dir}/main.svg){{.incipit}}"))
  }

  # (2) omit incipit
  # (a) no sources
  if (is.null(sources)) {
    info("No incipit for '{incipit_image}' (no sources)")
    return("(no incipit – music unknown)")
  }

  # (b) no incipit in RISM
  incipit <-
    sources %>%
    filter(!is.na(work)) %>%
    head(1)
  if (nrow(incipit) == 0) {
    info("No incipit for '{incipit_image}' (none in RISM)")
    return("(incipit TBD)")
  }

  # (3) use incipit from RISM
  verovio_tk$loadData(incipit$pae)
  success <- verovio_tk$renderToSVGFile(incipit_image)
  if (success)
    info("Rendered '{incipit_image}' with Verovio")
  else
    warn("Error rendering {incipit_image}")

  return(str_glue("![](/{target_dir}/main.svg){{.incipit}}"))
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

make_work_entry <- function(group, subgroup, number, title, sources, ...) {
  if (!is.na(subgroup)) {
    group_subgroup <- str_c(group, subgroup, sep = "_")
    subgroup <- paste0(".", subgroup)
  } else {
    group_subgroup <- group
    subgroup <- ""
  }

  info("Writing entry for {group_subgroup}_{number}")
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
