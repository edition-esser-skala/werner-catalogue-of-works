library(xml2)
library(tidyverse)
source("script/utils.R")


# Templates ---------------------------------------------------------------

DETAILS_TEMPLATE <- '::: {{.callout-note collapse="true"}}
# Details

Identification
: {identifiers}

Scoring
: {main_scoring}

Tempo
: {main_tempo}

Metre
: {main_meter}

Key
: {main_key}

### Music
{movements}

### Sources
{sources}

:::'


MOVEMENT_TEMPLATE <- '
#### {title}

Extent
: {extent}

{incipit}

{sections}'


SOURCE_TEMPLATE <- '
#### {title}

Classification
: {classification}

Location
: {siglum} {shelfmark} {link}

RISM
: {rism_id}

Extent
: {extent}

Title page
: {title_page}

Physical medium
: {dimensions}{physical_medium}

Source description
: {source_description}'



# Functions ---------------------------------------------------------------

format_meter <- function(m) {
  if (is.null(attr(m, "sym"))) {
    paste0(attr(m, "count"), "/", attr(m, "unit"))
  } else if (attr(m, "sym") == "common") {
    "\U1d134"
  } else if (attr(m, "sym") == "cut") {
    "\U1d135"
  } else {
    stop("Illegal meter")
  }
}

format_key <- function(k) {
  paste(
    attr(k, "pname") %>% str_to_upper(),
    attr(k, "mode")
  )
}

format_instrument <- function(i) {
  name <- i[[1]]
  count <- attr(i, "count")
  solo <- attr(i, "solo")
  if (count != "1")
    name <- paste(count, name)
  if (solo == "true")
    name <- paste(name, "(solo)")
  name
}

format_ensemble <- function(e) {
  head <- e$head[[1]]
  e[-1]
  instruments <- map_chr(e[-1], \(i) i[[1]]) %>% str_flatten_comma()
  paste0(head, " (", instruments, ")")
}

format_scoring <- function(s) {
  music_ensembles <- map_chr(
    names(s) %>% str_which("perfResList"),
    \(i) format_ensemble(s[[i]])
  )

  music_instruments <- map_chr(
    names(s) %>% str_which("perfRes$"),
    \(i) format_instrument(s[[i]])
  )

  c(music_ensembles, music_instruments) %>%
    str_flatten_comma()
}

format_section <- function(s) {
  title <- s$title[[1]]
  info("  section {title}")

  tempo <- s$tempo[[1]]
  meter <- format_meter(s$meter)
  key <- format_key(s$key)
  extent <- s$extent[[1]]
  scoring <- format_scoring(s$perfMedium$perfResList)
  paste("", title, tempo, meter, key, extent, scoring, "", sep = "|")
}

format_movement <- function(m, work_id) {
  title <- m$title[[1]]
  info("movement {title}")

  extent <- m$extent[[1]]

  incipit_file <- attr(m$incip$graphic, "target")
  if (is.null(incipit_file))
    incipit <- "(incipit missing)"
  else {
    incipit_file <- str_remove(incipit_file, "\\.png$")
    incipit <- str_glue(
      '<a href="/incipits/{work_id}/{incipit_file}.png" class="lightbox">',
      '<img src="/incipits/{work_id}/{incipit_file}_low.png" ',
      'class="incipit img-fluid"></a>'
    )
  }

  sections <-
    map_chr(m$componentList, format_section) %>%
    str_flatten("\n")
  if (sections != "")
    sections <- paste(
      "|Section|Tempo|Metre|Key|Extent|Scoring|",
      "|-|-|-|-|-|-|",
      sections,
      sep = "\n"
    )

  glue::glue(MOVEMENT_TEMPLATE, .null = "", .na = "") %>%
    as.character()
}

format_dimensions <- function(d) {
  if (is.null(d))
    return("")
  h <- attr(d$height, "quantity")
  hu <- attr(d$height, "unit")
  w <- attr(d$width, "quantity")
  wu <- attr(d$width, "unit")

  if (hu == wu)
    res <- paste(h, "×", w, wu)
  else
    res <- paste(h, hu, "×", w, wu)
  paste0(res, "<br/>")
}

format_source <- function(s) {
  title <- s$titleStmt$title[[1]]
  info("source {title}")

  classification <-
    s$classification$termList %>%
    map_chr(\(t) t[[1]]) %>%
    str_flatten_comma()

  siglum <- s$itemList$item$physLoc$repository$identifier[[1]]

  shelfmark <- s$itemList$item$physLoc$identifier[[1]]

  url <- s$itemList$item$physLoc$repository$ptr %>% attr("target")
  url_label <- s$itemList$item$physLoc$repository$ptr %>% attr("label")
  if (is.null(url))
    link <- ""
  else
    link <- str_glue("([{url_label}]({url}))")

  rism_id <- s$itemList$item$identifier[[1]]

  extent <- s$itemList$item$physDesc$extent[[1]]

  title_page <-
    s$itemList$item$physDesc$titlePage[[1]] %>%
    keep(is.character) %>%
    str_flatten("<br/>")

  dimensions <- format_dimensions(s$itemList$item$physDesc$dimensions)

  physical_medium <-
    s$itemList$item$physDesc$physMedium$p %>%
    keep(is.character) %>%
    str_flatten("<br/>")

  source_description <-
    s$itemList$item$notesStmt[[1]]$p %>%
    keep(is.character) %>%
    str_flatten("<br/>")

  glue::glue(SOURCE_TEMPLATE, .null = "", .na = "") %>%
    as.character()
}


# Main workflow -----------------------------------------------------------

get_work_details <- function(work_id) {
  data <-
    read_xml(str_glue("data/works_mei/{work_id}.xml")) %>%
    as_list() %>%
    pluck("mei", "meiHead")

  data_work <- data$workList$work
  data_music <- data$workList$work$expressionList$expression
  data_movements <- data$workList$work$expressionList$expression$componentList
  data_sources <- data$manifestationList

  identifiers <-
    map_chr(
      names(data_work) %>% str_which("identifier"),
      \(i) paste(
        attr(data_work[[i]], "label"),
        data_work[[i]][[1]]
      )
    ) %>%
      str_flatten("<br/>")

  main_tempo <- data_music$tempo[[1]]
  main_key <- format_key(data_music$key)
  main_meter <- format_meter(data_music$meter)
  main_scoring <- format_scoring(data_music$perfMedium$perfResList)

  info("movements")
  movements <-
    map_chr(data_movements, \(m) format_movement(m, work_id)) %>%
    str_flatten("\n")

  info("sources")
  sources <-
    map_chr(data_sources, format_source) %>%
    str_flatten("\n")

  glue::glue(DETAILS_TEMPLATE, .null = "", .na = "") %>%
    as.character()
}

# get_work_details("B_46")
# get_work_details("D_1_1")
# get_work_details("D_1_2")
# get_work_details("D_1_3")
# get_work_details("D_1_4")
# get_work_details("I_4_54")
# get_work_details("Q_2")
