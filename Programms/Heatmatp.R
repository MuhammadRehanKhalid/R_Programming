# Load necessary libraries
library(gplots)
library(pheatmap)
library(tidyverse)
library(RColorBrewer)
library(cluster) # Clustering algorithms
library(factoextra)
library(readxl)

# File import and preparation
LC <- read_xlsx(file.choose())
LC <- LC[order(LC$`treatment`),]

# Extract categorical and continuous data
LC_cat <- LC[, 1:2]  # Assuming the first two columns are categorical (days and treatments)
LC_conti <- LC[, 3:ncol(LC)]  # Continuous data from the 3rd column onward

# Check for non-numeric values in continuous data
if (!all(sapply(LC_conti, is.numeric))) {
  stop("Some columns in LC_conti are not numeric. Please check your data.")
}

# Scale the continuous data
SC_LC <- scale(data.matrix(LC_conti), scale = TRUE)

# Reshape the data to long format
LC_long <- LC %>%
  pivot_longer(cols = 3:ncol(LC),  # Assuming the first two columns are categorical
               names_to = "Variable",
               values_to = "Expression")

# Check for non-numeric values in the Expression column
if (!is.numeric(LC_long$Expression)) {
  stop("The Expression column contains non-numeric values.")
}

# Create a heatmap with treatments on one axis and days on the other
heatmap_data <- LC_long %>%
  group_by(`days`, `treatment`, Variable) %>%
  summarise(Mean_Expression = mean(Expression, na.rm = TRUE), .groups = 'drop') %>%
  pivot_wider(names_from = `treatment`, values_from = Mean_Expression)

# Convert to matrix for heatmap
heatmap_matrix <- as.matrix(heatmap_data[,-1])  # Exclude the days column
rownames(heatmap_matrix) <- heatmap_data$`days`

# Check if the heatmap matrix is numeric
if (!is.numeric(heatmap_matrix)) {
  stop("The heatmap matrix contains non-numeric values.")
}

# Define color palette
mycol <- colorRampPalette(c("cyan", "yellow", "darkgreen"))(100)
heatmap_matrix_1 <- heatmap_matrix[,-1]
# Create heatmap
pheatmap(heatmap_matrix_1,
         color = mycol,
         scale = "row",
         main = "Effect of Treatments on Variable Expression by Day",
         fontsize_row = 10,
         fontsize_col = 10,
         cellwidth = 15,
         cellheight = 15,
         legend = TRUE,
         annotation_legend = TRUE)

