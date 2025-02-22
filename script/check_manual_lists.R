library(tidyverse)
library(readxl)

join_spec_a <- join_by(group == G, subgroup == S, number == N, title, siglum, shelfmark, rism_id)
join_spec_b <- join_by(G == group, S == subgroup, N == number, title, siglum, shelfmark, rism_id)

new <-
  read_excel("data_generated/works_list.xlsx", col_types = "text") %>%
  replace_na(list(subgroup = "0", rism_id = "x"))

old <-
  read_excel("~/Desktop/TODO/Werner/overview_werner.xlsx", col_types = "text") %>%
  replace_na(list(S = "0", rism_id = "x"))

new %>%
  anti_join(old, by = join_spec_a) %>%
  filter(!str_starts(number, "L")) %>%
  filter(!(siglum == "A-Ed" & str_starts(shelfmark, "E")))
old %>% anti_join(new, by = join_spec_b)
