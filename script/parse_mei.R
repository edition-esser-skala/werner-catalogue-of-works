library(xml2)
library(yaml)
library(tidyverse)
source("script/utils.R")
options(readr.show_col_types = FALSE)



# Parameters --------------------------------------------------------------

GLOBAL_instruments <- c()
GLOBAL_sigla <- c()

SOURCE_TYPES <- c(
  "Autograph manuscript" = "A",
  "Partly autograph manuscript" = "A",
  "Manuscript copy" = "C",
  "Print" = "P",
  "Lost manuscript" = "L"
)


## Config file ----

params <- read_yaml("data/config.yml")
cols_identifiers <-
  params$catalogue_columns$identifiers %>%
  list_simplify()
catalogue_prefix <- params$catalogue_prefix

work_page_names <-
  read_csv("data/catalogue_overview.csv") %>%
  distinct(group, file) %>%
  deframe()


## Available editions ----

get_available_editions <- function() {
  tmp_dir <- dir_create(path_temp("cw"))

  if (dir_exists(tmp_dir)) dir_delete(tmp_dir)
  system(paste("git clone", params$edition$repo, tmp_dir))

  paste0(tmp_dir, "/works") %>%
    dir_ls() %>%
    path_file()
}

AVAILABLE_EDITIONS <- get_available_editions()



# Templates ---------------------------------------------------------------

## Work (detailed) ----

WORK_TEMPLATE_DETAILED <- '
### [{group}{subgroup}.{number_formatted}]{{.header-section-number}}<br/>{title} {{.unnumbered #work-{group}{subgroup}.{number}}}

{incipits}

{sources_short}

::: {{.callout-note collapse="true" .column-page-right}}
# Details

Identification
: {identifiers}

Scoring
: {work_scoring}

{roles}

Genre
: {genre}

Place and date of composition
: {creation}

{bibliography}

{work_description}

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
{notes}

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


## Lost source ----

LOST_SOURCE_TEMPLATE <- '
#### {title}

Classification
: {classification}

Location
: {siglum} {shelfmark} {link}

Components and notes
: {source_description}
'


## RISM ----

RISM_TEMPLATE <- "[{label}](https://opac.rism.info/search?id={rism_id})"


## Identifier ----

IDENTIFIER_TEMPLATE <- '<span class="citation" data-cites="{ref}"><a href="#ref-{ref}" role="doc-biblioref" aria-expanded="false">{catalogue}</a> {id}</span>'
IDENTIFIER_TEMPLATE_NOLINK <- '{catalogue} {id}'


## Subtitle ----

SUBTITLE_TEMPLATE <- "[{title}]{{.other-title}}"


## EES edition link ----

EDITION_LINK_TEMPLATE <- "[![](../images/ees_link.svg)]({link})"



# Functions ---------------------------------------------------------------

# add an attribute "markdown_text" to each XML node with rich text,
# which contains the node contents with markdown formatting instead
# of the MEI formatting nodes
# add hyperlinks when referencing other works or RISM entries
format_mei_text <- function(xml_data) {
  pattern_work <- paste(catalogue_prefix, "([A-Z])(\\.[\\dSL]+)?(\\.[\\dSL]+)")
  pattern_rism <- "RISM (\\d+)"

  link_work <- function(s) {
    ref <- str_match(s, pattern_work)[1,]
    link_text <- ref[1]
    group <- ref[2]
    work_id <- str_flatten(ref[-1], na.rm = TRUE)

    str_glue(
      "[{link_text}]",
      "(/groups/{work_page_names[group]}.qmd#work-{work_id})"
    )
  }

  link_rism <- function(s) {
    ref <- str_match(s, pattern_rism)[1,]
    use_template(RISM_TEMPLATE, label = ref[1], rism_id = ref[2])
  }

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
        )) %>%
        str_replace_all(pattern_work, link_work) %>%
        str_replace_all(pattern_rism, link_rism)
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

