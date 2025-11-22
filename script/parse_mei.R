library(xml2)
library(yaml)
library(tidyverse)
source("script/utils.R")
options(readr.show_col_types = FALSE)



# Parameters --------------------------------------------------------------

GLOBAL_instruments <- c()
GLOBAL_sigla <- c()


## Config file ----

params <- read_yaml("data/config.yml")
cols_identifiers <-
  params$catalogue_columns$identifiers %>%
  list_simplify()
catalogue_prefix <- params$catalogue_prefix

instruments_unimarc <-
  read_csv("data/instrument_abbreviations.csv") %>%
  select(abbreviation, unimarc) %>%
  deframe()


## Available editions ----

get_available_editions <- function() {
  tmp_dir <- dir_create(path_temp("cw"))

  if (dir_exists(tmp_dir)) dir_delete(tmp_dir)
  system(paste("git clone", params$edition$repo, tmp_dir))

  ignored_works <-
    read_lines(paste0(tmp_dir, "/ignored_works")) %>%
    str_subset("^#", negate = TRUE)

  paste0(tmp_dir, "/works") %>%
    dir_ls() %>%
    path_file() %>%
    setdiff(ignored_works)
}

AVAILABLE_EDITIONS <- get_available_editions()


## Regex patterns ----

PATTERN_WORK <- paste(catalogue_prefix, "([A-Z](?:\\.[\\dSL]+){1,2})")
PATTERN_RISM <- "RISM (\\d+)"



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

ARKs
: {ark}

{author}

Scoring
: {work_scoring}

{roles}

Genre
: {genre}

Place and date of composition
: {creation}

Performance(s)
: {performances}

{bibliography}

{work_description}

### Music
{movements}

### Sources
{sources}

[Download metadata](/metadata/mei/{work_id}.xml)
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
{roles}{text_incipit}{notes}

: {{tbl-colwidths="[10,90]" .movement-details}}

{incipit}

{sections}'


## Source ----

SOURCE_TEMPLATE <- '
#### {title}

##### Classification

{classification}

##### Location(s)

{locations}

##### RISM

{rism_id}

##### Publication, dating

{publication}

##### Scribe(s)

{scribes}

##### Title page(s)

{title_pages}

##### Physical description

{physdesc}

##### Components and notes

{source_description}
'


## Lost source ----

LOST_SOURCE_TEMPLATE <- '
#### {title}

##### Classification

{classification}

##### Location

{locations}

##### Components and notes

{source_description}
'


## RISM ----

RISM_TEMPLATE <- str_glue("[{{label}}]({params$rism_link})")


## Identifier ----

IDENTIFIER_TEMPLATE <- '<span class="citation" data-cites="{ref}"><a href="#ref-{ref}" role="doc-biblioref" aria-expanded="false">{catalogue}</a> {id}</span>'
IDENTIFIER_TEMPLATE_NOLINK <- '{catalogue} {id}'


## Subtitle ----

SUBTITLE_TEMPLATE <- "[{title}]{{.other-title}}"


## EES edition link ----

EDITION_LINK_TEMPLATE <- "[![](../images/ees_link_light.svg){{.has-dark-version}}]({link})"


## ARK ----

ARK_TEMPLATE_SHORT <- "[{ark}](https://n2t.net/{ark})"

ARK_TEMPLATE_MEI <- paste0(
  ARK_TEMPLATE_SHORT,
  " (human-readable catalogue entry)<br/>",
  "[{ark}.mei](https://n2t.net/{ark}.mei) (metadata in MEI format)"
)

ARK_TEMPLATE_SCORE <- paste0(
  ARK_TEMPLATE_MEI,
  "<br/>",
  "[{ark}.score](https://n2t.net/{ark}.score) (full score)"
)


## Dublin Kernel ----

ERC_TEMPLATE <- "
erc:
who: {who}
what: {what}
when: {when}
where: {where}
support-what: {support_what}
"



# Functions ---------------------------------------------------------------

# replaces a string “WerW X” with a link to the respective work
link_work <- function(s) {
  ref <- str_match(s, PATTERN_WORK)[1,]
  link_text <- ref[1]
  blade <-
    ref[2] %>%
    str_replace_all("\\.", "") %>%
    str_to_lower()

  str_glue("[{link_text}](https://n2t.net/ark:{params$ark}{blade})")
}

# replaces a string “RISM X” with a link to the respective RISM entry
link_rism <- function(s) {
  ref <- str_match(s, PATTERN_RISM)[1,]
  use_template(RISM_TEMPLATE, label = ref[1], rism_id = ref[2])
}

