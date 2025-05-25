library(tidyverse)

# reads performance date (and, if available, place) from a file
# and converts them to <event> elements to be used in MEI metadata
# each line in the input file has format “date” or “date place”

default_place <- "Vienna"
dates <- read_lines("data_generated/events.txt")

event_template <- '
<event>
    <date isodate="{date}">{date}</date>
    <geogName role="place">{place}</geogName>
</event>'

map_chr(
  dates,
  \(d) {
    d <- str_split_1(d, " ")
    if (length(d) == 1)
      str_glue_data(c(date = d, place = default_place), event_template)
    else
      str_glue_data(c(date = d[1], place = d[2]), event_template)
  }
) %>%
  write_lines("data_generated/events.xml")
