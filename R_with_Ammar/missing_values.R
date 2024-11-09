## Fiil missing_values----
# check missing values
#load flights data library
library(nycflights13)
df <- flights
df
# check missing values
is.na(df)
sum(is.na(df))
# calculate the percentafge
mis_val <- sum(is.na(df))
total_val <- nrow(df)
mis_val_per <- (mis_val/total_val)*100
mis_val_per
# check which column has missing values
colSums(is.na(df))
df |> is.na() |>colSums() |> barplot(col = "purple")
# drop NA
df_drop <- na.omit(df)
# plot the missing values in DF
library(naniar)





## Impute Values
library(tidyverse)
library(readr)
library(ggplot2)
library(openxlsx)
library(tidyr)
# install.packages("DescTools")
library(DescTools)
# import titanic data
df <- read_csv("./Data/titanic.csv")
df |>  is.na() |> colSums() |> barplot(col = "purple")
# compute percentage of the missing values in each column
df |>
  summarise_all(funs(sum(is.na(.))/n())) |>
  gather() |>
  ggplot(aes(x = key, y = value)) +
  geom_bar(stat = "identity", fill = "purple") +
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))
# 
# df |> 
#   mutate(Age = ifelse(is.na(Age), mean(Age, na.rm = TRUE), Age)) |>
#   mutate(Fare = ifelse(is.na(Fare), mean(Fare, na.rm = TRUE), Fare)) |>
#   mutate(Embarked = ifelse(is.na(Embarked), "S", Embarked)) |>
#   is.na() |>
#   colSums() |>
#   barplot(col = "purple")
df_clean <- df |>
  mutate(Age = ifelse(is.na(Age), mean(Age, na.rm = TRUE), Age)) |>
  mutate(Fare = ifelse(is.na(Fare), mean(Fare, na.rm = TRUE), Fare)) |>
  mutate(Embarked = ifelse(is.na(Embarked), "S", Embarked))
df_clean |> is.na() |> colSums() |> barplot(col = "purple")

df_clean_2 <- df |>
  mutate(Age = ifelse(is.na(Age), mean(Age, na.rm = TRUE), Age)) |>
  mutate(Fare = ifelse(is.na(Fare), mean(Fare, na.rm = TRUE), Fare)) |>
  mutate(Embarked = ifelse(is.na(Embarked), "S", Embarked)) |>
  select(-Cabin)  
df_clean_2 |> is.na() |> colSums()  |> barplot(col = "purple")

# impute missing values
