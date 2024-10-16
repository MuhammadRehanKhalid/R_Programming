library(readr)
library(ggplot2)
library(multcompView)
library(dplyr)

radon <- data.frame(D = c(0.37,0.37,0.37,0.37,0.51,0.51,0.51,0.51,0.71,0.71,0.71,0.71,1.02,1.02,1.02,1.02,1.4,1.4,1.4,1.4,1.99,1.99,1.99,1.99),
                    RR = c(80,83,83,85,75,75,79,79,74,73,76,77,67,72,74,74,62,62,67,69,60,61,64,66))
str(radon)
#Creating a simple plot for data visualisation
# building a simple plot for data visualisation
plot(radon$D, radon$RR)
# Analysis of variance for one factor – One-Way ANOVA
# analysis of variance
anova.rr <- aov(RR ~ as.factor(D), data = radon)
summary(anova.rr)
# Creating a table with factors, means and standard deviation
radon_summary <- group_by(radon, D) %>%
  summarise(mean=mean(RR), sd=sd(RR)) %>%
  arrange(desc(mean))
print(radon_summary)
#Comparing means by Tukey’s test
# Tukey's test
tukey.rr <- TukeyHSD(anova.rr)
print(tukey.rr)
#Superscript letters to indicate significant differences
# creating the compact letter display
cld.rr <- multcompLetters4(anova.rr, tukey.rr)
print(cld.rr)
## adding the compact letter display to the table with means and sd
cld <- as.data.frame.list(cld.rr$`as.factor(D)`)
radon_summary$Tukey <- cld$Letters
print(radon_summary)
write.csv("data_summary.csv")
# now other plots are based on this data