# formats titles
format_title <- function(d) {
  title_indices <-
    names(d) %>%
    str_which("title")

  main_title <- d[[title_indices[1]]][[1]]
  other_titles <- map_chr(
    title_indices[-1],
    \(i) use_template(SUBTITLE_TEMPLATE, title = d[[i]][[1]])
  )

  c(main_title, other_titles) %>%
    str_flatten("<br/>")
}

# format incipits (lightbox expanding to orchestral incipit)
format_incipits <- function(incipit_list, work_id) {
  target_dir <- str_glue("incipits/{work_id}")

  map_chr(
    incipit_list,
    \(i) {
      main_incipit <- attr(i, "target")

      n <- str_extract(main_incipit, "\\d+")

      full_incipit <-
        dir_ls(target_dir) %>%
        path_file() %>%
        path_filter(paste0(n, "*"))

      str_glue('<a href="/{target_dir}/{full_incipit}" ',
               'class="lightbox">',
               '<img src="/{target_dir}/{main_incipit}.svg" ',
               'class="incipit img-fluid"></a>')
    }
  ) %>%
    str_flatten("\n\n")
}

# format the short sources as table
format_sources_short <- function(ss) {
  sources <-
    map(ss, \(s) get_source_location(s) %>% as_tibble_row()) %>%
    list_rbind() %>%
    arrange(type, siglum, shelfmark) %>%
    summarise(
      .by = type,
      sources = str_flatten(source, " · "),
      end = ""
    ) %>%
    add_column(
      .before = 1,
      label = c("|*Sources*", rep("|", times = nrow(.) - 1))
    ) %>%
    unite(everything(), col = "tbl", sep = "|") %>%
    pull(tbl) %>%
    str_flatten("\n")

  paste(
    "||||",
    "|-|-|-|",
    sources,
    "",
    ': {tbl-colwidths="[10,4,86]" .movement-details}',
    "",
    sep = "\n"
  )
}

# format identifiers as links to bibliography
# id_list: named vector (catalogue = id)
# sep: separator between identifiers
# add_links: whether to add links if available
format_identifiers <- function(id_list, sep, add_links = TRUE) {
  imap_chr(
    cols_identifiers,
    \(ref, catalogue) {
      id <- pluck(id_list, catalogue)
      if (is.null(id) || is.na(id))
        return(NA)
      if (ref == "" || !add_links) {
        use_template(
          IDENTIFIER_TEMPLATE_NOLINK,
          catalogue = catalogue,
          id = id
        )
      } else {
        use_template(
          IDENTIFIER_TEMPLATE,
          ref = ref,
          catalogue = catalogue,
          id = id
        )
      }
    }
  ) %>%
    str_flatten(sep, na.rm = TRUE)
}

# format list of instruments
# also write instrument name to global variable
# for assembling a list of abbreviations later
format_instrument <- function(i) {
  name <- i[[1]]
  GLOBAL_instruments <<- c(GLOBAL_instruments, name)

  count <- attr(i, "count") %||% "1"
  if (count != "1")
    name <- paste(count, name)

  solo <- attr(i, "solo") %||% "false"
  if (solo == "true")
    name <- paste(name, "(solo)")

  name
}

# format list of ensembles
format_ensemble <- function(e) {
  head <- e$head[[1]]
  instruments <- map_chr(e[-1], format_instrument)
  if (length(instruments) == 1
      & head == "soli"
      & !str_detect(instruments[1], "^\\d"))
    head <- "solo"
  paste0(head, " (", str_flatten_comma(instruments), ")")
}

# format the total scoring
format_scoring <- function(s) {
  music_ensembles <-
    map_chr(
      names(s) %>% str_which("perfResList"),
      \(i) format_ensemble(s[[i]])
    ) %>%
    str_sort(decreasing = TRUE) # ensures that "solo" comes before "coro"

  music_instruments <- map_chr(
    names(s) %>% str_which("perfRes$"),
    \(i) format_instrument(s[[i]])
  )

  c(music_ensembles, music_instruments) %>%
    str_flatten_comma()
}

# format genre(s)
format_classification <- function(c) {
  if (is.null(c))
    stop("Classification missing.")

  c$termList %>%
    map_chr(\(t) t[[1]]) %>%
    str_flatten_comma()
}

