# loading the appropriate libraries
library(readr)
library(ggplot2)
library(multcompView)
library(dplyr)
# loading and checking the data
GTL <- read_csv("D:/R Programming/R_Programming/Data Sets/GTL.csv")
head(GTL)
str(GTL)
#Creating a simple plot for data visualisation
# building a simple plot for data visualisation
qplot(x = Temp, y = Light, geom = "point", data = GTL) +
  facet_grid(.~Glass, labeller = label_both)
# Two-Way ANOVA Analysis of variance for two factors – Two-Way ANOVA
# creating a variable as factor for the ANOVA
GTL$Glass <- as.factor(GTL$Glass)
GTL$Temp_Factor <- as.factor(GTL$Temp)
str(GTL)
# Two-Way ANOVA
# analysis of variance
anova <- aov(Light ~ Glass*Temp_Factor, data = GTL)
summary(anova)
#Creating a table with factors, means and standard deviation
# table with factors, means and standard deviation
data_summary <- group_by(GTL, Glass, Temp) %>%
  summarise(mean=mean(Light), sd=sd(Light)) %>%
  arrange(desc(mean))
print(data_summary)
#Comparing means by Tukey’s test
tukey <- TukeyHSD(anova)
print(tukey)
#Compact letter display to indicate significant differences
tukey.cld <- multcompLetters4(anova, tukey)
print(tukey.cld)
# adding the compact letter display to the table with means and sd
cld <- as.data.frame.list(tukey.cld$`Glass:Temp_Factor`)
data_summary$Tukey <- cld$Letters
print(data_summary)
write.csv("GTL_summary.csv")
#Plots for the final presentation of the results.
#Plots for the final presentation of the results.
#This section shows examples of bar and scatter plots suitable 
#for presentations, posters and written reports. 
#The plots show the mean, the standard deviation and the compact letter display for each treatment.

#Barplots
#The coloured barplot presents the faceplate glass labels at the base of the columns, 
#making it possible to interpret the results even when printed in grey-scale or by a colourblind individual. 
#In this case of the grey-scale barplot, the glass labels at the base of the columns are not necessary since the shades of grey are clear enough to identify the results.