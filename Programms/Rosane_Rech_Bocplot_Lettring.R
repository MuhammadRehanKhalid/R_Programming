#-------------------------#
#Librariwa needed
library(datasets)
library(ggplot2)
library(multcompView)
library(dplyr)
#-------------------------#
str(chickwts)
write.csv(chickwts, "D:/R Programming/R_Programming/Data Sets/chickwts.csv", row.names = T)
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
# table with factors and 3rd quantile
Tk <- group_by(chickwts, feed) %>%
  summarise(mean=mean(weight), quant = quantile(weight, probs = 0.75)) %>%
  arrange(desc(mean))

# extracting the compact letter display and adding to the Tk table
cld <- as.data.frame.list(cld$feed)
Tk$cld <- cld$Letters

print(Tk)
#Basic boxplot
ggplot(chickwts, aes(feed, weight)) + 
  geom_boxplot()
# Coustomize x and y titles
ggplot(chickwts, aes(feed, weight)) + 
  geom_boxplot() +
  labs(x="Feed Type", y="Weight (g)")
#Coustomize overall visulization
# boxplot
ggplot(chickwts, aes(feed, weight)) + 
  geom_boxplot() +
  labs(x="Feed Type", y="Weight (g)") +
  theme_bw() + 
  theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank())
# adding compact letter display from tukeys Test
ggplot(chickwts, aes(feed, weight)) + 
  geom_boxplot() +
  labs(x="Feed Type", y="Weight (g)") +
  theme_bw() + 
  theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank()) +
  geom_text(data = Tk, aes(x = feed, y = quant, label = cld))
#adjust letter so that we can easily view perfect
ggplot(chickwts, aes(feed, weight)) + 
  geom_boxplot() +
  labs(x="Feed Type", y="Weight (g)") +
  theme_bw() + 
  theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank()) +
  geom_text(data = Tk, aes(x = feed, y = quant, label = cld), size = 3, vjust=-1, hjust =-1)
# adding colors to box plots
ggplot(chickwts, aes(feed, weight)) + 
  geom_boxplot(fill = "lightblue", color = "darkblue") +
  labs(x="Feed Type", y="Weight (g)") +
  theme_bw() + 
  theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank()) +
  geom_text(data = Tk, aes(x = feed, y = quant, label = cld), size = 3, vjust=-1, hjust =-1, color = "darkblue")
# colored according to the feed type or factors
ggplot(chickwts, aes(feed, weight)) + 
  geom_boxplot(aes(fill = feed)) +
  labs(x="Feed Type", y="Weight (g)") +
  theme_bw() + 
  theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank()) +
  geom_text(data = Tk, aes(x = feed, y = quant, label = cld), size = 3, vjust=-1, hjust =-1)
# hidden legend
ggplot(chickwts, aes(feed, weight)) + 
  geom_boxplot(aes(fill = feed), show.legend = FALSE) +
  labs(x="Feed Type", y="Weight (g)") +
  theme_bw() + 
  theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank()) +
  geom_text(data = Tk, aes(x = feed, y = quant, label = cld), size = 3, vjust=-1, hjust =-1) +
  scale_fill_brewer(palette = "Pastel1")
# colored accorfing to median
ggplot(chickwts, aes(feed, weight)) + 
  geom_boxplot(aes(fill = factor(..middle..)), show.legend = FALSE) +
  labs(x="Feed Type", y="Weight (g)") +
  theme_bw() + 
  theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank()) +
  geom_text(data = Tk, aes(x = feed, y = quant, label = cld), size = 3, vjust=-1, hjust =-1) +
  scale_fill_brewer(palette = "Blues")
ggsave("boxplot.png", width = 4, height = 3, dpi = 1000)
