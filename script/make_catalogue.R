library(tidyverse)
source("script/utils.R")



# Parameters --------------------------------------------------------------

# columns in data/catalogue_works.csv with that correspond to a library
cols_library <- c(
  "A-Ed", "A-El", "A-GÖ", "A-HE", "A-KN", "A-Wgm", "A-WIL", "A-Wn",
  "CZ-Pak", "D-B", "H-Bn", "H-Gk", "H-VEs"
)

# columns that contain other metadata,
# e.g., title, catalogue of works numbers, references, notes
cols_metadata <- c("title",
                   "Dopf", "WinMa", "PetWe", "PetSi", "HarIn",
                   "literature", "notes")



# Load data ---------------------------------------------------------------

# (1) the manually curated catalogue of works
catalogue <- read_csv(
  "data/catalogue_works.csv",
  col_types = cols(.default = "c")
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
  select(group:title, all_of(cols_library)) %>%
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
  {stopifnot(nrow(.) == 0)}

# all catalogue entries with unique siglum are in the list of known works
catalogue_all %>%
  filter(is.na(rism_id)) %>%
  anti_join(known_works, by = join_by(siglum, shelfmark)) %>%
  arrange(siglum, shelfmark) %>%
  {stopifnot(nrow(.) == 0)}

# all catalogue entries with shared siglum are in RISM
catalogue_all %>%
  filter(!is.na(rism_id)) %>%
  anti_join(rism_entries, by = join_by(siglum, shelfmark, rism_id)) %>%
  {stopifnot(nrow(.) == 0)}

# all known works not in RISM are cited in the catalogue
# NOTE: A-Wn entries are currently ignored,
#       since the Fonds Moder has not been screened!
rism_missing %>%
  anti_join(catalogue_all, by = join_by(siglum, shelfmark)) %>%
  filter(siglum != "A-Wn") %>%  # line should eventually be removed
  {stopifnot(nrow(.) == 0)}

# all RISM entries are cited in the catalogue
rism_entries %>%
  anti_join(catalogue_all, by = join_by(siglum, shelfmark)) %>%
  {stopifnot(nrow(.) == 0)}



# Create catalogue with RISM IDs ------------------------------------------

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
  unite(siglum, shelfmark, col = "source", sep = " ")

works <-
  catalogue %>%
  select(group:number, all_of(cols_metadata)) %>%
  left_join(
    catalogue_all_with_rism %>%
      nest(.by = group:number, .key = "sources"),
    by = join_by(group, subgroup, number)
  )



# Save data ---------------------------------------------------------------

works %>% write_rds("data_generated/works.rds")

catalogue_all_with_rism %>%
  separate_wider_delim(
    source,
    delim = " ",
    names = c("siglum", "shelfmark"),
    too_many = "merge"
  ) %>%
  filter(!is.na(siglum)) %>%
  {split(., .$siglum)} %>%
  save_table("data_generated/works_by_library.xlsx")