# get the value of <elem_name attr_name="attr_value">
get_elem_value <- function(l, elem_name, attr_name, attr_value) {
  ids <- str_which(names(l), elem_name)
  res <-
    l[ids] %>%
    keep(\(e) !is.null(attr(e, attr_name)) &&
           attr(e, attr_name) == attr_value) %>%
    pluck(1, 1)
  res %||% NA_character_
}

# add an attribute "markdown_text" to each XML node with rich text,
# which contains the node contents with markdown formatting instead
# of the MEI formatting nodes
# add hyperlinks when referencing other works or RISM entries
format_mei_text <- function(xml_data) {
  make_markdown <- function(n, as_list = FALSE) {
    if (as_list)
      sep <- "\n- "
    else
      sep <- "<br/><br/>"

    res <-
      xml_children(n) %>%  # get all <p> nodes
      map_chr(as.character) %>%
      str_flatten(sep) %>%
      str_replace_all(c(
        "<p>" = "",
        "</p>" = "",

        # newlines
        "<lb/>" = "<br/>",

        # italics
        "<rend fontstyle=\"italic\">(.+?)</rend>" = "<i>\\1</i>",

        # underlines
        "<rend rend=\"underline\\(2\\)\">(.+?)</rend>" = "<u>\\1</u>",

        # superscripts (RISM notation)
        "\\|(\\w)" = "^\\1^"
      )) %>%
      str_replace_all("\\^\\^", "") %>%
      str_replace_all(PATTERN_WORK, link_work) %>%
      str_replace_all(PATTERN_RISM, link_rism)

    if (as_list)
      res <- paste0("- ", res)

    res
  }

  xpath <-
    c(
      "//d1:titlePage",
      "//d1:physMedium",
      "//d1:annot"
    ) %>%
    str_flatten(" | ")

  res <-
    xml_data %>%
    xml_find_all(xpath) %>%
    map_chr(\(n) {
      xml_set_attr(n, "markdown_text", make_markdown(n))
      xml_set_attr(n, "markdown_list", make_markdown(n, as_list = TRUE))
    })

  # map() with invisible return instead of walk() to allow debugging
  invisible(res)
}

# format the time signature with common/cut time symbols or fraction
format_meter <- function(m) {
  meter <- pluck(m, 1)
  if (!is.null(meter))
    return(meter)

  meter <- attr(m, "sym")
  if (is.null(meter))
    meter <- paste(attr(m, "count"), attr(m, "unit"), sep = "_")

  if (length(meter) == 0L)
    error("Meter missing")

  meter_svg <- str_glue("images/meter/{meter}.svg")
  if (!file_exists(meter_svg))
    warn("No image available for meter {meter}")

  str_glue("![](../{meter_svg}){{.switches-dark-mode}}")
}

# format the key signature
format_key <- function(k) {
  key <- attr(k, "pname")
  if (is.null(key)) {
    key <- pluck(k, 1)
    if (is.null(key))
      error("Key missing")
    else
      return(key)
  }

  accidentals <- c(
    n = "",
    f = "♭",
    s = "♯"
  )
  a <- attr(k, "accid") %||% "n"

  paste0(
    str_to_upper(key),
    accidentals[a],
    " ",
    attr(k, "mode")
  )
}

# format Archival Resource Key
# also generates ERC metadata for the catalogue entry
# and the associated MEI metadata
format_ark <- function(meihead,
                       title,
                       work_id,
                       template = c("full", "short")) {
  template <- match.arg(template)
  book <- read_yaml("_quarto.yml")$book
  ark <- pluck(
    meihead,
    "altId",
    1,
    .default = paste0(
      "ark:",
      params$ark,
      work_id %>% str_replace_all("_", "") %>% str_to_lower()
    )
  )

  # create records for '?info' inflection:
  ## (1) catalogue entry
  use_template(
    ERC_TEMPLATE,
    who = book$author,
    what = str_glue("Catalogue entry ",
                    "for '{title} ({catalogue_prefix} ",
                    "{str_replace_all(work_id, '_', '.')})' ",
                    "in: {book$title}. {book$subtitle}"),
    when = lubridate::today(),
    where = str_glue("https://n2t.net/{ark}"),
    support_what = params$persistence
  ) %>%
    write_file(str_glue("data_generated/erc/{work_id}_entry.txt"))

  ## (2) MEI metadata (only if available)
  if (template == "full") {
    use_template(
      ERC_TEMPLATE,
      who = book$author,
      what = str_glue("Metadata in Music Encoding Initiative (MEI) format ",
                      "for '{title} ({catalogue_prefix} ",
                      "{str_replace_all(work_id, '_', '.')})' ",
                      "in: {book$title}. {book$subtitle}"),
      when = lubridate::today(),
      where = str_glue("https://n2t.net/{ark}.mei"),
      support_what = params$persistence
    ) %>%
      write_file(str_glue("data_generated/erc/{work_id}_mei.txt"))
  }

  ## (3) full score (only if available)
  if (work_id %in% AVAILABLE_EDITIONS) {
    use_template(
      ERC_TEMPLATE,
      who = book$author,
      what = str_glue("Full score ",
                      "for '{title} ({catalogue_prefix} ",
                      "{str_replace_all(work_id, '_', '.')})' ",
                      "described in: {book$title}. {book$subtitle}"),
      when = lubridate::today(),
      where = str_glue("https://n2t.net/{ark}.score"),
      support_what = params$persistence
    ) %>%
      write_file(str_glue("data_generated/erc/{work_id}_score.txt"))
  }

  # return the properly formatted ARK
  if (template == "full") {
    if (work_id %in% AVAILABLE_EDITIONS) {
      use_template(ARK_TEMPLATE_SCORE, ark = ark)
    } else {
      use_template(ARK_TEMPLATE_MEI, ark = ark)
    }
  } else {
    use_template(ARK_TEMPLATE_SHORT, ark = ark)
  }
}

