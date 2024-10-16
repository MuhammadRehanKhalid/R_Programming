# loading the appropriate libraries
library(ggplot2)
library(ggthemes)
library(multcompView)
library(dplyr)
#______________________________________________________________________________________________________#
#Data analysis and table with the with the mean, 
#the standard deviation and the compact letter display
## The first step is to perform the analysis of variance, mostly known as ANOVA, using the aov function.
#Then the means comparison by Tukey’s test can be run on the object resulting from the analysis of variance.
#The use of letters to indicate significant differences in pairwise comparisons is called compact letter display,
#and can simplify the visualisation and discussion of significant differences among means. We are going to use the 
#multcompLetters4 function from the multcompView package. The arguments are the object from an aov function and the object from the TukeyHSD function.
#Finally, we are going to build a table with the mean, the standard deviation and the letters for each treatment (feed). 
#The data in this table will be use to build the barplot.
#________________________________________________________________________________________________________#
# analysis of variance
anova <- aov(weight ~ feed, data = chickwts)

# Tukey's test
tukey <- TukeyHSD(anova)

# compact letter display
cld <- multcompLetters4(anova, tukey)

# table with factors and 3rd quantile
dt <- group_by(chickwts, feed) %>%
  summarise(w=mean(weight), sd = sd(weight)) %>%
  arrange(desc(w))

# extracting the compact letter display and adding to the Tk table
cld <- as.data.frame.list(cld$feed)
dt$cld <- cld$Letters

print(dt)
# Barplot with error bars
ggplot(dt, aes(feed, w)) + 
  geom_bar(stat = "identity", aes(fill = w), show.legend = FALSE) +
  geom_errorbar(aes(ymin = w-sd, ymax=w+sd), width = 0.2) +
  labs(x = "Feed Type", y = "Average Weight Gain (g)") +
  theme_few()
#Adding the letters indicating significant differences
ggplot(dt, aes(feed, w)) + 
  geom_bar(stat = "identity", aes(fill = w), show.legend = FALSE) +
  geom_errorbar(aes(ymin = w-sd, ymax=w+sd), width = 0.2) +
  labs(x = "Feed Type", y = "Average Weight Gain (g)") +
  geom_text(aes(label = cld)) +
  theme_few()
# Letter’s position: just above the bars and beside the error bars
ggplot(dt, aes(feed, w)) + 
  geom_bar(stat = "identity", aes(fill = w), show.legend = FALSE) +
  geom_errorbar(aes(ymin = w-sd, ymax=w+sd), width = 0.2) +
  labs(x = "Feed Type", y = "Average Weight Gain (g)") +
  geom_text(aes(label = cld), vjust = -0.5, hjust = -0.5) +
  theme_few()
# Letter’s position: just above the error bars
ggplot(dt, aes(feed, w)) + 
  geom_bar(stat = "identity", aes(fill = w), show.legend = FALSE) +
  geom_errorbar(aes(ymin = w-sd, ymax=w+sd), width = 0.2) +
  labs(x = "Feed Type", y = "Average Weight Gain (g)") +
  geom_text(aes(label = cld, y = w + sd), vjust = -0.5) +
  ylim(0,410) +
  theme_few()
# Method 2
ggplot(dt, aes(feed, w)) + 
  geom_bar(stat = "identity", aes(fill = w), show.legend = FALSE) +
  geom_errorbar(aes(ymin = w-sd, ymax=w+sd), width = 0.2) +
  labs(x = "Feed Type", y = "Average Weight Gain (g)") +
  geom_text(aes(label = cld, y = w + sd + 20)) +
  ylim(0,410) +
  theme_few()
ggsave("barplot.png", width = 4.2, height = 3, dpi = 1000)# could not find Copyggplot, install

