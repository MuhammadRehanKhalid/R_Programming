# readr, readxl, openxlsx
install.packages("openxlsx", dependencies =  TRUE)
library(writexl)
library(readxl)
library(readr)
library(openxlsx) # combined form of readxl and writexl

df <- read_csv("./Data/titanic.csv")
df
df_2 <- read_xlsx("./Data/CO2_data.xlsx", sheet = 'iris') # name is preffered
df_2
write_xlsx(df, "./Data/comb_CO2_Iris.xlsx")
write_tsv(df, "./Data/comb_CO2_Iris.tsv")
