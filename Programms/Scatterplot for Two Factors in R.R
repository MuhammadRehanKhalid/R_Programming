# loading the appropriate libraries
library(readr)
library(ggplot2)
# loading and checking the data
data_summary <- read_csv('D:/R Programming/R_Programming/Data Sets/GTL_summary.csv')
print(data_summary)
# Basic scatterplot
ggplot(data_summary, aes(Temp, mean)) + 
  geom_point()
# Using colours and shapes to split the results
ggplot(data_summary, aes(Temp, mean, color = Glass)) + 
  geom_point(aes(shape = Glass))
# Adding lines to connect the points
ggplot(data_summary, aes(Temp, mean, color = Glass)) + 
  geom_point(aes(shape = Glass)) +
  geom_line(aes(linetype = Glass))
# Avoiding the overlay of the data (position dodge)
ggplot(data_summary, aes(Temp, mean, color = Glass)) + 
  geom_point(aes(shape = Glass), position=position_dodge(width=5)) +
  geom_line(aes(linetype = Glass), position=position_dodge(width=5))
#Adding error bars
ggplot(data_summary, aes(Temp, mean, color = Glass)) + 
  geom_point(aes(shape = Glass), position=position_dodge(width=5)) +
  geom_line(aes(linetype = Glass), position=position_dodge(width=5)) +
  geom_errorbar(aes(ymin=mean-sd, ymax=mean+sd), position=position_dodge(width=5))
#Now we are going to correct two details:
#The error bars are too wide, so we are going to define their width using width = 5.
#The legend on the right does not show the line type anymore (compare with the previous plot). 
#This happens because a straight line for the legend of the error bars was added over it. 
#We can use the argument show.legend = FALSE in the geom_errorbar() function to avoid it.
ggplot(data_summary, aes(Temp, mean, color = Glass)) + 
  geom_point(aes(shape = Glass), position=position_dodge(width=5)) +
  geom_line(aes(linetype = Glass), position=position_dodge(width=5)) +
  geom_errorbar(aes(ymin=mean-sd, ymax=mean+sd), position=position_dodge(width=5), 
                width = 5, show.legend = FALSE)
#Customising the x and y titles
ggplot(data_summary, aes(Temp, mean, color = Glass)) + 
  geom_point(aes(shape = Glass), position=position_dodge(width=5)) +
  geom_line(aes(linetype = Glass), position=position_dodge(width=5)) +
  geom_errorbar(aes(ymin=mean-sd, ymax=mean+sd), position=position_dodge(width=5), 
                width = 5, show.legend = FALSE) +
  labs(x="Temperature (˚C)", y="Light Output")
#Customising the theme and legend position
ggplot(data_summary, aes(Temp, mean, color = Glass)) + 
  geom_point(aes(shape = Glass), position=position_dodge(width=5)) +
  geom_line(aes(linetype = Glass), position=position_dodge(width=5)) +
  geom_errorbar(aes(ymin=mean-sd, ymax=mean+sd), position=position_dodge(width=5), 
                width = 5, show.legend = FALSE) +
  labs(x="Temperature (˚C)", y="Light Output") +
  theme_bw() + 
  theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank()) +
  theme(legend.position = c(0.1, 0.7))
#Adding the compact letter display
ggplot(data_summary, aes(Temp, mean, color = Glass)) + 
  geom_point(aes(shape = Glass), position=position_dodge(width=5)) +
  geom_line(aes(linetype = Glass), position=position_dodge(width=5)) +
  geom_errorbar(aes(ymin=mean-sd, ymax=mean+sd), position=position_dodge(width=5), 
                width = 5, show.legend = FALSE) +
  labs(x="Temperature (˚C)", y="Light Output") +
  theme_bw() + 
  theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank()) +
  theme(legend.position = c(0.1, 0.7)) +
  geom_text(aes(label=Tukey), size = 3, 
            position = position_dodge(width=5), vjust=1.5, show.legend = FALSE)
# Customising the x and y limits and axis breaks
ggplot(data_summary, aes(Temp, mean, color = Glass)) + 
  geom_point(aes(shape = Glass), position=position_dodge(width=5)) +
  geom_line(aes(linetype = Glass), position=position_dodge(width=5)) +
  geom_errorbar(aes(ymin=mean-sd, ymax=mean+sd), position=position_dodge(width=5), 
                width = 5, show.legend = FALSE) +
  labs(x="Temperature (˚C)", y="Light Output") +
  theme_bw() + 
  theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank()) +
  theme(legend.position = c(0.1, 0.7)) +
  geom_text(aes(label=Tukey), size = 3, 
            position = position_dodge(width=5), vjust=1.5, show.legend = FALSE) +
  scale_x_continuous(breaks=c(100,125,150)) +
  scale_y_continuous(limits=c(450, 1450), breaks=seq(500,1400,300))
# Improving the visualisation of the shapes
ggplot(data_summary, aes(Temp, mean, color = Glass)) + 
  geom_point(aes(shape = Glass), position=position_dodge(width=5), alpha=0.4, size = 3) +
  geom_line(aes(linetype = Glass), position=position_dodge(width=5)) +
  geom_errorbar(aes(ymin=mean-sd, ymax=mean+sd), position=position_dodge(width=5), 
                width = 5, show.legend = FALSE) +
  labs(x="Temperature (˚C)", y="Light Output") +
  theme_bw() + 
  theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank()) +
  theme(legend.position = c(0.1, 0.7)) +
  geom_text(aes(label=Tukey), size = 3, 
            position = position_dodge(width=5), vjust=1.5, show.legend = FALSE) +
  scale_x_continuous(breaks=c(100,125,150)) +
  scale_y_continuous(limits=c(450, 1450), breaks=seq(500,1400,300))
