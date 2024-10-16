# Load the data set
data <- read.csv("data.csv")

# Perform principal component analysis
pca <- princomp(df, cor = TRUE)

# Extract the scores of the first three principal components
pc1 <- pca$scores[, 1]
pc2 <- pca$scores[, 2]
pc3 <- pca$scores[, 3]

# Combine the scores into a matrix
X <- cbind(pc1, pc2, pc3)

# Perform k-means clustering with k = 3
kmeans_result <- kmeans(X, centers = 3)

# Print the cluster assignments
kmeans_result$cluster

# Print the cluster centroids
kmeans_result$centers

# Load the ggplot2 package for plotting
library(ggplot2)

# Create a data frame with the principal component scores and the cluster assignments
plot_data <- data.frame(pc1, pc2, pc3, cluster = factor(kmeans_result$cluster))

# Plot the data points with different colors according to the cluster assignments
# Use a 3D scatter plot to show the three dimensions
library(plotly) # Load the plotly package for interactive 3D plots
ggplotly(
  ggplot(plot_data, aes(x = pc1, y = pc2, z = pc3, color = cluster)) +
    geom_point() +
    labs(x = "PC 1", y = "PC 2", z = "PC 3", color = "Cluster") +
    theme_bw()
)

