library(tidyverse)
library(readODS)
library(fs)



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



# Validation --------------------------------------------------------------

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
  filter(siglum != "A-Wn", siglum != "A-KRB") %>%  # line should evtl be removed
  anti_join(catalogue_all, by = join_by(siglum, shelfmark)) %>%
  nrow() == 0



# Make work pages ---------------------------------------------------------

available_incipits <-
  read_csv("data_generated/rism_entries.csv") %>%
  select(rism_id, work_id) %>%
  semi_join(read_csv("data_generated/rism_incipits.csv"), by = "work_id") %>%
  mutate(file = str_glue("../data_generated/rism_incipits/{work_id}-0.svg")) %>%
  select(!work_id)

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




page_template <- '---
page-navigation: false
---

# [{group}]{{.chapter-number}} {title} {{.unnumbered}}

{work_list}
'

subgroup_template <- '
## [{group}.{subgroup}]{{.header-section-number}} {title} {{.unnumbered}}

{work_list}
'

work_template <- '
### [{group}.{number}]{{.header-section-number}} {title} {{.unnumbered}}

key
: {key}

sources
: {sources}

incipit
: {incipit}
'

make_work_entry <- function(number, group, title, key, sources, ...) {
  manual_incipit <- str_glue("data/incipits/{group}.{number}.png")
  if (file_exists(manual_incipit))
    incipit <- str_glue("../{manual_incipit}")
  else
    incipit <-
      sources$file %>%
      na.omit() %>%
      pluck(1)
  if (is.null(incipit))
    incipit <- "(none)"
  else
    incipit <- str_glue("![]({incipit}){{width=80%}}")

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


  str_glue(work_template)
}

# make_work_entry("1", "B", "C", "D", catalogue_all_with_rism$sources[[1]])
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
          unite(group, subgroup, col = "group", sep = ".") %>%
          pmap(make_work_entry) %>%
          str_flatten("\n\n")
        str_glue(subgroup_template)
      }
    ) %>%
      str_flatten("\n\n")
  }
  str_glue(page_template) %>%
    write_file(str_glue("works/{file}.qmd"))
}

# pmap(work_pages[4, ], make_group_page)
# pmap(work_pages[2, ], make_group_page)

if (dir_exists("works")) dir_delete("works")
dir_create("works")
pwalk(work_pages, make_group_page)
