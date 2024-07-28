library(tidyverse)
library(fs)
source("script/utils.R")



# Load data ---------------------------------------------------------------

TARGET_DIR <- "data_generated/rism_incipits"

works <- read_rds("data_generated/works.rds")

rism_incipits <-
  read_csv("data_generated/rism_incipits.csv") %>%
  distinct(rism_id, .keep_all = TRUE) |>
  select(rism_id, pae) |>
  deframe()



# Create incipits -----------------------------------------------------------

write_pae_incipit <- function(group, subgroup, number, sources, ...) {
  work_id <- str_flatten(c(group, subgroup, number), "_", na.rm = TRUE)
  rism_ids <- na.omit(sources$rism_id)

  if (length(rism_ids) == 0) {
    info("{work_id}: No RISM entry available")
    return()
  }

  incipit_pae <- rism_incipits[rism_ids[1]]
  if (is.na(incipit_pae)) {
    info("{work_id}: No incipit available in RISM")
    return()
  }

  info("{work_id}: Creating PAE incipit.")
  outdir <- dir_create(str_glue("{TARGET_DIR}/{work_id}"))
  write_file(
    incipit_pae,
    str_glue("{outdir}/main_1.pae")
  )
}

if (dir_exists(TARGET_DIR)) dir_delete(TARGET_DIR)
dir_create(TARGET_DIR)

pwalk(
  works,
  write_pae_incipit
)
