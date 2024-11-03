library(readxl)
library(tidyverse)
library(ggpubr)
library(plotly)
# load titanic dat
df <- read_csv("./Data/titanic.csv")
# create a ggplot object
gghistogram(df, 
            x = "Age",
            add = "mean",
            color = 'Sex',
            rug = TRUE,
            fill = "Sex",
            palette = c('#00AFBB', '#E7B800'))
# density plot
p1 <- ggdensity(df, 
            x = "Age",
            add = "mean",
            color = 'Sex',
            rug = TRUE,
            fill = "Sex",
            palette = c('#00AFBB', '#E7B800'))
ggplotly(p1)
# box plot
p2 <- ggboxplot(df, 
                x = "Sex",
                y = "Age",
                add = "mean",
                color = 'Sex',
                rug = TRUE,
                fill = "Sex",
                palette = c('#00AFBB', '#E7B800'))
# Load data
data("ToothGrowth")
df <- ToothGrowth
head(df, 4)

# Box plots with jittered points
# :::::::::::::::::::::::::::::::::::::::::::::::::::
# Change outline colors by groups: dose
# Use custom color palette
# Add jitter points and change the shape by groups
p <- ggboxplot(df, x = "dose", y = "len",
               color = "dose", palette =c("#00AFBB", "#E7B800", "#FC4E07"),
               add = "jitter", shape = "dose")
p

# Add p-values comparing groups
# Specify the comparisons you want
my_comparisons <- list( c("0.5", "1"), c("1", "2"), c("0.5", "2") )
p + stat_compare_means(comparisons = my_comparisons)+ # Add pairwise comparisons p-value
  stat_compare_means(label.y = 50)                   # Add global p-value
