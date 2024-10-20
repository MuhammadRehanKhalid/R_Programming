# readr, readxl, openxl
install.packages("openxlsx")
install.packages("openxl")
library(readxl)
library(readr)
library(openxlsx)
library(openxl) # not found

df <- read_csv("./Data/titanic.csv")
df
