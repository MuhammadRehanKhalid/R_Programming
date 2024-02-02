#Libraries Needed
# loading the appropriate libraries
library(readr)
library(ggplot2)

# loading and checking the data
radon_summary <- read_csv('D:/R Programming/R_Programming/Data Sets/radon_summary.csv')
print(radon_summary)
# Gray-scale barplot
ggplot(radon_summary, aes(factor(D), mean)) + 
  geom_bar(stat = "identity")
# Gray-scale barplot
ggplot(radon_summary, aes(factor(D), mean)) + 
  geom_bar(stat = "identity", width=0.8, alpha=0.8)
#Adding error bars
# Gray-scale barplot
#sd = sd(radon_summary$RL)
#mean = mean(radon_summary$RL)
ggplot(radon_summary, aes(factor(D), mean)) + 
  geom_bar(stat = "identity", width=0.8, alpha=0.8) +
  geom_errorbar(aes(ymin=mean-sd, ymax=mean+sd), width=0.2)
# Gray-scale barplot
ggplot(radon_summary, aes(factor(D), mean)) + 
  geom_bar(stat = "identity", width=0.8, alpha=0.8) +
  geom_errorbar(aes(ymin=mean-sd, ymax=mean+sd), width = 0.2) + 
  labs(x="Diameter (mm)", y="Radon Released (%)")
#Formating the overall visualisation 
# Gray-scale barplot
ggplot(radon_summary, aes(factor(D), mean)) + 
  geom_bar(stat = "identity", width=0.8, alpha=0.8) +
  geom_errorbar(aes(ymin=mean-sd, ymax=mean+sd), width = 0.2) + 
  labs(x="Diameter (mm)", y="Radon Released (%)") +
  theme_bw() + 
  theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank())
# Adding the compact letter display from Tukey’s test
ggplot(radon_summary, aes(factor(D), mean)) + 
  geom_bar(stat = "identity", width=0.8, alpha=0.8) +
  geom_errorbar(aes(ymin=mean-sd, ymax=mean+sd), width = 0.2) + 
  labs(x="Diameter (mm)", y="Radon Released (%)") +
  theme_bw() + 
  theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank()) +
  geom_text(aes(label=Tukey))


# Gray-scale barplot adjust lables
ggplot(radon_summary, aes(factor(D), mean)) + 
  geom_bar(stat = "identity", width=0.8, alpha=0.8) +
  geom_errorbar(aes(ymin=mean-sd, ymax=mean+sd), width = 0.2) + 
  labs(x="Diameter (mm)", y="Radon Released (%)") +
  theme_bw() + 
  theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank()) +
  geom_text(aes(label=Tukey), nudge_x = 0.25, nudge_y = 5, size = 3)
# Adding colors to the barplots
ggplot(radon_summary, aes(factor(D), mean)) + 
  geom_bar(stat = "identity", width=0.8, alpha=0.8, fill = "steelblue") +
  geom_errorbar(aes(ymin=mean-sd, ymax=mean+sd), width = 0.2, color = "steelblue4") + 
  labs(x="Diameter (mm)", y="Radon Released (%)") +
  theme_bw() + 
  theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank()) +
  geom_text(aes(label=Tukey), nudge_x = 0.25, nudge_y = 5, size = 3, color = "steelblue4")
# Barplots colored according Tukey’s test results
ggplot(radon_summary, aes(factor(D), mean, fill = Tukey)) + 
  geom_bar(stat = "identity", width=0.8, alpha=0.8) +
  geom_errorbar(aes(ymin=mean-sd, ymax=mean+sd), width = 0.2) + 
  labs(x="Diameter (mm)", y="Radon Released (%)") +
  theme_bw() + 
  theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank()) +
  geom_text(aes(label=Tukey), nudge_x = 0.25, nudge_y = 5, size = 3)

# Now the colours of the barplot indicate significant differences by Tukey’s test. 
ggplot(radon_summary, aes(factor(D), mean, fill = Tukey)) + 
  geom_bar(stat = "identity", width=0.8, alpha=0.8, show.legend = FALSE) +
  scale_fill_brewer(palette = "BrBG") +
  geom_errorbar(aes(ymin=mean-sd, ymax=mean+sd), width = 0.2) + 
  labs(x="Diameter (mm)", y="Radon Released (%)") +
  theme_bw() + 
  theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank()) +
  geom_text(aes(label=Tukey), nudge_x = 0.25, nudge_y = 5, size = 3)
ggsave("barplot.png", width = 4, height = 3, dpi = 1000)
