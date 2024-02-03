#Bar Plots for presenting three-factors
library(ggplot2)
library(ggthemes)
library(dplyr)
library(multcompView)
library(egg)

str(CO2)
head(CO2)
#write.csv(CO2,"D:/R Programming/R_Programming/Data Sets/CO2.csv")
#Analysis and organisation of the data
CO2$Plant<-as.factor(CO2$Plant)
CO2$Type<-as.factor(CO2$Type)
CO2$Treatment<-as.factor(CO2$Treatment)
CO2$conc<-as.factor(CO2$conc)
CO2$uptake<-as.numeric(CO2$uptake)
# plot___________________________# Chawleen khudki
p <- ggplot(CO2, aes(x=Type, y=uptake, fill=conc)) +
  geom_bar(stat="identity", position=position_dodge()) +
  theme_minimal() +
  theme(legend.position="top") +
  labs(title="CO2 Uptake by Type and Concentration",
       x="Type", y="Uptake",
       fill="Concentration")
p
#_________________________________________________#
# Analysis and organisation of the data
anova <- aov(uptake ~ factor(conc)*Type*Treatment, data = CO2)
summary(anova)
# Tukey's test and compact letter display
Tukey <- TukeyHSD(anova)
cld <- multcompLetters4(anova, Tukey)

# Table with the mean, the standard deviation and the letters indications significant differences for each treatment
dt <- group_by(CO2, conc, Type, Treatment) %>%
  summarise(uptake_mean=mean(uptake), sd=sd(uptake)) %>%
  arrange(desc(uptake_mean))
cld <- as.data.frame.list(cld$`factor(conc):Type:Treatment`)
dt$Tukey <- cld$Letters

print(dt)
#Basic Barplot___________________________________#
ggplot(dt, aes(x = factor(conc), y = uptake_mean, fill = Type:Treatment)) +
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
ggplot(dt, aes(x = factor(conc), y = uptake_mean, fill = Treatment)) +
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
