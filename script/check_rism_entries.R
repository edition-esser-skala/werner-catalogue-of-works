library(xml2)
library(tidyverse)

# download current records via SRUDownloader
data <-
  read_xml("data_generated/rism_entries.xml") %>%
  as_list() %>%
  pluck("collection")

rism_entries_new <-
  data %>%
  map_chr(~.x[2][[1]][[1]][1]) %>% enframe("name", "rism_id") %>%
  mutate(rism_id = as.integer(rism_id))

rism_entries_old <- read_csv("data/works_in_rism.csv", comment = "#")


rism_entries_old %>%
  anti_join(rism_entries_new) %>%
  filter(notes != "added manually")

rism_entries_new %>%
  anti_join(rism_entries_old)
