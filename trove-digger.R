# Trove-digger
# Mick Morrison

## A simple script for accessing the trove API and returning useful information back to Rstudio.
## See /Readme.rmd for details

# Load the libraries
library(httr)
library(tidyverse)
library(rlist)
library(RJSONIO)
library(jsonlite)


# Use httr GET function to access the API with a search query
# this URL needs to be modified to suit the query you wish to run. Queries can be very complex 
# see https://trove.nla.gov.au/about/create-something/using-api/api-technical-guide#parameters-available-when-searching

query <- GET("https://api.trove.nla.gov.au/v2/result?key=l5c9j180i2m9ngs2&zone=newspaper&q=weipa%20mission&encoding=json&n=10")

# commenting out to simplify code and work directly with api
# query_results <- content(query,as = "text")

# Turn this into a function if poss.
# some trial code for this
# trove-digger <- function {query <- (GET("https://api.trove.nla.gov.au/v2/result?key=l5c9j180i2m9ngs2&zone=newspaper&q=weipa%20mission"))

# Seeing what was gotten
names(query)
class(query)
query
str(query)
head(query)

# the data is served back as json text mode, heavily nested and tricky to work with. 


# data I want is in a nested list at:
# resp[["response"]][["zone"]][[1]][["records"]][["article"]]
# But how to get it?

#try to access as a list
list.select(resp,"article") 


