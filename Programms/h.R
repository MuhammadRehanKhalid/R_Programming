# Install and load necessary R packages
install.packages(c("tidyverse", "plotly", "RColorBrewer"))

library(tidyverse)
library(plotly)
library(RColorBrewer)

# Load the CSV file into a data frame
data <- read.csv(file.choose())

# Set the variables as the x-axis and the first column as the y-axis
x <- colnames(data)[3:19]
y <- data[, 1]

# Convert data frame to matrix
data_matrix <- data[, 3:19]

# Normalize the data_matrix
data_matrix_normalized <- scale(data_matrix)

# Choose a color palette from RColorBrewer
color_palette <- brewer.pal(n = 15, name = "BuPu")  # You can choose a different palette

# Create the heatmap using plot_ly with the selected color palette

ig <- plot_ly(z = data_matrix_normalized, x = x, y = y, 
               type = "heatmap",
               colors = color_palette) %>%
  layout(xaxis = list(title = "Physio-Biochemical Parameters"),
         yaxis = list(title = "Light-Salt Concentrations with Days"))

# Show the heatmap
ggsave("with_number.png", fig, width = 10, height = 10, units = "in", dpi = 600,pointsize = 12)

dev.set(dev.next())
# Set the working directory
setwd("D:/Study/Study and Extras/R Files Projects")


