library(tidyverse)
library(readODS)
library(fs)
library(gt)



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

work_pages <-
  read_ods("data/catalogue.ods", sheet = "overview") %>%
  filter(!is.na(file))

page_template <- '---
page-navigation: false
---

# {title}

{works}
'

work_template <- '
### {grp}.{no}<br/>{title} {{.unnumbered}}

key
: {key}

sources
: {sish}

incipit
: ![](../data/incipits/{grp}{no}){{width=80%}}
'

make_work_page <- function(file, title, grp) {
  works <-
    catalogue %>%
    select(ID:key) %>%
    left_join(
      catalogue_all %>%
        select(ID, siglum, shelfmark) %>%
        unite(siglum, shelfmark, col = "sish", sep = " ") %>%
        summarise(
          .by = ID,
          sish = str_flatten(sish, " · ")
        ),
      by = "ID"
    ) %>%
    filter(grp == {{grp}}) %>%
    select(!c(ID, grp)) %>%
    pmap(\(no, title, key, sish) str_glue(work_template)) %>%
    str_flatten("\n\n")

  str_glue(page_template) %>%
    write_file(str_glue("works/{file}.qmd"))
}

# make_grp_page("masses", "Masses", "B")
if (dir_exists("works")) dir_delete("works")
dir_create("works")
pwalk(work_pages, make_work_page)


