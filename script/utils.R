# Logging -----------------------------------------------------------------

default_logger <- log4r::logger(threshold = "DEBUG")

debug <- function(..., .envir = parent.frame()) {
  log4r::debug(default_logger, glue::glue(..., .envir = .envir))
}

info <- function(..., .envir = parent.frame()) {
  log4r::info(default_logger, glue::glue(..., .envir = .envir))
}

warn <- function(..., .envir = parent.frame()) {
  log4r::warn(default_logger, glue::glue(..., .envir = .envir))
}
