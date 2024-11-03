## -------------GWalkR----------------
library('ggplot2')
library('readr')
library('readxl')
library('GWalkR')
# ToothGrowth data
df <- data.frame(ToothGrowth)
# iris data
df <- data.frame(iris)
#mtcars data
df <- data.frame(mtcars)
# CO2 data
df <- data.frame(CO2)
# BOD data
df <- data.frame(BOD)
# AirPassengers data
df <- data.frame(AirPassengers)
# InsectSprays data
df <- data.frame(InsectSprays)

# ChickWeight data
df <- data.frame(ChickWeight) #time series data
df
# run GWalkR function
gwalkr(df)
# titanic data
df <- read_csv("./Data/titanic.csv")
housing <- read_xlsx("C:/Users/mirza/OneDrive/Desktop/Data file.xlsx" )
# run GWalkR function
gwalkr(housing)

## -------------Tidyverse------
library('tidyverse')
library('readr')
library('readxl')
df <- read_csv("./Data/titanic.csv")
# create a ggplot object
plot <- ggplot(df, aes(x = Age, y = Fare)) + geom_point()
plot
ggplot(df, aes(x = Age, y = Fare, color = Sex)) + 
  geom_point(aes(size = Fare, shape = Sex)) +
  theme_classic()
plot2 <- ggplot(df, aes(x = Embarked, y = Fare, color = Sex)) + 
  geom_point(aes(size = Fare, shape = Sex)) +
  theme_classic()
plot2

## ------------plotly-------
library('plotly')
ggplotly(plot2)
# create bar plot
plot3 <- ggplot(df, aes(x = Embarked, y = Fare, fill = Sex)) + 
  geom_bar(stat = 'identity')
plot3
ggplotly(plot3)
# create a barplot of average of fare for sex column in titanic data
df %>%
  group_by(Pclass) %>% summarise(avg_fare = mean(Fare)) %>%
  ggplot(aes(x = Pclass, y = avg_fare, fill = Pclass)) +
  geom_bar(stat = 'identity') +
  theme_minimal()
# create a barplot of average of fare
df %>%
  group_by(Pclass) %>% summarise(avg_fare = mean(Fare)) %>%
  ggplot(aes(x = Pclass, y = avg_fare, fill = Sex)) +
  geom_bar(stat = 'identity') +
  theme_minimal()