# format roles
format_roles <- function(roles) {
  if (is.null(roles))
    return("")

  roles <-
    map_chr(roles, \(r) str_glue("{r$role$name[[1]]} ({r$perfRes[[1]]})")) %>%
    str_flatten_comma()
  return(paste0("Roles\n: ", roles))
}

# format date and place of creation/composition
format_creation <- function(c) {
  if (is.null(c))
    return("–")

  date <- c$date[[1]] %||% NA
  place <- c$geogName[[1]] %||% NA
  str_flatten_comma(c(place, date), na.rm = TRUE)
}

# format bibliography (PanDoc style)
# also adds a link to the EES edition if available
# returns a list containing the markdown-formatted bibliography
# as well as the raw entries
format_bibliography <- function(b, work_id) {
  b <- b %||% list()

  entries_ref <-
    b %>%
    keep(\(x) !is.null(x$genre) && x$genre == "reference") %>%
    map_chr(\(i) attr(i$ptr, "target")) %>%
    str_sort()

  entries_score <-
    b %>%
    keep(\(x) !is.null(x$genre) && x$genre == "score") %>%
    map_chr(\(i) {
      imprint <-
        c(i$imprint$publisher, i$imprint$pubPlace, i$imprint$date) %>%
        str_flatten_comma()

      if (is.null(i$editor))
        editor <- NA
      else
        editor <- paste("Edited by", i$editor)

      if (is.null(i$ptr))
        url <- NA
      else
        url <- str_glue("[{attr(i$ptr, 'label')}]({attr(i$ptr, 'target')})")

      c(i$composer, i$title, editor, i$identifier, imprint, url) %>%
        str_flatten(". ")
    })


  if (work_id %in% AVAILABLE_EDITIONS) {
    link <- paste0(
      params$edition$url,
      str_to_lower(work_id) %>% str_replace_all("_", "-")
    )
    entries_score <- c(
      entries_score,
      use_template(EDITION_LINK_TEMPLATE, link = link)
    )
  }

  markdown <- str_flatten(
    c(
      if_else(
        length(entries_ref) > 0,
        paste("Bibliography\n:", str_flatten_comma(entries_ref)),
        ""
      ),
      if_else(
        length(entries_score) > 0,
        paste("Editions\n:", str_flatten(entries_score, "<br/>")),
        ""
      )
    ),
    "\n\n"
  )

  list(
    markdown = markdown,
    entries_ref = entries_ref,
    entries_score = entries_score
  )
}

# format work description
format_work_description <- function(n) {
  notes <- attr(n[[1]], "markdown_text")
  if (is.null(notes))
    ""
  else
    paste("Notes\n:", notes)
}

# format a section of a movement
format_section <- function(s) {
  title <- s$title[[1]]
  info("      section {title}")

  tempo <- s$tempo[[1]]
  key <- format_key(s$key)
  meter <- format_meter(s$meter)
  extent <- s$extent[[1]]
  scoring <- format_scoring(s$perfMedium$perfResList)
  notes <- attr(s$notesStmt[[1]], "markdown_text") %||% ""
  paste("", title, tempo, key, meter, extent, scoring, notes, "", sep = "|")
}

