library(xml2)
library(tidyverse)
library(fs)



# List of hands -----------------------------------------------------------

get_copyists <- function(f) {
  read_xml(f) %>%
    xml_find_all("//d1:hand") %>%
    as_list() %>%
    map(\(e) tibble(
      scribe = e[[1]][1],
      medium = attr(e, "medium"),
      type = attr(e, "type"),
    )) %>%
    list_rbind()
}

copyists <-
  dir_ls("data/works_mei/") %>%
  map(get_copyists) %>%
  list_rbind(names_to = "id")

copyists %>%
  distinct(scribe) %>%
  View()



# Tempo -------------------------------------------------------------------

get_tempos <- function(f) {
  read_xml(f) %>%
    xml_find_all("//d1:tempo") %>%
    as_list() %>%
    map_chr(1) %>%
    enframe("x", "tempo")
}

tempos <-
  dir_ls("data/works_mei/") %>%
  map(get_tempos) %>%
  list_rbind(names_to = "id")

tempos %>%
  distinct(tempo) %>%
  View()



# Movement title ----------------------------------------------------------

get_titles <- function(f) {
  read_xml(f) %>%
    xml_find_all("//d1:expression/d1:title") %>%
    as_list() %>%
    compact() %>%
    list_simplify() %>%
    list_simplify() %>%
    enframe("x", "title")
}

titles <-
  dir_ls("data/works_mei/") %>%
  map(get_titles) %>%
  list_rbind(names_to = "id")

titles %>%
  distinct(title) %>%
  View()

titles %>% filter(title %>% str_starts("Regina"))
