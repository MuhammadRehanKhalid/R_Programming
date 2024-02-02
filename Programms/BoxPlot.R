#---------------BOX plot-Data------------------------
# Generate sample data
set.seed(123)

group1 <- rnorm(50, mean = 10, sd = 2)
group2 <- rnorm(50, mean = 12, sd = 2)
group3 <- rnorm(50, mean = 15, sd = 2)
data <- data.frame(Group = rep(c("Group 1", "Group 2", "Group 3"), each = 50),
                   Value = c(group1, group2, group3))

# Calculate standard errors
dataa1 <- read.csv(file.choose())
dataa1 <- scale(dataa2)
se <- tapply(dataa1$Control, dataa1$Drought, function(x) sd(x) / sqrt(length(x)))

# Create boxplot with standard error bars
boxplot(Control ~ Drought, data = dataa1,
        ylim = range(1,2),
        main = "Boxplot with Standard Error",
        ylab = "Value",
        col = c("lightblue", "lightgreen", "lightyellow"))
points(x = c(1, 2, 3), y = c(mean(group1), mean(group2), mean(group3)), col = "red", pch = 16)
arrows(x0 = c(1, 2, 3), y0 = c(mean(group1) - se[1], mean(group2) - se[2], mean(group3) - se[3]),
       x1 = c(1, 2, 3), y1 = c(mean(group1) + se[1], mean(group2) + se[2], mean(group3) + se[3]),
       angle = 90, code = 3, length = 0.05)
#-------------------varieties------------------------
# Generate sample data
set.seed(123)

# Define the varieties, stress levels, and treatments
varieties <- c("Variety A", "Variety B", "Variety C")
stress_levels <- c("Low Stress", "Medium Stress", "High Stress")
treatments <- c("Treatment 1", "Treatment 2", "Treatment 3")

# Create an empty list to store the data
data_list <- list()

# Generate data for each combination of variety, stress level, and treatment
for (variety in varieties) {
  for (stress in stress_levels) {
    for (treatment in treatments) {
      # Generate random data for each combination
      values <- rnorm(50, mean = 10, sd = 2)
      
      # Create a data frame for the combination
      df <- data.frame(Variety = rep(variety, 50),
                       Stress = rep(stress, 50),
                       Treatment = rep(treatment, 50),
                       Value = values)
      
      # Add the data frame to the list
      data_list[[paste(variety, stress, treatment, sep = "_")]] <- df
    }
  }
}

# Calculate standard errors for each combination
se_list <- lapply(data_list, function(df) {
  se <- tapply(df$Value, df$Treatment, function(x) sd(x) / sqrt(length(x)))
  paste(names(se), se, sep = " = ")
})

# Set the margin size
par(mar = c(5, 6, 4, 2))  # Adjust the values as needed

# Create boxplot with standard error bars for each combination
plot_counter <- 1
par(mfrow = c(length(varieties), length(stress_levels) * length(treatments)))
for (variety in varieties) {
  for (stress in stress_levels) {
    for (treatment in treatments) {
      # Get the data frame for the combination
      df <- data_list[[paste(variety, stress, treatment, sep = "_")]]
      
      # Create the boxplot
      boxplot(Value ~ Treatment, data = df,
              ylim = range(unlist(data_list)),
              main = paste("Boxplot for", variety, stress, treatment),
              ylab = "Value",
              col = "lightblue")
      
      # Add the standard error bars
      se_text <- se_list[[paste(variety, stress, treatment, sep = "_")]]
      for (i in seq_along(se_text)) {
        text(x = i, y = min(df$Value) - 0.5, labels = se_text[i], pos = 3)
      }
      
      # Increment the plot counter
      plot_counter <- plot_counter + 1
    }
  }
}


# Load the required packages
library(readxl)

# Read the Excel file containing the data
data <- read_excel("your_file_path.xlsx")

# Extract the columns for varieties, stresses, treatments, and observations
varieties <- data$Variety
stresses <- data$Stress
treatments <- data$Treatment
observations <- data$Observation

# Create an empty list to store the data
data_list <- list()

# Generate data for each combination of variety, stress level, and treatment
for (i in 1:length(varieties)) {
  variety <- varieties[i]
  stress <- stresses[i]
  treatment <- treatments[i]
  observation <- observations[i]
  
  # Create a data frame for the combination
  df <- data.frame(Variety = rep(variety, observation),
                   Stress = rep(stress, observation),
                   Treatment = rep(treatment, observation),
                   Value = rnorm(observation, mean = 10, sd = 2))
  
  # Add the data frame to the list
  data_list[[paste(variety, stress, treatment, sep = "_")]] <- df
}

# Calculate standard errors for each combination
se_list <- lapply(data_list, function(df) {
  se <- tapply(df$Value, df$Treatment, function(x) sd(x) / sqrt(length(x)))
  paste(names(se), se, sep = " = ")
})

# Set the margin size
par(mar = c(5, 5, 2, 2))  # Adjust the values as needed

# Create boxplot with standard error bars for each combination
plot_counter <- 1
par(mfrow = c(length(varieties), length(stresses) * length(treatments)))
for (i in 1:length(varieties)) {
  variety <- varieties[i]
  stress <- stresses[i]
  treatment <- treatments[i]
  
  # Get the data frame for the combination
  df <- data_list[[paste(variety, stress, treatment, sep = "_")]]
  
  # Create the boxplot
  boxplot(Value ~ Treatment, data = df,
          ylim = range(unlist(data_list)),
          main = paste("Boxplot for", variety, stress, treatment),
          ylab = "Value",
          col = "lightblue")
  
  # Add the standard error bars
  se_text <- se_list[[paste(variety, stress, treatment, sep = "_")]]
  for (j in seq_along(se_text)) {
    text(x = j, y = min(df$Value) - 0.5, labels = se_text[j], pos = 3)
  }
  
  # Increment the plot counter
  plot_counter <- plot_counter + 1
}

?boxplot

data2 = rnrom(data1)
mean_2 <- colMeans(data1)
print(mean_2)
boxplot(data1, range = 1.5, width = NULL, varwidth = FALSE,
        notch = FALSE, outline = TRUE, names, plot = TRUE,
        border = par("fg"), col = "lightgray", log = "",
        pars = list(boxwex = 0.8, staplewex = 0.5, outwex = 0.5),
        ann = !add, horizontal = FALSE, add = FALSE, at = NULL)
