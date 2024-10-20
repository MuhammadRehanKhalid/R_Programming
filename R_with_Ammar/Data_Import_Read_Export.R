# readr, readxl, openxl
install.packages("openxlsx", dependencies =  TRUE)
install.packages("openxl")
library(writexl)
library(readxl)
library(readr)
library(openxlsx)
library(openxl) # not found

df <- read_csv("./Data/titanic.csv")
df
df_2 <- read_xlsx("./Data/CO2_data.xlsx", sheet = 'iris') # name is preffered
df_2
write_xlsx(df, "./Data/comb_CO2_Iris.xlsx")
write_tsv(df, "./Data/comb_CO2_Iris.tsv")
