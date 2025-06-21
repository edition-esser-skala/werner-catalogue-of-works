library(tidyverse)

# reads performance date, venue and place from a file
# and converts them to <event> elements to be used in MEI metadata
# each line in the input file has format “date”, “date place”, or “date venue place”

default_place <- "Vienna"
dates <- read_lines("data_generated/events.txt")

event_template <- '
<event>
    <date isodate="{date}">{date}</date>
    <geogName role="place">{place}</geogName>
</event>'

event_template_venue <- '
<event>
    <date isodate="{date}">{date}</date>
    <geogName role="venue">{venue}</geogName>
    <geogName role="place">{place}</geogName>
</event>'

map_chr(
  dates,
  \(d) {
    d <- str_split_1(d, " ")
    if (length(d) == 1) {
      str_glue_data(c(date = d, place = default_place), event_template)
    }
    else if (length(d) == 2) {
      str_glue_data(c(date = d[1], place = d[2]), event_template)
    }
    else {
      str_glue_data(c(date = d[1], venue = d[2], place = d[3]), event_template_venue)
    }
  }
) %>%
  write_lines("data_generated/events.xml")
