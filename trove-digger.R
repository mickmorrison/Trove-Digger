# Mucking around with Trove API
# Mick Morrison

library(rvest)
library(tidyverse)
library(httr)
library(rlist)

morrison_trove_api <- "l5c9j180i2m9ngs2"

# Load the libraries
library(httr)
library(tidyverse)
library(jsonlite)
library(rlist)

#use httrs get function to access the API with a search query
# if I want to be fancy, this could be modified to call URL variables (ie search terms)
get <- GET("https://api.trove.nla.gov.au/v2/result?key=l5c9j180i2m9ngs2&zone=newspaper&q=weipa%20mission")
get
get_results <- content(get,as = "parsed")

# Seeing what was gotten
get_results

# this has parsed a long list of fields. Viewing as a data frame just lists 272 variables in one column. We need to break into columns
# now to try to extract the structured text

#first let's look at the structure of the response and identify which list to target
str(content(get), max.level = 6
    )

# so the first list is of Trove Zones
# second list contains records that we want

# Next step is to store the list we want
content <- list.select(get$content)

# check str of this list
str(content) #This confirms we have lists in this dataset. After some probing of each of the lists in the previous command, it seems clear that content is the container for the data we want.

#attempt to get convert these lists to DF
contentdf <- list()
