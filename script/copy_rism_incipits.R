library(tidyverse)
library(fs)
source("script/utils.R")



# Load data ---------------------------------------------------------------

works <-
  read_csv("data_generated/works.csv", col_types = cols(.default = "c")) %>%
  nest(.by = group:title, .key = "sources")



# Copy incipits -----------------------------------------------------------

copy_incipit <- function(group, subgroup, number, sources, ...) {
  work_id <- str_flatten(c(group, subgroup, number), "_", na.rm = TRUE)
  rism_id <- str_flatten(sources$rism_id, "|", na.rm = TRUE)
  source <- dir_ls("data_generated/rism_incipits/", regexp = rism_id)[1]
  target <- str_glue("incipits/{work_id}/main.svg")
  target_png <- str_glue("incipits/{work_id}/main.png")

  if (is.na(source))
    info("{work_id}: No incipit available")
  else if (file_exists(target) | file_exists(target_png))
    info("{work_id}: Incipit already exists")
  else {
    info("{work_id}: Copying {path_file(source)} to {target}")
    dir_create(path_dir(target))
    file_copy(source, target)
  }
}

pwalk(
  works,
  copy_incipit
)
