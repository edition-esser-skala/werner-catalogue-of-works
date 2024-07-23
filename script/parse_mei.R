library(xml2)
library(tidyverse)
source("script/utils.R")



# Templates ---------------------------------------------------------------

## Details ----

DETAILS_TEMPLATE <- '::: {{.callout-note collapse="true" .column-page-right}}
# Details

Identification
: {identifiers}

Scoring
: {work_scoring}

Place and date of composition
: {creation}

Bibliography
: {bibliography}

### Music
{movements}

### Sources
{sources}

[Download metadata](/metadata/{work_id}.xml)
:::'


## Movement ----

MOVEMENT_TEMPLATE <- '
#### {number} {title}

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


## Source ----

SOURCE_TEMPLATE <- '
#### {title}

Classification
: {classification}

Location
: {siglum} {shelfmark} {link}

RISM
: {rism_id}

Dating
: {dating}

Title page(s)
: {title_pages}

Physical description
: {physdesc}

Components and notes
: {source_description}
'

## RISM ----

RISM_TEMPLATE <- "[{label}](https://opac.rism.info/search?id={rism_id})"



# Functions ---------------------------------------------------------------

# add an attribute "markdown_text" to each XML node with rich text,
# which contains the node contents with markdown formatting instead
# of the MEI formatting nodes
format_mei_text <- function(xml_data) {
  xpath <-
    c(
      "//d1:titlePage",
      "//d1:physMedium",
      "//d1:annot"
    ) %>%
    str_c(collapse = " | ")

  res <- map_chr(
    xml_data %>% xml_find_all(xpath),
    \(n) {
      new_text <-
        xml_children(n) %>%  # get all <p> nodes
        map_chr(as.character) %>%
        str_flatten("<br/><br/>") %>%
        str_replace_all(c(
          "<p>" = "",
          "</p>" = "",
          "<lb/>" = "<br/>",
          "<rend fontstyle=\"italic\">(.+?)</rend>" = "<i>\\1</i>",
          "<rend rend=\"underline\\(2\\)\">(.+?)</rend>" = "<u>\\1</u>"
        ))
      xml_set_attr(n, "markdown_text", new_text)
    }
  )

  # map() with invisible return instead of walk() to allow debugging
  invisible(res)
}

# format the time signature with common/cut time symbols or fraction
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

# format the key signature
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

format_creation <- function(c) {
  if (is.null(c))
    return("–")

  date <- c$date[[1]] %||% NA
  place <- c$geogName[[1]] %||% NA
  str_flatten_comma(c(place, date), na.rm = TRUE)
}

format_bibliography <- function(b) {
  if (is.null(b))
    return("–")

  res <-
    map_chr(
      names(b) %>% str_which("bibl"),
      \(i) attr(b[[i]]$ref, "target")
    ) %>%
    str_sort() %>%
    str_flatten_comma()
  if (res == "")
    res <- "–"

  res
}

format_section <- function(s) {
  title <- s$title[[1]]
  info("  section {title}")

  tempo <- s$tempo[[1]]
  key <- format_key(s$key)
  meter <- format_meter(s$meter)
  extent <- s$extent[[1]]
  scoring <- format_scoring(s$perfMedium$perfResList)
  notes <- attr(s$notesStmt[[1]], "markdown_text") %||% ""
  paste("", title, tempo, key, meter, extent, scoring, notes, "", sep = "|")
}

format_movement <- function(m, work_id) {
  number <- attr(m, "n", exact = TRUE) %||% ""
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
      "|Section|Tempo|Key|Meter|Extent|Scoring|Notes|",
      "|-|-|-|-|-|-|-|",
      sections,
      "",
      ': {tbl-colwidths="[15,15,8,4,8,25,25]" .section-details}',
      "",
      sep = "\n"
    )

  use_template(
    MOVEMENT_TEMPLATE,
    number = number,
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
  if (is.null(d) || is.null(d$height) || is.null(d$width))
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
    rism_id <- use_template(RISM_TEMPLATE, label = rism_id, rism_id = rism_id)

  dating <- pluck(s, "pubStmt", "date", 1) %||% "–"

  title_pages <- format_titlepage(s$itemList$item$physDesc)
  if (title_pages == "")
    title_pages <- "–"

  physdesc <- format_physdesc(s$itemList$item$physDesc)

  source_description <-
    attr(s$itemList$item$notesStmt[[1]], "markdown_text") %||% "–"

  use_template(
    SOURCE_TEMPLATE,
    title = title,
    classification = classification,
    siglum = siglum,
    shelfmark = shelfmark,
    link = link,
    rism_id = rism_id,
    dating = dating,
    title_pages = title_pages,
    physdesc = physdesc,
    source_description = source_description
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

  creation <- format_creation(data_work$creation)

  bibliography <- format_bibliography(data_work$biblList)

  info("movements")
  movements <-
    map_chr(data_movements, \(m) format_movement(m, work_id)) %>%
    str_flatten("\n")

  info("sources")
  sources <-
    map_chr(data_sources, format_source) %>%
    str_flatten("\n\n")

  use_template(
    DETAILS_TEMPLATE,
    identifiers = identifiers,
    work_scoring = work_scoring,
    creation = creation,
    bibliography = bibliography,
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
