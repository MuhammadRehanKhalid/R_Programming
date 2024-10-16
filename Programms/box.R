
data2 <- scale(dataa1)
mean_2 <- colMeans(dataa1)
col_sd <- apply(data2, 2, function(x) sd(x) / sqrt(length(x)))
print(col_sd)
print(mean_2)
par(mar = c(5, 4, 4, 2) + 0.1)  # Adjust the margin settings

x_labels <- colnames(data1)
boxplot(data2, ylim = range(data2), col = "lightblue",
        main = "Boxplot with Standard Error (Normalized Data)", ylab = "Normalized Value",
        names = x_labels, xlab = "Variables")

points(1:length(mean_2), mean_2, pch = 19, col = "red")
segments(1:length(mean_2), mean_2 - col_sd, 1:length(mean_2), mean_2 + col_sd, col = "blue", lwd = 2)



data2 <- scale(dataa1)
mean_2 <- colMeans(data2)
col_sd <- apply(data2, 2, function(x) sd(x) / sqrt(length(x)))
print(col_sd)
print(mean_2)

par(mar = c(8, 4, 4, 2) + 0.1)  # Adjust the margin settings

x_labels <- colnames(dataa1[,-1])
num_boxes <- length(x_labels)
box_colors <- rainbow(num_boxes)  # Generate a vector of colors

boxplot(data2, ylim = range(data2),
        col = box_colors,  # Assign different colors to each box
        main = "Boxplot with Standard Error (Normalized Data)", ylab = "Normalized Value",
        xlab = "Variables")
points(1:length(mean_2), mean_2, pch = 19, col = "red")
segments(1:length(mean_2), mean_2 - col_sd, 1:length(mean_2), mean_2 + col_sd, col = "blue", lwd = 2)

# Rotate x-axis labels
par(las = 2)
axis(side = 1, at = 1:length(x_labels))
