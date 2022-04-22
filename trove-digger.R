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

rm(list=ls())

# Use httr GET function to access the API with a search query
# this URL needs to be modified to suit the query you wish to run. Queries can be very complex 
# see https://trove.nla.gov.au/about/create-something/using-api/api-technical-guide#parameters-available-when-searching
# i've just followed my nose here
# this command creates a df from the above URL]

searchurl <- "https://api.trove.nla.gov.au/v2/result?key=l5c9j180i2m9ngs2&zone=newspaper&q=weipa%20mission&n=10&encoding=json"

resp <- GET(searchurl)

#First test to see http type
http_type(resp)

# GET the http response from trove api endpoint
content <- (content(resp))

content
#view the results
content # is returning nice lists - query results present. But weird and twisted format. 

# Display the structure
str(content)

# list
# attempt to coerce list into columns
# specifying the level of list I'm interested in

records <- as.data.frame(content$response)

# so this has helped transform the data
# https://stackoverflow.com/questions/48212759/extracting-data-from-an-api-using-r


##### This section might be better above ####
## Here be demons and fairies

list.load(resp)

text <- list.load("https://api.trove.nla.gov.au/v2/result?key=l5c9j180i2m9ngs2&zone=newspaper&q=weipa%20mission&n=10&encoding=json")

class(text)

# Testing this with jsonlite
library(jsonlite)
query <- GET("https://api.trove.nla.gov.au/v2/result?key=l5c9j180i2m9ngs2&zone=newspaper&q=weipa%20mission&n=10&encoding=json")

r2 <- rawToChar(query$content)

class(r2)

r3 <- fromJSON(r2)
df <- as.data.frame(r3$response$zone$records$article)
df
