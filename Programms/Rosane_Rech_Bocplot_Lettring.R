#-------------------------#
#Librariwa needed
library(datasets)
library(ggplot2)
library(multcompView)
library(dplyr)
#-------------------------#
str(chickwts)
chickwts
## analysis of variance
anova <- aov(weight ~ feed, data = chickwts)
summary(anova)
## Tukey's test
tukey <- TukeyHSD(anova)
print(tukey)
## plot compact letter display
cld <- multcompLetters4(anova, tukey)
print(cld)
#-------------------------#
#Creating tables with letters
