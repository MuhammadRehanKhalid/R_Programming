library(readxl)
library(ggplot2)
library(dplyr)

# Load the Excel file without renaming columns
df <- read_excel("D:\\Python_Ka_Chila\\Data_Science_Ammar\\Dr_Nawaz_Project_Line_Graph\\Extracted_for Python_3rd_paper.xlsx", 
                 .name_repair = "minimal")
df
# Extract the categorical columns and the data columns
categories <- df[, 1:2]  # First two columns are 'variety' and 'treatment'
data <- df[, 3:ncol(df)]  # Remaining columns are variables and their standard errors

# Define a darker color palette for varieties
unique_varieties <- unique(categories$variety)
palette <- scales::hue_pal()(length(unique_varieties))  # Using a vibrant color palette
variety_colors <- setNames(palette, unique_varieties)

# Define the output directory
output_directory <- "D:\\R Programming\\R_Programming\\R_with_Ammar\\Outputs\\Figures"

# Create individual plots and export them
for (i in seq(1, ncol(data), by = 2)) {
  variable <- colnames(data)[i]
  error <- colnames(data)[i + 1]  # SE column next to variable column
  
  means <- data[[variable]]
  errors <- data[[error]]
  
  # Create a DataFrame for plotting
  plot_data <- data.frame(
    variety = as.factor(categories$variety),
    treatment = as.factor(categories$treatment),
    means = means,
    errors = errors
  )
  
  # Adjust the axis title for long names
  variable_axis_title <- gsub("(.{20})", "\\1\n", variable)  # Insert line breaks for long variable names
  
  # Create a bar plot for each variety, removing the legend
  p <- ggplot(plot_data, aes(x = treatment, y = means, fill = variety)) +
    geom_bar(stat = "identity", position = position_dodge(width = 0.9), color = "black") +
    geom_errorbar(aes(ymin = means - errors, ymax = means + errors), 
                  position = position_dodge(width = 0.9), 
                  width = 0.5,    # Increase width of error bars for visibility
                  size = 1) +     # Increase line thickness of error bars
    scale_fill_manual(values = variety_colors) +
    labs(title = variable, x = "Treatment", y = variable_axis_title) +
    scale_y_continuous(expand = expansion(mult = c(0.05, 0.1))) +  # Automatically set limits with a buffer
    theme_minimal() +
    theme(
      plot.background = element_rect(fill = "white"),
      panel.background = element_rect(fill = "white"),
      axis.title = element_text(size = 14),
      axis.text = element_text(size = 12),
      plot.title = element_text(size = 16, face = "bold"),
      plot.margin = margin(20, 20, 20, 20)  # Increase margins to prevent cutoff of elements
    )
  
  # Save each plot as a PNG file in the specified directory with the column name as file name
  file_name <- paste0(output_directory, "/", variable, ".png")
  ggsave(filename = file_name, plot = p, width = 8, height = 6, dpi = 300)  # Individual plot size
  
  # Display a message confirming the export
  message(paste("Exported:", file_name))
}
