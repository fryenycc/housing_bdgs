library(httr)
library(tidyverse)
string_bbl = "4001920035"

get_lat_lon_bbl <- function(string_bbl) {
  id <- "6e5e6031"
  key <-  "e83d26a5ae11ebf0fabcd1927fb6cc2c"

 str_bbl <- str_split(string_bbl, "_")
 
  boro <- str_bbl[[1]][1]
  block <- str_bbl[[1]][2]
  lot <- str_bbl[[1]][3]

  params <- list(borough = boro,
                 block = block, 
                 lot = lot, 
                 app_id = '6e5e6031',
                 app_key = 'e83d26a5ae11ebf0fabcd1927fb6cc2c')
  
  base_url <- "https://api.cityofnewyork.us/geoclient/v1/bbl.json"
  
  out <- GET(base_url, query = params) %>% 
    content(as = "text") %>% 
    jsonlite::fromJSON()
  
  paste(out$bbl$latitudeInternalLabel, out$bbl$longitudeInternalLabel, sep = ",")
}

