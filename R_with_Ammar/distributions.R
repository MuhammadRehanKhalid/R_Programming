# library
library(tidyverse)
library(readr)
library(readxl)
library(ggplo2)
# ----import data----
df <- read_csv("./Data/titanic.csv")
# ----data_understaning----
glimpse(df)
tibble(df)
summary(df)
str(df)
# histogram
hist(df$Age, bins = 30)

ggplot(df, aes(x = Age)) +
  geom_histogram(bins = 60) +
  theme_bw()
mean(df$Age, na.rm = TRUE)
median(df$Age, na.rm = TRUE)

# where to use mean and median
a <- c(1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 100)
b <- c(1,2,3,4,5,6,7,8,9,10, 1000)

mean(a)
median(a)
mean(b)
median(b)
