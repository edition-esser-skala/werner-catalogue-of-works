library(tidyverse)
library(yaml)
source("script/utils.R")
options(readr.show_col_types = FALSE)



# Parameters --------------------------------------------------------------

params <- read_yaml("data/config.yml")
cols_library <- params$catalogue_columns$library
cols_metadata <- c(
  params$catalogue_columns$metadata,
  names(params$catalogue_columns$identifiers)
)



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
rism_missing <- read_csv("data/works_missing_in_rism.csv", comment = "#")

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

check_empty <- function(df) {
  if (nrow(df) != 0) {
    print(df)
    stop("The table above should be empty")
  }
  invisible(df)
}

# numbers are consecutive within group, subgroup, and type
catalogue %>%
  separate_wider_regex(
    number,
    c(type = "[LS]?", number = "\\d+")
  ) %>%
  mutate(
    .after = number,
    .by = group:type,
    running_number = row_number()
  ) %>%
  filter(number != running_number) %>%
  check_empty()

# there is no overlap between works with and without RISM entry
inner_join(
  rism_entries,
  rism_missing,
  by = join_by(siglum, shelfmark)
) %>%
  check_empty()

# all catalogue entries with unique siglum are in the list of known works
catalogue_all %>%
  filter(is.na(rism_id)) %>%
  anti_join(known_works, by = join_by(siglum, shelfmark)) %>%
  arrange(siglum, shelfmark) %>%
  check_empty()

# all catalogue entries with shared siglum are in RISM
catalogue_all %>%
  filter(!is.na(rism_id)) %>%
  anti_join(rism_entries, by = join_by(siglum, shelfmark, rism_id)) %>%
  check_empty()

# all known works not in RISM are cited in the catalogue
rism_missing %>%
  anti_join(catalogue_all, by = join_by(siglum, shelfmark)) %>%
  check_empty()

# all RISM entries are cited in the catalogue
rism_entries %>%
  anti_join(catalogue_all, by = join_by(siglum, shelfmark)) %>%
  check_empty()



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
  select(group:number, any_of(cols_metadata)) %>%
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

table_work_list <-
  catalogue %>%
  distinct(group, subgroup, number) %>%
  left_join(
    catalogue_all_with_rism %>%
      separate_wider_delim(
        source,
        delim = " ",
        names = c("siglum", "shelfmark"),
        too_many = "merge"
      ),
    by = join_by(group, subgroup, number)
  ) %>%
  filter(!is.na(siglum))

gray_rows <-
  table_work_list %>%
  unite(group:number, col = "id", sep = ".", na.rm = TRUE) %>%
  mutate(same = id == lag(id)) %>%
  pull(same) %>%
  which()

save_table(
  table_work_list,
  "data_generated/works_list.xlsx",
  gray_rows = gray_rows
)
