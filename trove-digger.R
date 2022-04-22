# Trove-digger
# Mick Morrison

## A simple script for accessing the trove API and returning useful information back to Rstudio.
## See /Readme.rmd for details

# Load the libraries
library(httr)
library(tidyverse)
library(rlist)
library(RJSONIO)

# Use httr GET function to access the API with a search query
# this URL needs to be modified to suit the query you wish to run. Queries can be very complex 
# see https://trove.nla.gov.au/about/create-something/using-api/api-technical-guide#parameters-available-when-searching

query <- GET("https://api.trove.nla.gov.au/v2/result?key=l5c9j180i2m9ngs2&zone=newspaper&q=weipa%20mission")

query_results <- content(query,as = "text")

# Turn this into a function if poss.
# some trial code for this
# trove-digger <- function {query <- (GET("https://api.trove.nla.gov.au/v2/result?key=l5c9j180i2m9ngs2&zone=newspaper&q=weipa%20mission"))

# Seeing what was gotten
names(query_results)
class(query_results)
query_results
str(query_results)
head(query_results)

# the data is served back as json text mode, heavily nested and tricky to work with. 
# Looking at that as an option

# Using RJSONIO to see if the 
resp <- fromJSON("https://api.trove.nla.gov.au/v2/result?key=l5c9j180i2m9ngs2&zone=newspaper&q=weipa%20mission")