# format a movement
format_movement <- function(m, work_id) {
  number <- attr(m, "n", exact = TRUE) %||% ""
  title <- m$title[[1]]
  info("    movement {title}")

  tempo <- m$tempo[[1]]
  meter <- format_meter(m$meter)
  key <- format_key(m$key)
  extent <- m$extent[[1]]
  scoring <- format_scoring(m$perfMedium$perfResList)

  notes <- attr(m$notesStmt[[1]], "markdown_text") %||% ""
  if (notes != "")
    notes <- str_glue("|*Notes*|{notes}|")

  incipit_file <- attr(m$incip$graphic, "target")
  if (is.null(incipit_file))
    incipit <- "(incipit missing)"
  else {
    incipit <- str_glue(
      "![](/incipits/{work_id}/{incipit_file}.svg){{.incipit}}"
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
    notes = notes,
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

# format the titlepages of a source
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

# format the pysical description
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

# get type, siglum, shelfmark, link to digitized version,
# and RISM ID of a source
# also write siglum to global variable
# for assembling a list of abbreviations later
get_source_location <- function(s) {
  type_long <- s$titleStmt$title[[1]]
  type <- SOURCE_TYPES[type_long]
  if (is.na(type))
    stop("Unknown source type: ", type_long)

  siglum <- s$itemList$item$physLoc$repository$identifier[[1]]
  GLOBAL_sigla <<- c(GLOBAL_sigla, siglum)
  shelfmark <- s$itemList$item$physLoc$identifier[[1]]
  source <- paste(siglum, shelfmark)

  url <- attr(s$itemList$item$physLoc$repository$ptr, "target")
  url_label <- attr(s$itemList$item$physLoc$repository$ptr, "label")
  if (is.null(url))
    link <- ""
  else
    link <- str_glue("([{url_label}]({url}))")

  rism_id <- pluck(s$itemList$item$identifier, 1)
  if (is.null(rism_id)) {
    rism_id <- "–"
  } else {
    source <- use_template(RISM_TEMPLATE, label = source, rism_id = rism_id)
    rism_id <- use_template(RISM_TEMPLATE, label = rism_id, rism_id = rism_id)
  }

  list(
    type = type,
    siglum = siglum,
    shelfmark = shelfmark,
    link = link,
    rism_id = rism_id,
    source = source
  )
}

# format a source
format_source <- function(s) {
  title <- s$titleStmt$title[[1]]
  info("    source {title}")

  classification <-
    s$classification$termList %>%
    map_chr(\(t) t[[1]])

  location <- get_source_location(s)

  dating <- pluck(s, "pubStmt", "date", 1) %||% "–"

  title_pages <- format_titlepage(s$itemList$item$physDesc)
  if (title_pages == "")
    title_pages <- "–"

  physdesc <- format_physdesc(s$itemList$item$physDesc)

  source_description <-
    attr(s$itemList$item$notesStmt[[1]], "markdown_text") %||% "–"

  if (classification[6] == "Lost")
    return(
      use_template(
        LOST_SOURCE_TEMPLATE,
        title = title,
        classification = str_flatten_comma(classification),
        siglum = location$siglum,
        shelfmark = location$shelfmark,
        link = location$link,
        source_description = source_description
      )
    )

  use_template(
    SOURCE_TEMPLATE,
    title = title,
    classification = str_flatten_comma(classification),
    siglum = location$siglum,
    shelfmark = location$shelfmark,
    link = location$link,
    rism_id = location$rism_id,
    dating = dating,
    title_pages = title_pages,
    physdesc = physdesc,
    source_description = source_description
  )
}



# Validation --------------------------------------------------------------

# stops the script if two strings are not equal
check_equal_string <- function(a, b) {
  if (a == b) return()
  str_glue("These strings must be the same:\n(MEI) {a}\n(CSV) {b}")
}

# stops the script if two string lists contain different elements
# the lists may be unsorted and contain duplicates
check_equal_list <- function(a, b) {
  a <- str_sort(a) %>% unique()
  b <- str_sort(b) %>% unique()
  if (all(a == b)) return()
  str_glue("These lists must be the same:",
           "\n(MEI) {str_flatten_comma(a)}",
           "\n(CSV) {str_flatten_comma(b)}")
}

# compares MEI to CSV metadata
validate_metadata <- function(group,
                              subgroup,
                              number,
                              title,
                              bibliography,
                              identifiers,
                              sources,
                              table_metadata,
                              table_sources,
                              loglevel = c("error", "warn")) {
  loglevel <- rlang::arg_match(loglevel)
  report <- function(msg) {
    if (is.null(msg))
      return()
    if (loglevel == "error") {
      error(msg)
      stop()
    }
    warn(msg)
  }

  # work title
  title <- str_split_1(title, "<br/>")[1]
  check_equal_string(title, table_metadata$title) %>%
    report()

  # references
  table_bibliography <-
    table_metadata$literature %>%
    replace_na("") %>%
    str_split_1(", @") %>%
    str_remove("@")
  check_equal_list(str_remove(bibliography, "@"), table_bibliography) %>%
    report()

  # identifiers
  table_metadata[[catalogue_prefix]] <-
    str_flatten(c(group, subgroup, number), ".", na.rm = TRUE)
  check_equal_string(
    format_identifiers(identifiers, sep = " · ", add_links = FALSE),
    format_identifiers(table_metadata, sep = " · ", add_links = FALSE)
  ) %>%
    report()

  # sources
  mei_sources <-
    map(sources, \(s) get_source_location(s) %>% as_tibble_row()) %>%
    list_rbind() %>%
    mutate(
      source = str_c(siglum, shelfmark, sep = " "),
      .keep = "none"
    ) %>%
    pull(source)
  check_equal_list(mei_sources, table_sources$source) %>%
    report()
}



# Main workflow -----------------------------------------------------------

get_work_details <- function(group,
                             subgroup,
                             number,
                             table_metadata,
                             table_sources) {
  work_id <- str_flatten(c(group, subgroup, number), "_", na.rm = TRUE)
  data <- read_xml(str_glue("data/works_mei/{work_id}.xml"))
  format_mei_text(data)
  data <-
    as_list(data) %>%
    pluck("mei", "meiHead")

  data_work <- data$workList$work
  data_music <- data$workList$work$expressionList$expression
  data_movements <- data$workList$work$expressionList$expression$componentList
  data_sources <- data$manifestationList

  number_formatted <- number
  if (str_starts(number, "S"))
    number_formatted <- str_glue("[{number}]{{.text-danger}}")
  if (str_starts(number, "L"))
    number_formatted <- str_glue("[{number}]{{.text-warning}}")

  title <- format_title(data_work)

  incipits <- format_incipits(data_music$incip, work_id)

  sources_short <- format_sources_short(data_sources)

  data_work$notesStmt <-
    data_work$notesStmt %>%
    keep(\(annot) attr(annot, "type") == "general_description")

  identifier_indices <-
    names(data_work) %>%
    str_which("identifier")
  identifier_ids <- map_chr(
    identifier_indices,
    \(i) data_work[[i]][[1]]
  )
  identifier_catalogues <- map_chr(
    identifier_indices,
    \(i) attr(data_work[[i]], "label")
  )
  identifiers <- format_identifiers(
    set_names(identifier_ids, identifier_catalogues),
    sep = "<br/>"
  )

  work_scoring <- format_scoring(data_music$perfMedium$perfResList)

  roles <- format_roles(data_music$perfMedium$castList)

  genre <- format_classification(data_work$classification)

  creation <- format_creation(data_work$creation)

  bibliography <- format_bibliography(data_work$biblList, work_id)

  work_description <- format_work_description(data_work$notesStmt)

  info("  movements")
  movements <-
    map_chr(data_movements, \(m) format_movement(m, work_id)) %>%
    str_flatten("\n")

  info("  sources")
  sources <-
    map_chr(data_sources, format_source) %>%
    str_flatten("\n\n")

  info("  Comparing data in MEI and CSV")
  validate_metadata(
    group = group,
    subgroup = subgroup,
    number = number,
    title = title,
    bibliography = bibliography$entries_ref,
    identifiers = set_names(identifier_ids, identifier_catalogues),
    sources = data_sources,
    table_metadata = table_metadata,
    table_sources = table_sources,
    loglevel = "error"
  )

  use_template(
    WORK_TEMPLATE_DETAILED,
    group = group,
    subgroup = str_flatten(c(".", subgroup)),
    number = number,
    number_formatted = number_formatted,
    title = title,
    incipits = incipits,
    sources_short = sources_short,
    identifiers = identifiers,
    work_scoring = work_scoring,
    roles = roles,
    genre = genre,
    creation = creation,
    bibliography = bibliography$markdown,
    work_description = work_description,
    movements = movements,
    sources = sources,
    work_id = work_id
  )
}



# Testing -----------------------------------------------------------------

# data <- read_xml("data/works_mei/D_3_7.xml")
# get_work_details("B", NA, "46")
# get_work_details("D", "1", "1")
# get_work_details("I", "4", "54")
# get_work_details("Q", NA, "2")
