# Load necessary libraries
library(ggplot2)
library(dplyr)

# Create a dummy dataset
dummy_data <- data.frame(
  Variety = rep(paste("Variety", 1:4), each = 6),  # 4 varieties
  Stress = rep(paste("Stress", 1:2), times = 12),  # 2 stress conditions
  Treatment = rep(paste("Treatment", 1:3), times = 8),  # 3 treatments
  Mean_Value = c(20, 22, 24, 21, 23, 25, 
                 18, 19, 20, 17, 21, 22, 
                 30, 32, 28, 29, 31, 27, 
                 26, 24, 23, 25, 22, 21),  # Mean values
  Error_Value = c(2, 1.5, 2.5, 1, 2, 1.5, 
                  1.5, 2, 1, 1.5, 2, 1.5, 
                  3, 2.5, 3.5, 2, 2.5, 3, 
                  1.5, 1, 2, 1.5, 2, 1)   # Error values
)

# Ensure Treatment is treated as a factor
dummy_data$Treatment <- factor(dummy_data$Treatment)

# Group the data by Variety, Stress, and Treatment
summary_data <- dummy_data %>%
  group_by(Variety, Stress, Treatment) %>%
  summarise(
    Mean_Value = mean(Mean_Value),
    Error_Value = mean(Error_Value),
    .groups = 'drop'
  )

# Create the bar plot with error bars using the grouped data
ggplot(summary_data, aes(x = interaction(Variety, Stress), y = Mean_Value, fill = Treatment)) +
  geom_bar(stat = "identity", position = position_dodge(width = 0.9)) +
  geom_errorbar(aes(ymin = Mean_Value - Error_Value, ymax = Mean_Value + Error_Value), 
                position = position_dodge(width = 0.9), 
                width = 0.25) +
  labs(x = "Variety and Stress", 
       y = "Mean Value", 
       title = "Bar Plot with Mean Values and Error Bars") +
  theme(axis.text.x = element_text(angle = 45, hjust = 1)) +
  scale_fill_manual(values = c("Treatment 1" = "#FF5733",  # Bright Red
                               "Treatment 2" = "#FFBD33",  # Bright Yellow
                               "Treatment 3" = "#33FF57"), # Bright Green
                    name = "Treatment") +
  theme_minimal(base_size = 15) +  # Increase base font size for better readability
  theme(legend.position = "top")  # Move legend to the top

# ------------Barplot----------------
# # Load necessary libraries
# library(ggplot2)
# library(dplyr)
# library(ggpubr)  # For statistical comparisons
# library(ggdendro)  # For dendrograms
# library(tidyr)  # For data manipulation
# 
# # Create a dummy dataset (as you provided)
# dummy_data <- data.frame(
#   Variety = rep(paste("Variety", 1:4), each = 6),
#   Stress = rep(paste("Stress", 1:2), times = 12),
#   Treatment = rep(paste("Treatment", 1:3), times = 8),
#   Mean_Value = c(20, 22, 24, 21, 23, 25, 
#                  18, 19, 20, 17, 21, 22, 
#                  30, 32, 28, 29, 31, 27, 
#                  26, 24, 23, 25, 22, 21),
#   Error_Value = c(2, 1.5, 2.5, 1, 2, 1.5, 
#                   1.5, 2, 1, 1.5, 2, 1.5, 
#                   3, 2.5, 3.5, 2, 2.5, 3, 
#                   1.5, 1, 2, 1.5, 2, 1)
# )
# 
# # Ensure Treatment is treated as a factor
# dummy_data$Treatment <- factor(dummy_data$Treatment)
# 
# # Perform ANOVA
# anova_result <- aov(Mean_Value ~ Variety * Stress, data = dummy_data)
# summary(anova_result)
# 
# # If ANOVA is significant, perform post-hoc test
# if (summary(anova_result)[[1]][["Pr(>F)"]][1] < 0.05) {
#   posthoc_result <- TukeyHSD(anova_result)
#   print(posthoc_result)
# }
# 
# # Create the bar plot with error bars using the grouped data
# summary_data <- dummy_data %>%
#   group_by(Variety, Stress) %>%
#   summarise(
#     Mean_Value = mean(Mean_Value),
#     Error_Value = mean(Error_Value),
#     .groups = 'drop'
#   )
# 
# # Create the bar plot
# p <- ggplot(summary_data, aes(x = interaction(Variety, Stress), y = Mean_Value, fill = Stress)) +
#   geom_bar(stat = "identity", position = position_dodge(width = 0.9)) +
#   geom_errorbar(aes(ymin = Mean_Value - Error_Value, ymax = Mean_Value + Error_Value), 
#                 position = position_dodge(width = 0.9), 
#                 width = 0.25) +
#   labs(x = "Variety and Stress", 
#        y = "Mean Value", 
#        title = "Bar Plot with Mean Values and Error Bars") +
#   theme(axis.text.x = element_text(angle = 45, hjust = 1)) +
#   scale_fill_manual(values = c("Stress 1" = "#FF5733",  
#                                "Stress 2" = "#FFBD33"), 
#                     name = "Stress") +
#   theme_minimal(base_size = 15) +  
#   theme(legend.position = "top")  
# 
# # Add significance levels (example)
# # You can customize this based on your post-hoc results
# p <- p + annotate("text", x = 1.5, y = max(summary_data$Mean_Value) + 1, label = "***", size = 6) +
#   annotate("text", x = 3.5, y = max(summary_data$Mean_Value) + 1, label = "ns", size = 6)
# 
# # Print the plot
# print(p)
# 
# # Create a dendrogram (optional)
# # You can create a distance matrix and perform hierarchical clustering
# dist_matrix <- dist(dummy_data[, c("Mean_Value")])
# hc <- hclust(dist _matrix)
# 
# # Create a dendrogram plot
# dendro_data <- as.dendrogram(hc)
# dendro_plot <- ggdendrogram(dendro_data, rotate = TRUE) +
#   labs(title = "Dendrogram of Varieties and Stress") +
#   theme_minimal()
# 
# # Print the dendrogram
# print(dendro_plot)
