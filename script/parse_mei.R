library(xml2)
library(tidyverse)
source("script/utils.R")


# Templates ---------------------------------------------------------------

DETAILS_TEMPLATE <- '::: {{.callout-note collapse="true"}}
# Details

Identification
: {identifiers}

Scoring
: {work_scoring}

### Music
{movements}

### Sources
{sources}

[Download metadata](/works/metadata/{work_id}.xml)
:::'


MOVEMENT_TEMPLATE <- '
#### {title}

|||
|-|-|
|*Tempo*|{tempo}|
|*Key*|{key}|
|*Meter*|{meter}|
|*Extent*|{extent}|
|*Scoring*|{scoring}|

: {{tbl-colwidths="[10,90]" .movement-details}}

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

Title page
: {title_page}

Physical description
: {physdesc}

Source description
: {source_description}

##### Components

{components}
'


COMPONENT_TEMPLATE <- '
###### {label}

{title_page}

Physical description
: {physdesc}'



# Functions ---------------------------------------------------------------

use_template <- function(template, ...) {
  glue::glue_data(list(...), template, .null = "", .na = "") %>%
    as.character()
}

format_mei_text <- function(xml_data) {
  xpath <-
    c(
      "//d1:titlePage/d1:p",
      "//d1:physMedium/d1:p",
      "//d1:annot/d1:p"
    ) %>%
    str_c(collapse = " | ")

  walk(
    xml_data %>% xml_find_all(xpath),
    \(n) {
      new_text <-
        as.character(n) %>%
        str_replace_all(c(
          "<p>" = "",
          "</p>" = "",
          "<lb/>" = "<br/>",
          "<rend rend=\"underline\\(2\\)\">(.+?)</rend>" = "<u>\\1</u>"
        ))
      xml_parent(n) %>%
        xml_set_attr("markdown_text", new_text)
    }
  )
}

format_meter <- function(m) {
  res <- NULL
  if (is.null(attr(m, "sym"))) {
    res <- str_glue("${attr(m, 'count')} \\atop {attr(m, 'unit')}$")
  } else if (attr(m, "sym") == "common") {
    res <- "\U1d134"
  } else if (attr(m, "sym") == "cut") {
    res <- "\U1d135"
  }

  if (is.null(res))
    stop("Illegal meter")
  res
}

format_key <- function(k) {
  accidentals <- c(
    n = "",
    f = "♭",
    s = "♯"
  )
  a <- attr(k, "accid") %||% "n"

  paste0(
    attr(k, "pname") %>% str_to_upper(),
    accidentals[a],
    " ",
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
  key <- format_key(s$key)
  meter <- format_meter(s$meter)
  extent <- s$extent[[1]]
  scoring <- format_scoring(s$perfMedium$perfResList)
  paste("", title, tempo, key, meter, extent, scoring, "", sep = "|")
}

format_movement <- function(m, work_id) {
  title <- m$title[[1]]
  info("movement {title}")

  tempo <- m$tempo[[1]]
  meter <- format_meter(m$meter)
  key <- format_key(m$key)
  extent <- m$extent[[1]]
  scoring <- format_scoring(m$perfMedium$perfResList)

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
      "|Section|Tempo|Key|Meter|Extent|Scoring|",
      "|-|-|-|-|-|-|",
      sections,
      "",
      ': {tbl-colwidths="[20,20,10,10,10,30]" .section-details}',
      "",
      sep = "\n"
    )

  use_template(
    MOVEMENT_TEMPLATE,
    title = title,
    tempo = tempo,
    meter = meter,
    key = key,
    extent = extent,
    scoring = scoring,
    incipit = incipit,
    sections = sections
  )
}

format_dimensions <- function(d) {
  if (is.null(d))
    return(NA_character_)

  h <- attr(d$height, "quantity")
  hu <- attr(d$height, "unit")
  w <- attr(d$width, "quantity")
  wu <- attr(d$width, "unit")

  if (hu == wu)
    paste(h, "×", w, wu)
  else
    paste(h, hu, "×", w, wu)
}

format_titlepage <- function(p) {
  names(p) %>%
    str_which("titlePage") %>%
    map_chr(\(i) {
      label <- attr(p[[i]], "label")
      if (is.null(label))
        label <- "[no label]"
      label <- paste0("*", label, "*")

      paste(
        label,
        '<div class="title-page-contents">',
        attr(p[[i]], "markdown_text"),
        '</div>',
        sep = "\n"
      )
    }) %>%
    str_flatten("\n")
}

format_physdesc <- function(p) {
  extent <- p$extent[[1]] %||% NA

  dimensions <- format_dimensions(p$dimensions)

  physical_medium <- attr(p$physMedium, "markdown_text") %||% NA

  str_flatten(
    c(extent, dimensions, physical_medium),
    collapse = "<br/>",
    na.rm = TRUE
  )
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

  rism_id <- pluck(s$itemList$item$identifier, 1)
  if (is.null(rism_id))
    rism_id <- "–"
  else
    rism_id <- str_glue("[{rism_id}]",
                        "(https://opac.rism.info/search?id={rism_id})")

  title_page <- format_titlepage(s$itemList$item$physDesc)
  if (title_page == "")
    title_page <- "–"

  physdesc <- format_physdesc(s$itemList$item$physDesc)

  source_description <-
    attr(s$itemList$item$notesStmt[[1]], "markdown_text") %||% "–"

  components <-
    map_chr(s$itemList$item$componentList, format_item_component) %>%
    str_flatten("\n\n")
  if (components == "")
    components <- "–"

  use_template(
    SOURCE_TEMPLATE,
    title = title,
    classification = classification,
    siglum = siglum,
    shelfmark = shelfmark,
    link = link,
    rism_id = rism_id,
    title_page = title_page,
    physdesc = physdesc,
    source_description = source_description,
    components = components
  )
}

format_item_component <- function(c) {
  label <- attr(c, "label")

  title_page <- format_titlepage(c$physDesc)
  if (title_page != "")
    title_page <- paste0("Title page\n: ", title_page)

  physdesc <- format_physdesc(c$physDesc)

  use_template(
    COMPONENT_TEMPLATE,
    label = label,
    title_page = title_page,
    physdesc = physdesc
  )
}



# Main workflow -----------------------------------------------------------

get_work_details <- function(work_id) {
  data <- read_xml(str_glue("data/works_mei/{work_id}.xml"))
  format_mei_text(data)
  data <-
    as_list(data) %>%
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

  work_scoring <- format_scoring(data_music$perfMedium$perfResList)

  info("movements")
  movements <-
    map_chr(data_movements, \(m) format_movement(m, work_id)) %>%
    str_flatten("\n")

  info("sources")
  sources <-
    map_chr(data_sources, format_source) %>%
    str_flatten("\n")

  use_template(
    DETAILS_TEMPLATE,
    identifiers = identifiers,
    work_scoring = work_scoring,
    movements = movements,
    sources = sources,
    work_id = work_id
  )
}

# get_work_details("B_46")
# get_work_details("D_1_1")
# get_work_details("D_1_2")
# get_work_details("D_1_3")
# get_work_details("D_1_4")
# get_work_details("I_4_54")
# get_work_details("Q_2")
