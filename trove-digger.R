# Trove-digger
# Mick Morrison

## A simple script for accessing the trove API and returning useful information back to Rstudio.
## See /Readme.rmd for details

# Load the libraries
library(httr)
library(tidyverse)
library(rlist)

# Use httr GET function to access the API with a search query
# this URL needs to be modified to suit the query you wish to run. Queries can be very complex 
# see https://trove.nla.gov.au/about/create-something/using-api/api-technical-guide#parameters-available-when-searching

query <- GET("https://api.trove.nla.gov.au/v2/result?key=l5c9j180i2m9ngs2&zone=newspaper&q=weipa%20mission")
query
query_results <- content(get,as = "parsed")

# Seeing what was gotten
query_results 

# this has parsed a long list of fields. Viewing as a data frame just lists 272 variables in one column. We need to break into columns
# now to try to extract the structured text

#first let's look at the structure of the response and identify which list to target
str(content(query), max.level = 6
    )

# so the first list is of Trove Zones
# second list contains records that we want

# Next step is to store the list we want
query_content <- list.select(get$content)

# check str of this list
str(query_content) #This confirms we have lists in this dataset. After some probing of each of the lists in the previous command, it seems clear that content is the container for the data we want.

# This outputs a massice list, I think of all the records returned



# Acknowledgements

# The following sources have been very helpful in producing this program
## The wonderful Trove.nla.gov.auu API! https://trove.nla.gov.au/about/create-something/using-api/api-technical-guide
## https://tidyr.tidyverse.org/articles/rectangle.html excellent overview of rectangling
