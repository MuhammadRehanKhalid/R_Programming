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

# data_distribution methods----
# normal distribution
x <-  seq(-4, 4, length = 100)
hist(x, prob = TRUE, col = "lightblue", border = "black")
y <- dnorm(x)
# hist(y, prob = TRUE, col = "lightblue", border = "black")
# null hypothesis Shapiro test
# HO = data is normally distributed if p>0.05, 95% interval confidence
# H1 = data is not normally distributed if p<0.05, 95% interval confidence
shapiro.test(df$Age)

hist(df$Age, prob = TRUE, col = "lightblue", border = "black")
shapiro.test(df$Age) #test for normal distribution
hist(df$Fare)
shapiro.test(df$Fare) #test for normal distribution
# make ggplot hist
ggplot(df, aes(x = Age)) +
  geom_histogram(bins = 100, fill = "purple", color = "black") +
  theme_bw()

ggplot(df, aes(x = Age)) +
  geom_histogram(bins = 60, fill = "purple", color = "black") +
  theme_bw()
#  create a for loop to see if shapiro test is significant or not
x <- shapiro.test(df$Age)
if (x$p.value > 0.05) {
  print("Data is normally distributed")
} else {
  print("Data is not normally distributed")
}
# kurtosis and skewness
library(e1071)
skewness(df$Age)
# find kurtosis and skewness of age and fair
skewness(df$Age)
kurtosis(df$Age)
skewness(df$Fare)
kurtosis(df$Fare)
# creat density plot of age and fare
ggplot(df, aes(x = Age)) +
  geom_density(fill = "purple", color = "black") +
  theme_bw()
ggplot(df, aes(x = Fare)) +
  geom_density(fill = "purple", color = "black") +
  theme_bw()
