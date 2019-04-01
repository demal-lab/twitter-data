## API only has data going back 6-9 days

# devtools::install_github("mkearney/rtweet")
library(rtweet)
library(tidyverse)

## Authenticate Twitter app
# name assigned to created app
appname <- "soil_health_mapping"

# api key
key <- "qYu7Yf9ukJY21ycnEu06IdwBA"
# api secret
secret <- "BzdAqJRNE69Vg9MYsCsyGqrmOP6qeTucr4BCPvqKkxcDVRakP6"

# create token
twitter_token <- create_token(
  app = appname,
  consumer_key = key,
  consumer_secret = secret)

## Read in standing data frame



## Search twitter
# Define search terms
c('"soil health"', '"healthy soil"', '#soilhealth', '#healthysoil', '"soil quality"', '"soil fertility"', 
'#soilquality', '#soilfertility','"rangeland health"','#rangelandhealth','"healthy rangelands"','#healthyrangelands',
'"regenerative agriculture"','#regenerativeagriculture') %>% 
search_tweets2(n = 100000, token=twitter_token, retryonratelimit = T) -> data

## Merge new search with old data


data.table::fwrite(as.data.frame(data), file ="twitter-data.csv")
