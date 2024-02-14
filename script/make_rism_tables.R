library(tidyverse)
library(gt)
library(fs)



# Load data ---------------------------------------------------------------

incipits <-
  read_csv("data_generated/rism_incipits.csv") %>%
  rename(notes = file, incipit = label) %>%
  mutate(notes = str_glue("{work_id}-{incipit_id}")) %>%
  filter(incipit_id == 0) %>%
  select(!incipit_id) %>%
  relocate(text, .after = last_col())

works <-
  read_csv("data_generated/rism_entries.csv") %>%
  select(!incipit_data) %>%
  left_join(incipits, by = "work_id") %>%
  replace_na(list(
    incipit = "(no incipit)",
    notes = "empty",
    text = ""
  ))



# Assemble tables ---------------------------------------------------------

## Functions ----

save_html_table <- function(table, file) {
  tbl <-
    gt(table) %>%
    fmt_image(notes, file_pattern = "data_generated/rism_incipits/{x}.svg") %>%
    cols_align("left", notes) %>%
    opt_interactive(
      use_pagination = FALSE,
      use_search = TRUE,
      use_filters = TRUE,
      use_highlight = TRUE
    )
  gtsave(tbl, str_glue("{file}.html"))
}


## All works ----

dir_create("data_generated/rism_tables")
save_html_table(works, "data_generated/rism_tables/all_works")


## by library ---

works %>%
  group_split(siglum) %>%
  walk(\(df) save_html_table(df, str_glue("data_generated/rism_tables/{df$siglum[1]}")))
