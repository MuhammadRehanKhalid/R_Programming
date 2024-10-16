##----------------Get a COVID-19 pandemic Wiki page using HTTP request-------#
library(httr)
wiki_covid19_page <- function() {
  wiki_basec9_url <-
    "https://en.wikipedia.org/w/index.php"
  wiki_url_params <- list(title = "Template: COVID-19_testing_by_country")
  wiki_response <- GET(wiki_basec9_url, query = wiki_url_params)
  return(wiki_response)
}
response <- wiki_covid19_page()
response
##------------Extract COVID-19 testing data table from the wiki HTML page--------------#
library(rvest)
covid_html <- "https://en.wikipedia.org/wiki/Template:COVID-19_testing_by_country"
covid_page <- read_html(covid_html)
covid_table <- covid_page %>% html_nodes("div.COVID-19_testing_by_country") %>% html_table() %>% .[[1]]
covid_table
##---------------Pre-process and export the COVID-19 data frame-------#
pre_procs_C19_Data <- function(D_f){
  D_f <- D_f[!(D_f$'Country or Region'=="World"),]
  D_f <- D_f[1:172,]
  D_f <- D_f[, !(names(D_f)%in%c("Units[b]","Ref."))]
  colnames(D_f) <- c("counrtry","date","tested","confirmed",
                     "confirmed.tested.ratio","tested.population.ratio","confirmed.population.ratio")
  D_f$country <- as.factor (D-f$country)
  D_f$date <- as.date (D-f$date, format="%Y-%m-%d")
  D_f$tested <- as.numeric(gsub(",","",D-f$tested))
  D_f$confirmed <- as.numeric(gsub(",","",D-f$confirmed))
  D_f$confirmed.tested.ratio <- as.numeric(gsub(",","",D-f$confirmed.tested.ratio))
  D_f$tested.population.ratio <- as.numeric(gsub(",","",D-f$tested.population.ratio))
  D_f$confirmed.population.ratio <- as.numeric(gsub(",","",D-f$confirmed.population.ratio))
  
  return(D_f)
}

library(rvest)

# Define function to pre-process COVID-19 data
pre_procs_C19_Data <- function(D_f){
  D_f <- D_f[!(D_f$'Country or region'=="World"),]
  D_f <- D_f[1:172,]
  D_f <- D_f[, !(names(D_f)%in%c("Units[b]","Ref."))]
  colnames(D_f) <- c("country","date","tested","confirmed",
                     "confirmed.tested.ratio","tested.population.ratio","confirmed.population.ratio")
  D_f$country <- as.factor(D_f$country)
  D_f$date <- as.Date(D_f$date, format="%Y-%m-%d")
  D_f$tested <- as.numeric(gsub(",", "", D_f$tested))
  D_f$confirmed <- as.numeric(gsub(",", "", D_f$confirmed))
  D_f$confirmed.tested.ratio <- as.numeric(gsub(",", "", D_f$confirmed.tested.ratio))
  D_f$tested.population.ratio <- as.numeric(gsub(",", "", D_f$tested.population.ratio))
  D_f$confirmed.population.ratio <- as.numeric(gsub(",", "", D_f$confirmed.population.ratio))
  return(D_f)
}
write.csv(preprocessed_covid_data, file = "covid_data.csv", row.names = FALSE)
# Read COVID-19 table from Wikipedia
covid_html <- "https://en.wikipedia.org/wiki/Template:COVID-19_testing_by_country"
covid_page <- read_html(covid_html)
covid_table <- covid_page %>% html_nodes("div.COVID-19_testing_by_country") %>% html_table() %>% .[[1]]

# Pre-process COVID-19 data
preprocessed_covid_data <- pre_procs_C19_Data(covid_table)

# Write pre-processed data to CSV file
write.csv(preprocessed_covid_data, file = "covid_data.csv", row.names = FALSE)

##---------------------------Get a subset of the COVID-19 data frame -------------#
covid_file_proc <- read.csv("covid_data.csv")
subset_cdata9 <- covid_file_proc[5:10, c("country","confirmed")]
subset_cdata9
##---------------------------Calculate worldwide COVID-19 testing positive ratio -------------#
covid_file_proc <- read.csv("covid_data.csv")
t_Con_cases <- sum(covid_file_proc$confirmed)
t_tst_cases <- sum(covid_file_proc$tested)
positive_ratio_all <- t_Con_cases / t_tst_cases
cat("Confirmed cases all over the world", t_Con_cases,"\n")
cat("Tested cases all over the world", t_tst_cases,"\n")
cat("Positive ratio all over the world", positive_ratio_all,"\n")
##-----------------------Get a sorted name list of countries that reported their testing data_____#
covid_file_proc <- read.csv("covid_data.csv")
tested_data_c <- covid_file_proc[!is.na(covid_file_proc$tested),]
count_list <- sort(unique(tested_data_c$country))
count_list
##---------------united Countries----------------#
UN_countries <- grep("^United", covid_file_proc$country, value = T)
UN_countries
##-----Pick two countries you are interested in, and then review their testing data_---#
covid9 <- read.csv("covid_data.csv")
pakistan_data <- covid9[covid9$country=="Pakistan",c("country", "confirmed","confirmed.population.ratio")]
oman_data <- covid9[covid9$country=="Oman",c("country", "confirmed","confirmed.population.ratio")]
china_data <- covid9[covid9$country=="China[c]",c("country", "confirmed","confirmed.population.ratio")]
print(pakistan_data)
print(oman_data)
print(china_data)
##--------Compare which one of the selected countries has a larger ratio of confirmed cases to population--------------#

if (pakistan_data$confirmed.population.ratio>oman_data$confirmed.population.ratio){
  print("Pakistan has the higher rate of Covid infection")
}else{
  print("Oman has the higher rate of Covid infection")
}
##--------Filter countries with confirmed-to-population ratio rate less than a threshold---#

covid9 <- read.csv("covid_data.csv")
ratio_lessthan_1 <- covid9[covid9$confirmed.population.ratio< 0.001,c("country", "confirmed","confirmed.population.ratio")]
ratio_lessthan_1
