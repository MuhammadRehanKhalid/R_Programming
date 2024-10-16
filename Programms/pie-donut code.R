install.packages("webr")
library(ggplot2)
library(webr)
library(dplyr)
#loading data
pie_D <- as.data.frame(Titanic)
head(pie_D)
View(pie_D)

#Building Table with data from table
xd <- pie_D %>% group_by(Class,Survived)%>%summarise(n=sum(Freq))
print(xd)

#Pie Donut
PieDonut(xd,aes(Class, Survived, count=n))
