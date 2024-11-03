library(tidyverse)
library(readxl)
library(writexl)
library(readr)
library(ggplot2)

# load data
df <- read_excel("C:\\Users\\mirza\\OneDrive\\Desktop\\Data_file.xlsx")

# Assuming the first three columns are categorical and the rest are continuous variables
categorical_columns <- names(df)[1:3]
continuous_columns <- names(df)[4:ncol(df)]

# Create a new data frame to store the results
results <- df %>% select(all_of(categorical_columns)) %>% distinct()

# Process each continuous column
for (col in continuous_columns) {
  # Calculate mean and standard error for every 3 rows
  df_mean <- df %>%
    group_by(group = (row_number() - 1) %/% 3) %>%
    summarise(mean = mean(!!sym(col), na.rm = TRUE), 
              stderr = sd(!!sym(col), na.rm = TRUE) / sqrt(n()), 
              .groups = 'drop')
  
  # Add the results to the results data frame
  results <- results %>%
    left_join(df_mean, by = "group") %>%
    rename(!!paste0(col, "_mean") := mean,
           !!paste0(col, "_stderr") := stderr)
}

# Remove the group column used for calculations
results <- results %>% select(-group)

# Display the results data frame
print(results)

# Save the results to a new Excel file
write_xlsx(results, "processed_data.xlsx")
# # take mean of the first 3 rows of 1st column
# df[1:3, 5] %>% mean()
# 
# colors = c("green", "orange", "brown")
# months <- c("Mar", "Apr", "May", "Jun", "Jul")
# regions <- c("East", "West", "North")
# 
# # Create the matrix of the values.
# Values <- matrix(c(2, 9, 3, 11, 9, 4, 8, 7, 3, 12, 5, 2, 8, 10, 11),
#                  nrow = 3, ncol = 5, byrow = TRUE)
# 
# # Create the bar chart
# barplot(Values, main = "Total Revenue", names.arg = months,
#         xlab = "Month", ylab = "Revenue",
#         col = colors, beside = TRUE)
# 
# # Add the legend to the chart
# legend("topleft", regions, cex = 0.7, fill = colors)
# 
