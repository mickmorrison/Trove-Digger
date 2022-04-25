# Trove-digger
# Mick Morrison

## A simple script for accessing the trove API and returning useful information back to Rstudio.
## See /Readme.rmd for details
## This command creates a data.frame from the above URL. This includes URL, snippet, title, and other 
## 'base



# Load the libraries
library(httr)
library(jsonlite)

rm(list=ls())

# Use httr GET function to access the API with a search query

# The URL below needs to be modified to suit the query you wish to run. Queries can be very complex
# see the trove api guide @ https://trove.nla.gov.au/about/create-something/using-api/api-technical-guide#parameters-available-when-searching

## Instructions
### Very simply, you need to modify your query then run in Rstudio or elsewhere

content <- GET("https://api.trove.nla.gov.au/v2/result?key=l5c9j180i2m9ngs2&zone=newspaper&q=mission%20weipa&n=10&encoding=json&reclevel=brief%20&date%3A1880%2D1890")

# append to url above to refine query
# %20&include=articletext 

# Converting to character string
char <- rawToChar(content$content)

# now to convert character string to JSON
json<- fromJSON(char)

# turn into data.frame
df <- as.data.frame(json$response$zone$records$article)

# and last step, output to a csv in /outputs
write.csv2(df, "~/GitRepos/Trove-Digger/Outputs/queryresult.csv")


