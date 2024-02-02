# loading the appropriate libraries
library(readr)
library(ggplot2)
# load the data
radon_summary <- read_csv('D:/R Programming/R_Programming/Data Sets/radon_summary.csv')
print(radon_summary)

# basic scatter plot
ggplot(radon_summary, aes(D, mean)) + 
  geom_point()
#Adding error bars
# scatterplot
ggplot(radon_summary, aes(D, mean)) + 
  geom_point() +
  geom_errorbar(aes(ymin=mean-sd, ymax=mean+sd))
# rebasing and formating___________________________#
# scatterplot
ggplot(radon_summary, aes(D, mean)) + 
  geom_point(size = 2) +
  geom_errorbar(aes(ymin=mean-sd, ymax=mean+sd), width = 0.05)
#Customizing x and y titles_________________________________#
ggplot(radon_summary, aes(D, mean)) + 
  geom_point(size = 2) +
  geom_errorbar(aes(ymin=mean-sd, ymax=mean+sd), width = 0.05) +
  labs(x="Diameter (mm)", y="Radon Released (%)")
# Formating the overall visualisation_____________________#
ggplot(radon_summary, aes(D, mean)) + 
  geom_point(size = 2) +
  geom_errorbar(aes(ymin=mean-sd, ymax=mean+sd), width = 0.05) +
  labs(x="Diameter (mm)", y="Radon Released (%)") +
  theme_bw() + 
  theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank())
# Joining the points with lines___________________________#
# scatterplot + straight line
ggplot(radon_summary, aes(D, mean)) + 
  geom_point(size = 2) +
  geom_errorbar(aes(ymin=mean-sd, ymax=mean+sd), width = 0.05) +
  labs(x="Diameter (mm)", y="Radon Released (%)") +
  theme_bw() + 
  theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank()) +
  geom_smooth() + 
  labs(subtitle="Smoothed line joining points")

# scatterplot + smoothed line___________________#
ggplot(radon_summary, aes(D, mean)) + 
  geom_point(size = 2) +
  geom_errorbar(aes(ymin=mean-sd, ymax=mean+sd), width = 0.05) +
  labs(x="Diameter (mm)", y="Radon Released (%)") +
  theme_bw() + 
  theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank()) +
  geom_line() + 
  labs(subtitle="Straight line joining points")
# Adding trendlines to the scatterplot_______________#
# scatterplot + trendline: linear
ggplot(radon_summary, aes(D, mean)) + 
  geom_point(size = 2) +
  geom_errorbar(aes(ymin=mean-sd, ymax=mean+sd), width = 0.05) +
  labs(x="Diameter (mm)", y="Radon Released (%)") +
  theme_bw() + 
  theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank()) +
  geom_smooth(method = "lm", formula = y ~ x) + 
  labs(subtitle="Trendline: linear")

# scatterplot + trendline: quadratic
ggplot(radon_summary, aes(D, mean)) + 
  geom_point(size = 2) +
  geom_errorbar(aes(ymin=mean-sd, ymax=mean+sd), width = 0.05) +
  labs(x="Diameter (mm)", y="Radon Released (%)") +
  theme_bw() + 
  theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank()) +
  geom_smooth(method = "lm", formula = y ~ x + I(x^2)) + 
  labs(subtitle="Trendline: quadratic")

# scatterplot + trendline: exponential
ggplot(radon_summary, aes(D, mean)) + 
  geom_point(size = 2) +
  geom_errorbar(aes(ymin=mean-sd, ymax=mean+sd), width = 0.05) +
  labs(x="Diameter (mm)", y="Radon Released (%)") +
  theme_bw() + 
  theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank()) +
  geom_smooth(method = "lm", formula = y ~ exp(-x)) + 
  labs(subtitle="Trendline: exponential")
#Formating the trendline ______________________________#
ggplot(radon_summary, aes(D, mean)) + 
  geom_smooth(method = "lm", formula = y ~ exp(-x), se = FALSE, color = "Gray50", size = 0.5) +
  geom_point(size = 2) +
  geom_errorbar(aes(ymin=mean-sd, ymax=mean+sd), width = 0.05) +
  labs(x="Diameter (mm)", y="Radon Released (%)") +
  theme_bw() + 
  theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank())
# Adding compact letter display from Tukey’s test
# scatterplot + trendline: exponential
ggplot(radon_summary, aes(D, mean)) + 
  geom_smooth(method = "lm", formula = y ~ exp(-x), se = FALSE, color = "Gray50", size = 0.5) +
  geom_point(size = 2) +
  geom_errorbar(aes(ymin=mean-sd, ymax=mean+sd), width = 0.05) +
  labs(x="Diameter (mm)", y="Radon Released (%)") +
  theme_bw() + 
  theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank()) +
  geom_text(aes(label=Tukey))
# scatterplot + trendline: exponential__________________#
ggplot(radon_summary, aes(D, mean)) + 
  geom_smooth(method = "lm", formula = y ~ exp(-x), se = FALSE, color = "Gray50", size = 0.5) +
  geom_point(size = 2) +
  geom_errorbar(aes(ymin=mean-sd, ymax=mean+sd), width = 0.05) +
  labs(x="Diameter (mm)", y="Radon Released (%)") +
  theme_bw() + 
  theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank()) +
  geom_text(aes(label=Tukey, y = mean + sd + 2), size = 3)
# Adding COlors to the scatterplot_______________________#
ggplot(radon_summary, aes(D, mean)) + 
  geom_smooth(method = "lm", formula = y ~ exp(-x), se = FALSE, color = "seagreen3", size = 0.5) +
  geom_point(size = 2, color = "green") +
  geom_errorbar(aes(ymin=mean-sd, ymax=mean+sd), width = 0.05, color = "seagreen") +
  labs(x="Diameter (mm)", y="Radon Released (%)") +
  theme_bw() + 
  theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank()) +
  geom_text(aes(label=Tukey, y = mean + sd + 2), size = 3, color = "seagreen4")
ggsave("scatterplot.png", width = 4, height = 2.5, dpi = 1000)
dev.off()
