library(tidyverse)
library(openxlsx)
library(fs)



# Logging -----------------------------------------------------------------

default_logger <- log4r::logger(
  threshold = "DEBUG",
  appenders = list(
    log4r::console_appender(),
    log4r::file_appender("data_generated/catalogue.log", append = FALSE)
  )
)

debug <- function(..., .envir = parent.frame()) {
  log4r::debug(default_logger, glue::glue(..., .envir = .envir))
}

info <- function(..., .envir = parent.frame()) {
  log4r::info(default_logger, glue::glue(..., .envir = .envir))
}

warn <- function(..., .envir = parent.frame()) {
  log4r::warn(default_logger, glue::glue(..., .envir = .envir))
}

error <- function(..., .envir = parent.frame()) {
  log4r::error(default_logger, glue::glue(..., .envir = .envir))
}

summarise_loglevels <- function() {
  logfile <- read_lines("data_generated/catalogue.log")
  errors <- logfile %>% str_starts("ERROR") %>% sum()
  warnings <- logfile %>% str_starts("WARN") %>% sum()
  info("Log summary: {errors} errors, {warnings} warnings")
}



# Tables ------------------------------------------------------------------

save_table <- function(tables,
                       filename,
                       sheet_name = "Sheet1",
                       gray_rows = NULL) {
  wb <- createWorkbook()
  style_gray <- createStyle(fontColour = "gray50")

  # ensure that tables is a named list
  if (inherits(tables, "list")) {
    if (is.null(names(tables)))
      tables <- set_names(tables, paste0("Sheet", seq_along(tables)))
  } else if (inherits(tables, "data.frame")) {
    tables <- list(tables) %>% set_names(sheet_name)
  } else {
    stop("'tables' must be a data frame or list of data frames.")
  }

  # populate Excel file with worksheets
  iwalk(
    tables,
    function(table, sheet_name) {
      addWorksheet(wb, sheet_name)
      writeData(
        wb,
        sheet_name,
        table,
        headerStyle = createStyle(textDecoration = "bold")
      )
      if (!is.null(gray_rows))
        addStyle(wb, sheet_name, style = style_gray,
                 rows = gray_rows + 1, cols = 1:ncol(table), gridExpand = TRUE)
      freezePane(wb, sheet_name, firstRow = TRUE)
      setColWidths(wb, sheet_name, 1:ncol(table), "auto")
    }
  )

  saveWorkbook(wb, filename, overwrite = TRUE)
}



# Templates ---------------------------------------------------------------

# fill in a glue string, ensure that NAs and NULLs are not printed
use_template <- function(template, ...) {
  glue::glue_data(list(...), template, .null = "", .na = "") %>%
    as.character()
}