# formats titles
# returns a list with elements
#  'main' (main title) and
#  'all' (all formatted titles)
format_title <- function(d) {
  title_indices <-
    names(d) %>%
    str_which("title")

  main_title <- d[[title_indices[1]]][[1]]
  other_titles <- map_chr(
    title_indices[-1],
    \(i) use_template(SUBTITLE_TEMPLATE, title = d[[i]][[1]])
  )

  list(
    main = main_title,
    all =
      c(main_title, other_titles) %>%
      str_flatten("<br/>")
  )
}

# format incipits (lightbox expanding to orchestral incipit)
format_incipits <- function(incipit_list, work_id) {
  target_dir <- str_glue("incipits/{work_id}")

  rows <- map_chr(
    incipit_list,
    \(i) {
      main_incipit <- attr(i, "target")

      n <- str_extract(main_incipit, "\\d+")

      full_incipit <-
        dir_ls(target_dir) %>%
        path_file() %>%
        path_filter(paste0(n, "_*"))

      str_glue('|{n}|',
               '<a href="/{target_dir}/{full_incipit}" ',
               'class="lightbox">',
               '<img src="/{target_dir}/{main_incipit}.svg" ',
               'class="incipit-main img-fluid switches-dark-mode"></a>|')
    }
  ) %>%
    str_flatten("\n")

  paste0("|||\n|-|-|\n",
         rows,
         '\n\n: {tbl-colwidths="[4,96]" .incipits}')
}

