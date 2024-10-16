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
#Basic Pie-Donut chart
# Pie-Donut chart
PieDonut(PD, aes(Class, Survived, count=n), title = "Titanic: Survival by Class")
# show lables over it
PieDonut(PD, aes(Class, Survived, count=n), title = "Titanic: Survival by Class",
         ratioByGroup = FALSE)
# by class
PieDonut(PD, aes(Survived, Class, count=n), title = "Titanic: Survival by Class")
# Exploding the pie
PieDonut(PD, aes(Survived, Class, count=n), title = "Titanic: Survival by Class",
         explode = 2)
# further explode
PieDonut(PD, aes(Survived, Class, count=n), title = "Titanic: Survival by Class",
         explode = 2, explodeDonut=TRUE)
# Controlling radius
PieDonut(PD, aes(Survived, Class, count=n), title = "Titanic: Survival by Class",
         r0 = 0)
PieDonut(PD, aes(Survived, Class, count=n), title = "Titanic: Survival by Class",
         r0 = 0.45, r1 = 0.9)
