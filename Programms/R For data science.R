install.packages("httr")
library(httr)
# Load the httr library
library(httr)

# Define the URL of the COVID-19 pandemic Wiki page
url <- "https://en.wikipedia.org/wiki/COVID-19_pandemic"

# Send a GET request to the URL to get the page content
response <- GET(url)

# Extract the content of the response as text
content <- content(response, as = "text")

# Print the content
cat(content)

