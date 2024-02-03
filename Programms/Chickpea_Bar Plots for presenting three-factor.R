options(error=NULL)
#Bar Plots for presenting three-factors
library(ggplot2)
library(ggthemes)
library(dplyr)
library(multcompView)
library(egg)

CO2 = read.csv("D:/R Programming/R_Programming/Data Sets/chickpea.csv")
CO2
# plot___________________________# Chawleen khudki
p <- ggplot(CO2, aes(x=Plant, y=RL, fill=Treatment)) +
  geom_bar(stat="identity", position=position_dodge()) +
  theme_minimal() +
  theme(legend.position="right") +
  labs(title="Root lenght of both varieties and different treatments",
       x="Variety", y="Root Length (cm)",
       fill="Concentration")
p
#_________________________________________________#
# Analysis and organisation of the data
anova <- aov(RL ~ factor(Plant)*Type*Treatment, data = CO2)
summary(anova)
# Tukey's test and compact letter display
Tukey <- TukeyHSD(anova)
cld <- multcompLetters4(anova, Tukey)

# Table with the mean, the standard deviation and the letters indications significant differences for each treatment
dt <- group_by(CO2, Plant, Type, Treatment) %>%
  summarise(uptake_mean=mean(RL), sd=sd(RL)) %>%
  arrange(desc(uptake_mean))
cld <- as.data.frame.list(cld$`factor(conc):Type:Treatment`)
dt$Tukey <- cld$Letters
dt
print(dt)
_______________________________________________________________
# Your ggplot code
# Check for extreme values
summary(CO2$RL)
# Example: Log transformation
CO2$RL <- log(CO2$RL + 1)
# Check for zero variance
apply(CO2, 2, var)

__________________________________________________________________________
#Basic Barplot___________________________________#
ggplot(dt, aes(x = factor(Plant), y = uptake_mean, fill = Type:Treatment)) +
  geom_bar(stat = "identity", position = "dodge") +
  geom_errorbar(aes(ymax = uptake_mean + sd, ymin = uptake_mean - sd),
                position = position_dodge(0.9), width = 0.25, color = "Gray25") +
  xlab(expression(CO[2]~Concentration~'('~mL~L^-1~')')) +
  ylab(expression(CO[2]~Uptake~'('~µmol~m^2~s^-1~')')) +
  scale_fill_brewer(palette = "Greens") +
  theme_few()
# Spliting the visualisation into two plots_______________#
ggplot(dt, aes(x = factor(conc), y = uptake_mean, fill = Treatment)) +
  geom_bar(stat = "identity", position = "dodge") +
  geom_errorbar(aes(ymax = uptake_mean + sd, ymin = uptake_mean - sd),
                position = position_dodge(0.9), width = 0.25, color = "Gray25") +
  xlab(expression(CO[2]~Concentration~'('~mL~L^-1~')')) +
  ylab(expression(CO[2]~Uptake~'('~µmol~m^2~s^-1~')')) +
  scale_fill_brewer(palette = "Greens") +
  theme_few() +
  facet_grid(.~Type, labeller = label_both)
# barplot
ggplot(dt, aes(x = factor(Plant), y = uptake_mean, fill = Treatment)) +
  geom_bar(stat = "identity", position = "dodge") +
  geom_errorbar(aes(ymax = uptake_mean + sd, ymin = uptake_mean - sd),
                position = position_dodge(0.9), width = 0.25, color = "Gray25") +
  xlab(expression(CO[2]~Concentration~'('~mL~L^-1~')')) +
  ylab(expression(CO[2]~Uptake~'('~µmol~m^2~s^-1~')')) +
  theme_few() +
  theme(legend.position = c(0.58, 0.8)) +
  scale_fill_brewer(palette = "Greens") +
  facet_grid(.~Type, labeller = label_both) +
  geom_text(aes(label=Tukey, y = uptake_mean + sd + 2), size = 3, color = "Gray25",
            show.legend = FALSE,
            position = position_dodge(0.9)) +
  ylim(0,50)
# Relocating letters
p <- ggplot(dt, aes(x = factor(conc), y = uptake_mean, fill = Treatment)) +
  geom_bar(stat = "identity", position = "dodge") +
  geom_errorbar(aes(ymax = uptake_mean + sd, ymin = uptake_mean - sd),
                position = position_dodge(0.9), width = 0.25, color = "Gray25") +
  xlab(expression(CO[2]~Concentration~'('~mL~L^-1~')')) +
  ylab(expression(CO[2]~Uptake~'('~µmol~m^2~s^-1~')')) +
  theme_few() +
  theme(legend.position = c(0.58, 0.76)) +
  scale_fill_brewer(palette = "Greens") +
  facet_grid(.~Type, labeller = label_both) +
  geom_text(aes(label=Tukey, y = uptake_mean + sd + 2), size = 3, color = "Gray25",
            show.legend = FALSE,
            position = position_dodge(0.9)) +
  ylim(0,50)

tag_facet(p)
# relocating the again formatting the letters
p <- ggplot(dt, aes(x = factor(conc), y = uptake_mean, fill = Treatment)) +
  geom_bar(stat = "identity", position = "dodge") +
  geom_errorbar(aes(ymax = uptake_mean + sd, ymin = uptake_mean - sd),
                position = position_dodge(0.9), width = 0.25, color = "Gray25") +
  xlab(expression(CO[2]~Concentration~'('~mL~L^-1~')')) +
  ylab(expression(CO[2]~Uptake~'('~µmol~m^2~s^-1~')')) +
  theme_few() +
  theme(legend.position = c(0.58, 0.80)) +
  theme(legend.title = element_blank()) +
  scale_fill_manual(values = c("#C1D5A5", "#84A17C")) +
  facet_grid(.~Type, labeller = label_both) +
  geom_text(aes(label=Tukey, y = uptake_mean + sd + 2), size = 3, color = "Gray25",
            show.legend = FALSE,
            position = position_dodge(0.9)) +
  ylim(0,50)

tag_facet(p, fontface = 1, tag_pool = c("(a) Quebec",
                                        "(b) Mississipi"),
          open = NULL, close = NULL, hjust = -0.05)
ggsave("CO2_barplot.png", width = 9, height = 3.5, dpi = 1000)
