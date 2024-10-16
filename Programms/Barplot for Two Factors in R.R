# loading the appropriate libraries
library(readr)
library(ggplot2)
# loading and checking the data
data_summary <- read_csv('D:/R Programming/R_Programming/Data Sets/GTL_summary.csv')
print(data_summary)
#Basic plot
ggplot(data_summary, aes(x = factor(Temp), y = mean)) + 
  geom_bar(stat = "identity")
#Using colour to split the results
ggplot(data_summary, aes(x = factor(Temp), y = mean, fill = Glass, colour = Glass)) + 
  geom_bar(stat = "identity")
ggplot(data_summary, aes(x = factor(Temp), y = mean, fill = Glass, colour = Glass)) + 
  geom_bar(stat = "identity", position = "dodge")
#Error bars
ggplot(data_summary, aes(x = factor(Temp), y = mean, fill = Glass, colour = Glass)) + 
  geom_bar(stat = "identity", position = "dodge")  +
  geom_errorbar(aes(ymin=mean-sd, ymax=mean+sd))
#clearing anf formating the bars
ggplot(data_summary, aes(x = factor(Temp), y = mean, fill = Glass, colour = Glass)) + 
  geom_bar(stat = "identity", position = "dodge")  +
  geom_errorbar(aes(ymin=mean-sd, ymax=mean+sd), position = position_dodge(0.9), width = 0.25)
ggplot(data_summary, aes(x = factor(Temp), y = mean, fill = Glass, colour = Glass)) + 
  geom_bar(stat = "identity", position = "dodge", alpha = 0.5)  +
  geom_errorbar(aes(ymin=mean-sd, ymax=mean+sd), position = position_dodge(0.9), width = 0.25)
#Customising x and y titles
ggplot(data_summary, aes(x = factor(Temp), y = mean, fill = Glass, colour = Glass)) + 
  geom_bar(stat = "identity", position = "dodge", alpha = 0.5)  +
  geom_errorbar(aes(ymin=mean-sd, ymax=mean+sd), position = position_dodge(0.9), width = 0.25) +
  labs(x="Temperature (˚C)", y="Light Output")
#Customising the theme and legend
ggplot(data_summary, aes(x = factor(Temp), y = mean, fill = Glass, colour = Glass)) + 
  geom_bar(stat = "identity", position = "dodge", alpha = 0.5)  +
  geom_errorbar(aes(ymin=mean-sd, ymax=mean+sd), position = position_dodge(0.9), width = 0.25) +
  labs(x="Temperature (˚C)", y="Light Output") +
  theme_bw() + 
  theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank()) +
  theme(legend.position = c(0.1, 0.75))
#Adding the compact letter display
ggplot(data_summary, aes(x = factor(Temp), y = mean, fill = Glass, colour = Glass)) + 
  geom_bar(stat = "identity", position = "dodge", alpha = 0.5)  +
  geom_errorbar(aes(ymin=mean-sd, ymax=mean+sd), position = position_dodge(0.9), width = 0.25) +
  labs(x="Temperature (˚C)", y="Light Output") +
  theme_bw() + 
  theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank()) +
  theme(legend.position = c(0.1, 0.75)) +
  geom_text(aes(label=Tukey), position = position_dodge(0.90), size = 3, 
            vjust=-0.8, hjust=-0.5, colour = "gray25")
#Customising the y limits
ggplot(data_summary, aes(x = factor(Temp), y = mean, fill = Glass, colour = Glass)) + 
  geom_bar(stat = "identity", position = "dodge", alpha = 0.5)  +
  geom_errorbar(aes(ymin=mean-sd, ymax=mean+sd), position = position_dodge(0.9), width = 0.25) +
  labs(x="Temperature (˚C)", y="Light Output") +
  theme_bw() + 
  theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank()) +
  theme(legend.position = c(0.1, 0.75)) +
  geom_text(aes(label=Tukey), position = position_dodge(0.90), size = 3, 
            vjust=-0.8, hjust=-0.5, colour = "gray25") +
  ylim(0, 1500)
#Adding text labels
ggplot(data_summary, aes(x = factor(Temp), y = mean, fill = Glass, colour = Glass)) + 
  geom_bar(stat = "identity", position = "dodge", alpha = 0.5)  +
  geom_errorbar(aes(ymin=mean-sd, ymax=mean+sd), position = position_dodge(0.9), width = 0.25) +
  labs(x="Temperature (˚C)", y="Light Output") +
  theme_bw() + 
  theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank()) +
  theme(legend.position = c(0.1, 0.75)) +
  geom_text(aes(label=Tukey), position = position_dodge(0.90), size = 3, 
            vjust=-0.8, hjust=-0.5, colour = "gray25") +
  ylim(0, 1500) +
  geom_text(aes(label=Glass, y = 100), position = position_dodge(0.90))
#Cleaning unwanted information in the legend
ggplot(data_summary, aes(x = factor(Temp), y = mean, fill = Glass, colour = Glass)) + 
  geom_bar(stat = "identity", position = "dodge", alpha = 0.5)  +
  geom_errorbar(aes(ymin=mean-sd, ymax=mean+sd), position = position_dodge(0.9), width = 0.25,
                show.legend = FALSE) +
  labs(x="Temperature (˚C)", y="Light Output") +
  theme_bw() + 
  theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank()) +
  theme(legend.position = c(0.1, 0.75)) +
  geom_text(aes(label=Tukey), position = position_dodge(0.90), size = 3, 
            vjust=-0.8, hjust=-0.5, colour = "gray25") +
  ylim(0, 1500) +
  geom_text(aes(label=Glass, y = 100), position = position_dodge(0.90), show.legend = FALSE)
# Customising colours
# coloured barplot
ggplot(data_summary, aes(x = factor(Temp), y = mean, fill = Glass, colour = Glass)) + 
  geom_bar(stat = "identity", position = "dodge", alpha = 0.5)  +
  geom_errorbar(aes(ymin=mean-sd, ymax=mean+sd), position = position_dodge(0.9), width = 0.25,
                show.legend = FALSE) +
  labs(x="Temperature (˚C)", y="Light Output") +
  theme_bw() + 
  theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank()) +
  theme(legend.position = c(0.1, 0.75)) +
  geom_text(aes(label=Tukey), position = position_dodge(0.90), size = 3, 
            vjust=-0.8, hjust=-0.5, colour = "gray25") +
  ylim(0, 1500) +
  geom_text(aes(label=Glass, y = 100), position = position_dodge(0.90), show.legend = FALSE) +
  scale_fill_brewer(palette = "Dark2") +
  scale_color_brewer(palette = "Dark2")
#Gray-scale
ggplot(data_summary, aes(x = factor(Temp), y = mean, fill = Glass)) + 
  geom_bar(stat = "identity", position = "dodge", alpha = 0.5, colour = "gray25")  +
  geom_errorbar(aes(ymin=mean-sd, ymax=mean+sd), position = position_dodge(0.9), width = 0.25,
                show.legend = FALSE, colour = "gray25") +
  labs(x="Temperature (˚C)", y="Light Output") +
  theme_bw() + 
  theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank()) +
  theme(legend.position = c(0.1, 0.75)) +
  geom_text(aes(label=Tukey), position = position_dodge(0.90), size = 3, 
            vjust=-0.8, hjust=-0.5, colour = "gray25") +
  ylim(0, 1500) +
  scale_fill_grey()
ggsave("barplot1.png", width = 4, height = 3, dpi = 1000)
