# -----------Repositories setting/Packages---------------
install.packages("readxl")
library(readxl)
require(readxl)
detach("package:readxl", unload=TRUE)

install.packages("tidyverse")
install.packages("tidyr")
install.packages("dplyr")
install.packages("ggplot2")
install.packages("ggthemes")
install.packages("ggpubr")
# set repositories
setRepositories()
#1: + CRAN
# 2:   BioC software # Bioinformatics
# 3:   BioC annotation # Bioinformatics
# 4:   BioC experiment # Bioinformatics
# 5:   CRAN (extras)
# 6:   R-Forge
# 7:   rforge.net
# Uncheck all except 1
library(readxl)
df <- read_excel("D:/R Programming/R_Programming/Data Sets/CO2 data.xlsx")
View(df)
plot(df$Time, df$CO2, type = "l", col = "blue", xlab = "Time", ylab = "CO2", main = "CO2 data")
# --------------------------built in datasets-----
data()
df <- data.frame(CO2)
print(df)
plot(df$Type, df$Treatment)
df<-data.frame(ChickWeight)
df
coplot(weight~Time|Chick, data=ChickWeight)
coplot(weight~Time|Diet, data=ChickWeight)
#------------Export Data----------------
write.csv(BOD, "D:/R Programming/R_Programming/R_with_Ammar/Data/BOD.xlsx")
write.csv(iris, "D:/R Programming/R_Programming/R_with_Ammar/Data/ChickWeight.csv")
write_xlsx(iris, "D:/R Programming/R_Programming/R_with_Ammar/Data/iris.xlsx")
#-----------------Data Manipulation----------------