# format the short sources as table
#   ss: manifestationList
format_sources_short <- function(ss) {
  sources <-
    map(ss, \(s) get_source_locations(s, pluck(s$identifier, 1))) %>%
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
  codedval <- attr(i, "codedval")
  check_instrument(name, codedval)
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
# returns a table row with the pipe-separated scoring (scoring)
# and the markdown-formatted ensemble (markdown)
format_ensemble <- function(e) {
  head <- e$head[[1]]
  codedval <- attr(e, "codedval")
  check_instrument(head, codedval)
  GLOBAL_instruments <<- c(GLOBAL_instruments, head)

  instruments <- map_chr(e[-1], format_instrument)
  scoring <-
    instruments %>%
    str_c("_", head) %>%
    str_flatten("|")

  if (length(instruments) == 1
      & head == "soli"
      & !str_detect(instruments[1], "^\\d"))
    head <- "solo"

  tibble_row(
    scoring = scoring,
    markdown = paste0(head, " (", str_flatten_comma(instruments), ")")
  )
}

# format the total scoring
# returns a list with the pipe-separated scoring (scoring)
# and the markdown-formatted scoring (markdown)
format_scoring <- function(s) {
  music_ensembles <-
    map(
      names(s) %>% str_which("perfResList"),
      \(i) format_ensemble(s[[i]])
    ) %>%
    list_rbind()

  music_instruments <- map_chr(
    names(s) %>% str_which("perfRes$"),
    \(i) format_instrument(s[[i]])
  )

  list(
    scoring =
      c(music_ensembles$scoring, music_instruments) %>%
      str_flatten("|"),
    markdown =  # ↓ ensures that "solo" comes before "coro"
      str_sort(music_ensembles$markdown, decreasing = TRUE) %>%
      c(music_instruments) %>%
      str_flatten_comma()
  )
}

# format author suprious works
# c: <workList><work><contributor>
format_author <- function(c) {
  person_indices <-
    names(c) %>%
    str_which("persName")

  # if there is only the main author, do not print it
  if (length(person_indices) == 1 & c$persName[[1]] == params$main_author)
    return("")

  map_chr(person_indices, \(i) c[[i]][[1]]) %>%
    str_flatten_comma()
}

# format genre(s)
format_genre <- function(c) {
  if (is.null(c))
    error("Genre missing.")

  c$termList %>%
    map_chr(\(t) check_genre(t[[1]])) %>%
    str_flatten_comma()
}

# format roles
format_roles <- function(roles) {
  if (is.null(roles))
    return("")

  map_chr(roles, \(r) str_glue("{r$role$name[[1]]} ({r$perfRes[[1]]})")) %>%
    str_flatten_comma()
}

# format date and place of creation/composition
format_creation <- function(c) {
  if (is.null(c))
    return("–")

  date <- c$date[[1]] %||% NA
  place <- c$geogName[[1]] %||% NA
  str_flatten_comma(c(place, date), na.rm = TRUE)
}

# format performances (date, place, venue)
# h: <history>
format_performances <- function(h) {
  if (length(h) == 0L)
    return("(none documented)")

  h$eventList %>%
    map(\(e) tibble(
      date = e$date[[1]],
      place = get_elem_value(e, "geogName", "role", "place"),
      venue = get_elem_value(e, "geogName", "role", "venue")
    )) %>%
    list_rbind() %>%
    unite(place, venue, col = "place", sep = ", ", na.rm = TRUE) %>%
    summarise(
      .by = place,
      n = n(),
      dates = str_flatten_comma(date, last = ", and ")
    ) %>%
    arrange(place) %>%
    pmap_chr(\(place, n, dates) str_glue("*{place}* ({n}): {dates}")) %>%
    str_flatten("<br/>")
}

# get bibliography entries of a given genre
# issue a warning if the targettype is incorrect
get_bibliography_entries <- function(bibllist, genre) {
  bibllist %>%
    keep(\(bibl) !is.null(bibl$genre) && bibl$genre == genre) %>%
    map_chr(\(bibl) {
      targettype <- attr(bibl$ref, "targettype") %||% "(missing)"
      citation <- bibl$ref[[1]]
      if (targettype != "pandoc-citation")
        warn("citation {citation} has wrong targettype '{targettype}'")
      citation
    }) %>%
    str_sort()
}

# format bibliography (PanDoc style)
# b: <biblList>
# also adds a link to the EES edition if available
# returns a list containing the markdown-formatted bibliography
# as well as the raw entries for references and edition
format_bibliography <- function(b, work_id) {
  b <- b %||% list()
  entries_reference <- get_bibliography_entries(b, "reference")
  entries_inventory <- get_bibliography_entries(b, "inventory")
  entries_edition <- get_bibliography_entries(b, "edition")

  # check whether there is an EES edition
  ees_edition <- NULL
  if (work_id %in% AVAILABLE_EDITIONS) {
    link <- paste0(
      params$edition$url_link,
      str_to_lower(work_id) %>% str_replace_all("_", "-")
    )
    ees_edition <- use_template(EDITION_LINK_TEMPLATE, link = link)
  }
  entries_edition_all <- c(entries_edition, ees_edition)

  markdown <- str_flatten(
    c(
      if_else(
        length(entries_reference) > 0,
        paste("References\n:", str_flatten_comma(entries_reference)),
        ""
      ),
      if_else(
        length(entries_inventory) > 0,
        paste("Inventories\n:", str_flatten_comma(entries_inventory)),
        ""
      ),
      if_else(
        length(entries_edition_all) > 0,
        paste("Editions\n:", str_flatten_comma(entries_edition_all)),
        ""
      )
    ),
    "\n\n"
  )

  list(
    markdown = markdown,
    entries_reference = entries_reference,
    entries_inventory = entries_inventory,
    entries_edition = entries_edition
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

# format movement/section title(s)
# as “title_1”, “title_1 (title_2)”, or “title_1 (title_2; title_3; ...)”
# s: <expression>
format_movement_title <- function(s) {
  title_indices <-
    names(s) %>%
    str_which("title")

  main_title <- s[[title_indices[1]]][[1]]
  other_titles <-
    map_chr(
      title_indices[-1],
      \(i) s[[i]][[1]]
    ) %>%
    str_flatten("; ")
  if (other_titles != "") {
    other_titles <- paste0(" (", other_titles, ")")
  }

  paste0(main_title, other_titles)
}

# format a section of a movement
# returns a table row with the number of bars (extent),
# the section's pipe-separated scoring (scoring),
# and the markdown-formatted section data (markdown)
format_section <- function(s) {
  title <- format_movement_title(s)
  info("      section {title}")

  number <- attr(s, "n", exact = TRUE)
  if (!is.null(number))
    error("Section must not be numbered")

  tempo <- s$tempo[[1]]
  key <- format_key(s$key)
  meter <- format_meter(s$meter)
  extent <- s$extent[[1]]
  scoring <- format_scoring(s$perfMedium$perfResList)
  notes <- attr(s$notesStmt[[1]], "markdown_text") %||% ""

  incipit_file <- attr(s$incip$graphic, "target", exact = TRUE)
  if (!is.null(incipit_file))
    error("Section must not have an incipit {incipit_file}")

  extent_formatted <-
    extent %>%
    str_extract("\\d+") %>%
    as.integer()
  if (is.na(extent_formatted))
    extent_formatted <- extent

  tibble_row(
    extent = extent_formatted,
    scoring =
      scoring$scoring,
    markdown =
      paste("", title, tempo, key, meter, extent, !!scoring$markdown, notes, "",
            sep = "|")
  )
}

# format a movement
# returns a table row with the movement's pipe-separated scoring (scoring)
# and the markdown-formatted movement data (markdown)
format_movement <- function(m, work_id) {
  title <- format_movement_title(m)
  info("    movement {title}")

  number <- attr(m, "n", exact = TRUE)
  if (is.null(number))
    error("Movement number missing")

  tempo <- m$tempo[[1]]
  meter <- format_meter(m$meter)
  key <- format_key(m$key)
  extent <- m$extent[[1]]
  scoring <- format_scoring(m$perfMedium$perfResList)

  roles <- format_roles(m$perfMedium$castList)
  if (roles != "")
    roles <- str_glue("|*Roles*|{roles}|\n\n")

  text_incipit <- pluck(m$incip, "incipText", "p", 1, .default = "")
  if (text_incipit != "")
    text_incipit <- str_glue("|*Text incipit*|{text_incipit}|\n\n")

  notes <- attr(m$notesStmt[[1]], "markdown_text") %||% ""
  if (notes != "")
    notes <- str_glue("|*Notes*|{notes}|")

  incipit_file <- attr(m$incip$graphic, "target")
  if (is.null(incipit_file))
    incipit <- "(incipit missing)"
  else {
    incipit <- str_glue(
      "![](/incipits/{work_id}/{incipit_file}.svg){{.incipit-full .switches-dark-mode}}"
    )
  }

  sections <-
    map(m$componentList, format_section) %>%
    list_rbind()

  if (nrow(sections) > 0) {
    # ensure that number of bars in sections
    # sums up to number of bars in movement
    # skip if extent is unknown
    if (extent != "[?]") {
      movement_extent <- str_extract(extent, "\\d+") %>% as.integer()
      section_extent <- sum(sections$extent)
      if (movement_extent != section_extent)
        error("    sum of section extent ({section_extent}) ",
              "must be equal to movement extent ({movement_extent})")
    }

    # ensure that the scoring of sections
    # sums up to the scoring of the movement
    check_scoring(scoring$scoring, sections$scoring)

    sections <- paste(
      "|Section|Tempo|Key|Meter|Extent|Scoring|Notes|",
      "|-|-|-|-|-|-|-|",
      str_flatten(sections$markdown, "\n"),
      "",
      ': {tbl-colwidths="[15,15,8,4,8,25,25]" .section-details}',
      "",
      sep = "\n"
    )
  } else {
    sections <- ""
  }

  tibble_row(
    scoring =
      scoring$scoring,
    markdown = use_template(
      MOVEMENT_TEMPLATE,
      number = number,
      title = title,
      tempo = tempo,
      meter = meter,
      key = key,
      extent = extent,
      scoring = !!scoring$markdown,
      roles = roles,
      text_incipit = text_incipit,
      notes = notes,
      incipit = incipit,
      sections = sections
    )
  )
}

format_dimensions <- function(d) {
  if (is.null(d) || is.null(d$height) || is.null(d$width))
    return(NA_character_)

  h <- attr(d$height, "quantity")
  hu <- attr(d$height, "unit") %||% "missing"
  w <- attr(d$width, "quantity")
  wu <- attr(d$width, "unit") %||% "missing"

  if (hu == "missing")
    error("Dimensions for height missing")
  if (wu == "missing")
    error("Dimensions for width missing")

  if (hu == wu)
    paste(h, "×", w, wu)
  else
    paste(h, hu, "×", w, wu)
}

# format the scribes of a source
# p: physDesc
format_scribes <- function(p) {
  hands <- pluck(p, "handList")
  if (is.null(hands)) {
    return("–")
  }

  hands %>%
    map(\(h) tibble(
      name = h[[1]],
      medium = attr(h, "medium"),
      type = attr(h, "type")
    )) %>%
    list_rbind() %>%
    mutate(
      details = if_else(
        type != "main",
        paste(medium, type, sep = ", "),
        medium
      )
    ) %>%
    summarise(
      .by = name,
      details = str_flatten(details, collapse = "; ")
    ) %>%
    pmap_chr(\(name, details) str_glue("{name} ({details})")) %>%
    str_flatten_comma()
}

# format the titlepages of a source
# p: physDesc
format_titlepage <- function(p) {
  res <-
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

  if (res == "")
    return("–")
  res
}

# format the pysical description
format_physdesc <- function(p) {
  extent <- p$extent[[1]] %||% NA

  dimensions <- format_dimensions(p$dimensions)

  physical_medium <- attr(p$physMedium, "markdown_text") %||% NA

  res <- str_flatten(
    c(extent, dimensions, physical_medium),
    collapse = "<br/>",
    na.rm = TRUE
  )

  if (res == "")
    res <- "–"

  res
}

# formats the source description
# n: notesStmt
format_source_description <- function(n) {
  desc <-
    n %>%
    keep(~attr(.x, "type") == "source_description")

  if (is_empty(desc))
    return("–")

  attr(desc[[1]], "markdown_list")
}

# get the source locations
#   s: manifestation
#   rism_id: RISM ID of manifestation (used by prints)
# returns a tibble with the following columns:
#   validation_ignore (whether this source should be ignored during validation)
#   type (A, C, …)
#   siglum
#   shelfmark
#   link (link to source, labeled as digitized version, catalogue entry ...)
#   rism_id (link to RISM entry, labeled by RISM ID)
#   source (link to RISM entry, labeled by siglum and shelfmark)
# also write siglum to global variable
#   for assembling a list of abbreviations later
get_source_locations <- function(s, rism_id = NULL) {
  type_long <- s$titleStmt$title[[1]]
  type <- pluck(params$validation$source_types, type_long, "abbreviation")
  if (is.null(type))
    error("Unknown source type: ", type_long)

  map(
    s$itemList,
    \(item) {
      siglum <- pluck(item$physLoc$repository$identifier, 1)
      if (is.null(siglum)) {
        siglum <- item$physLoc$repository$corpName[[1]]
        validation_ignore <- TRUE
      } else {
        GLOBAL_sigla <<- c(GLOBAL_sigla, siglum)
        validation_ignore <- FALSE
      }

      shelfmark <- item$physLoc$identifier[[1]]
      source <- paste(siglum, shelfmark)

      # parse several ptr elements in repository
      link <-
        item$physLoc$repository %>%
        names() %>%
        str_which("ptr") %>%
        map_chr(\(i) {
          url <- attr(item$physLoc$repository[[i]], "target")
          url_label <- attr(item$physLoc$repository[[i]], "label")
          if (!url_label %in% params$validation$location_link_labels)
            error("Unknown link label: ", url_label)
          str_glue("[{url_label}]({url})")
        }) %>%
        str_flatten_comma()
      if (link != "")
        link <- paste0("(", link, ")")

      if (is.null(rism_id))
        rism_id <- pluck(item$identifier, 1)

      if (is.null(rism_id)) {
        rism_id <- "–"
      } else {
        source <- use_template(RISM_TEMPLATE,
                               label = source, rism_id = rism_id)
        rism_id <- use_template(RISM_TEMPLATE,
                                label = rism_id, rism_id = rism_id)
      }

      tibble_row(
        validation_ignore = validation_ignore,
        type = type,
        siglum = siglum,
        shelfmark = shelfmark,
        link = link,
        rism_id = rism_id,
        source = source
      )
    }
  ) %>%
    list_rbind()
}

# format a source (s: one manifestation of the manifestationList)
format_source <- function(s) {
  title <- s$titleStmt$title[[1]]
  info("    source {title}")

  classification <-
    s$classification$termList %>%
    map_chr(\(t) t[[1]]) %>%
    str_to_lower()
  check_classification(classification, title)

  dating <- pluck(s, "pubStmt", "date", 1, .default = "–")

  # prints define publisher (name, place, date, plate number), location(s),
  # title page(s), physical description (extent, dimensions, physical medium),
  # and source description on the manifestation level;
  # manuscripts define them on the item level
  if (title == "Print") {
    publication <- str_flatten_comma(c(
      pluck(s, "pubStmt", "publisher", 1, .default = "(unknown publisher)"),
      pluck(s, "pubStmt", "pubPlace", 1, .default = "(no place)"),
      dating
    ))

    plate_number <- pluck(s, "physDesc", "plateNum", 1)
    if (is.null(plate_number))
      plate_number <- "(no plate number)"
    else
      plate_number <- str_glue("(plate number: {plate_number})")

    publication <- paste(publication, plate_number)


    source_locations <- get_source_locations(s, pluck(s$identifier, 1))

    scribes <- "–"

    title_pages <- format_titlepage(s$physDesc)

    physdesc <- format_physdesc(s$physDesc)

    source_description <- format_source_description(s$notesStmt)
  } else {
    publication <- dating

    source_locations <- get_source_locations(s)
    if (nrow(source_locations) != 1L)
      error("There must be only one item for manuscripts.")

    scribes <- format_scribes(s$itemList$item$physDesc)

    title_pages <- format_titlepage(s$itemList$item$physDesc)

    physdesc <- format_physdesc(s$itemList$item$physDesc)

    source_description <- format_source_description(s$itemList$item$notesStmt)
  }

  locations <-
    source_locations %>%
    pmap_chr(\(siglum, shelfmark, link, ...) {
      paste(siglum, shelfmark, link)
    }) %>%
    str_flatten("<br/>")

  if (classification[6] == "lost")
    return(use_template(
        LOST_SOURCE_TEMPLATE,
        title = title,
        classification = str_flatten(classification, " · "),
        locations = locations,
        source_description = source_description
      ))
  use_template(
    SOURCE_TEMPLATE,
    title = title,
    classification = str_flatten(classification, " · "),
    locations = locations,
    rism_id = source_locations$rism_id[1],
    publication = publication,
    scribes = scribes,
    title_pages = title_pages,
    physdesc = physdesc,
    source_description = source_description
  )
}



# Validation --------------------------------------------------------------

# check that all instruments in the scoring of a lower level (e.g., movement)
# also appear in the scoring of a higher level (e.g., work)
# ignores instrument counts (thus, '2 vl' == 'vl')
# and voice numbers (thus, 'T 1' == 'T 2' == 'T')
check_scoring <- function(sc_top, sc_parts) {
  sc_top <-
    sc_top %>%
    str_split_1("\\|") %>%
    str_remove("^\\d+\\s") %>%
    str_replace("\\s\\d+_", "_")
  sc_parts <-
    sc_parts %>%
    str_split("\\|") %>%
    list_c() %>%
    str_remove("^\\d+\\s") %>%
    str_replace("\\s\\d+_", "_")

  only_in_top <- setdiff(sc_parts, sc_top)
  only_in_parts <- setdiff(sc_top, sc_parts)

  if (length(only_in_top) != 0)
    error("The following instruments are missing on the upper level: ",
          str_flatten_comma(only_in_top))
  if (length(only_in_parts) != 0)
    error("The following instruments are missing on the lower levels: ",
          str_flatten_comma(only_in_parts))
}

# checks whether an instrument abbreviation is known
# and paired with the correct UNIMARC term
# ignores voice numbers (thus, 'T 1' == 'T')
check_instrument <- function(name, codedval) {
  name <- str_replace(name, "\\s\\d+$", "")
  codedval_expected <- instruments_unimarc[name]

  if (is.na(codedval_expected))
    error("      instrument '{name}' unknown")

  if (codedval_expected != codedval)
    error("      instrument '{name}': ",
          "expected UNIMARC code '{codedval_expected}', ",
          "found '{codedval}'")
}

# checks whether the genre is known
# returns the genre if valid
check_genre <- function(genre) {
  if (!genre %in% params$validation$genres)
    error(" genre '{genre}' unknown")
  genre
}

# checks whether the source classification terms are valid
# and whether the authority term matches the source title
check_classification <- function(terms, source_title) {
  walk2(
    terms,
    params$validation$classification,
    \(term, valid_terms) {
      if (!term %in% valid_terms)
        error("      term '{term}' invalid")
    }
  )

  term_expected <-
    pluck(params$validation$source_types, source_title, "term_presentation")
  if (term_expected != terms[2])
    error("Source title '{source_title}' ",
          "does not match presentation term '{terms[2]}'")

  term_expected <-
    pluck(params$validation$source_types, source_title, "term_authority")
  if (term_expected != terms[3])
    error("Source title '{source_title}' ",
          "does not match authority term '{terms[2]}'")
}

# stops the script if two strings are not equal
check_equal_string <- function(a, b) {
  if (a != b)
    error("These strings must be the same:\n(MEI) {a}\n(CSV) {b}")
}

# stops the script if two string lists contain different elements
# the lists may be unsorted and contain duplicates
check_equal_list <- function(a, b) {
  a <- str_sort(a) %>% unique()
  b <- str_sort(b) %>% unique()
  if (length(a) == length(b) && all(a == b)) return()
  error("These lists must be the same:",
           "\n(MEI) {str_flatten_comma(a)}",
           "\n(CSV) {str_flatten_comma(b)}")
}

# compares MEI to CSV metadata
validate_metadata <- function(group,
                              subgroup,
                              number,
                              title,
                              references,
                              inventories,
                              editions,
                              identifiers,
                              sources,
                              table_metadata,
                              table_sources) {


  # work title
  title <- str_split_1(title, "<br/>")[1]
  check_equal_string(title, table_metadata$title)

  # references
  if (is.na(table_metadata$references)) {
    table_references <- character(0)
  } else {
    table_references <-
      table_metadata$references %>%
      str_split_1(", @") %>%
      str_remove("@")
  }
  check_equal_list(
    str_remove(references, "@"),
    table_references
  )

  # inventories
  if (is.na(table_metadata$inventories)) {
    table_editions <- character(0)
  } else {
    table_editions <-
      table_metadata$inventories %>%
      str_split_1(", @") %>%
      str_remove("@")
  }
  check_equal_list(
    str_remove(inventories, "@"),
    table_editions
  )

  # editions
  if (is.na(table_metadata$editions)) {
    table_editions <- character(0)
  } else {
    table_editions <-
      table_metadata$editions %>%
      str_split_1(", @") %>%
      str_remove("@")
  }
  check_equal_list(
    str_remove(editions, "@"),
    table_editions
  )

  # identifiers
  table_metadata[[catalogue_prefix]] <-
    str_flatten(c(group, subgroup, number), ".", na.rm = TRUE)
  check_equal_string(
    format_identifiers(identifiers, sep = " · ", add_links = FALSE),
    format_identifiers(table_metadata, sep = " · ", add_links = FALSE)
  )

  # sources
  mei_sources <-
    map(sources, get_source_locations) %>%
    list_rbind() %>%
    filter(!validation_ignore) %>%
    mutate(
      source = str_c(siglum, shelfmark, sep = " "),
      .keep = "none"
    ) %>%
    pull(source)
  check_equal_list(
    mei_sources,
    table_sources$source
  )
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

  ark <- format_ark(
    meihead = data,
    title = title$main,
    work_id = work_id,
    template = "full"
  )

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

  author <- format_author(data_work$contributor)
  if (author != "")
    author <- paste0("Author(s)\n: ", author)

  work_scoring <- format_scoring(data_music$perfMedium$perfResList)

  roles <- format_roles(data_music$perfMedium$castList)
  if (roles != "")
    roles <- paste0("Roles\n: ", roles)

  genre <- format_genre(data_work$classification)

  creation <- format_creation(data_work$creation)

  performances <- format_performances(data_work$history)

  bibliography <- format_bibliography(data_work$biblList, work_id)

  work_description <- format_work_description(data_work$notesStmt)

  info("  movements")
  movements <-
    data_movements %>%
    map(\(m) format_movement(m, work_id)) %>%
    list_rbind()
  check_scoring(work_scoring$scoring, movements$scoring)

  info("  sources")
  sources <-
    map_chr(data_sources, format_source) %>%
    str_flatten("\n\n")

  info("  Comparing data in MEI and CSV")
  validate_metadata(
    group = group,
    subgroup = subgroup,
    number = number,
    title = title$all,
    references = bibliography$entries_reference,
    inventories = bibliography$entries_inventory,
    editions = bibliography$entries_edition,
    identifiers = set_names(identifier_ids, identifier_catalogues),
    sources = data_sources,
    table_metadata = table_metadata,
    table_sources = table_sources
  )

  use_template(
    WORK_TEMPLATE_DETAILED,
    group = group,
    subgroup = str_flatten(c(".", subgroup)),
    number = number,
    number_formatted = number_formatted,
    title = title$all,
    incipits = incipits,
    sources_short = sources_short,
    identifiers = identifiers,
    ark = ark,
    author = author,
    work_scoring = work_scoring$markdown,
    roles = roles,
    genre = genre,
    creation = creation,
    performances = performances,
    bibliography = bibliography$markdown,
    work_description = work_description,
    movements = movements$markdown %>% str_flatten("\n"),
    sources = sources,
    work_id = work_id
  )
}



# Testing -----------------------------------------------------------------

# data <- read_xml("data/works_mei/C_2.xml")
# format_mei_text(data)
# data <- as_list(data) %>% pluck("mei", "meiHead")
# data_work <- data$workList$work
