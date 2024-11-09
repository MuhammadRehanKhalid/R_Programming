## 1. Packages ----
library(tidyverse)
# install.packages("nycflights13")
library(nycflights13)
df <- flights
# see the structure
str(df)
glimpse(df) # info of the data same as pandas
tibble(df) # tibble format
# df_2 <- drop(df)
# dimensions
dim(df)
# range of year column indf
range(df$year)
range(df$month)
range(df$day)
range(df$hour)
range(df$minute)
# count data for 1,1,2013
sum(df$year == 2013 & df$month == 1 & df$day == 1)
sum(df$year == 2013 & df$month == 1 & df$day == 1 & df$hour == 12)
# filter data filter or piplines
df |> filter(year == 2013 & month == 1 & day == 1)
df |>  filter(year == 2013 & month == 2 & day == 1)
sum(df$month==1)
df |> filter(month==1) |> 
  filter(day==1) |>
  filter(hour==12)
# subsetting we can do
# data of januarry of 12 hours
df_2013 <- df |> filter(year==2013, month==1)
df_2013_Jan_hur_12 <- df |> filter(month==1) |> 
  filter(hour==12)
# csv
# write_csv(df_2013, "./Data/df_2013.csv")
df |> filter(month==1|month==2) 
# use %in% fummction for month
df |> filter(month %in% c(1,2,3))
df |> filter(!month %in% c(1,2,3))
df |> filter(month %in% c(10,11,12)& day %in% c(1:15))# range of data
# filter data having delay more than 120 or 60
df |> filter(dep_delay > 120 | dep_delay > 60)
df |>  filter(dep_delay > 120 | arr_delay > 120)

