library(tidyverse)
library(gt)
library(openxlsx)



# Load data ---------------------------------------------------------------

incipits <-
  read_csv("data/incipits.csv") %>% 
  rename(notes = file, incipit = label) %>% 
  mutate(notes = str_glue("{work_id}-{incipit_id}")) %>%
  filter(incipit_id == 0) %>% 
  select(!incipit_id) %>% 
  relocate(text, .after = last_col())

works <-
  read_csv("data/works.csv") %>% 
  select(!incipit_data) %>% 
  left_join(incipits, by = "work_id") %>%
  replace_na(list(
    incipit = "(no incipit)",
    notes = "empty",
    text = ""
  )) %>% 
  {.}



# Assemble tables ---------------------------------------------------------

## Functions ----

save_html_table <- function(table, file) {
  tbl <- 
    gt(table) %>%
    fmt_image(notes, file_pattern = "data/incipits/png/{x}.png") %>% 
    cols_align("left", notes) %>% 
    opt_interactive(
      use_pagination = FALSE,
      use_search = TRUE,
      use_filters = TRUE,
      use_highlight = TRUE
    )
  gtsave(tbl, str_glue("{file}.html"))
  tbl
}

save_spreadsheet <- function(table, file, sheet_name = "Sheet1") {
  wb <- createWorkbook()
  addWorksheet(wb, sheet_name)
  writeData(
    wb,
    sheet_name,
    table,
    headerStyle = createStyle(textDecoration = "bold")
  ) 
  freezePane(wb, sheet_name, firstRow = TRUE) 
  setColWidths(wb, sheet_name, 1:ncol(table), "auto") 
  saveWorkbook(wb, str_glue("{file}.xlsx"), overwrite = TRUE)
}


## All works ----

save_html_table(works, "tables/all_works")
save_spreadsheet(works, "tables/all_works")


## by library ---

works %>% 
  group_split(siglum) %>% 
  map(\(df) save_html_table(df, str_glue("tables/{df$siglum[1]}")))
