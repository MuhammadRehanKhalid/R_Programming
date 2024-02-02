# loading the appropriate libraries
library(ggplot2)
library(webr)
library(dplyr)
# loading the dataset
data <- as.data.frame(Titanic)
head(data)
tail(data)
# Building a table with the data for the plot
PD = data %>% group_by(Class, Survived) %>% summarise(n = sum(Freq))
print(PD)
