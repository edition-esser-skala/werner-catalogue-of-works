library(tidyverse)
library(gt)
library(fs)



# Load data ---------------------------------------------------------------

incipits <-
  read_csv(
    "data_generated/rism_incipits.csv",
    col_types = cols(.default = "c")
  ) %>%
  distinct(rism_id, .keep_all = TRUE) %>%
  unite(
    rism_id, work, movement, excerpt,
    col = "filename",
    sep = "-",
    remove = FALSE
  ) %>%
  select(rism_id, instrument, key, filename, text)

works <-
  read_csv("data_generated/rism_entries.csv") %>%
  left_join(incipits, by = "rism_id")


# Assemble tables ---------------------------------------------------------

## Functions ----

save_html_table <- function(table, file) {
  tbl <-
    gt(table) %>%
    fmt_image(filename, file_pattern = "data_generated/rism_incipits/{x}.svg") %>%
    cols_align("left", filename) %>%
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
