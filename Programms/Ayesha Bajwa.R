#scatter plot

# Plot the scatter plot
plot(D12$Age, D12$Price, main="Scatter Plot", xlab="Age of Vehicle", ylab="Price in million")

# Calculate the correlation coefficient
correlation <- cor(D12$Age, D12$Price)

# Print the correlation coefficient
cat("The correlation coefficient is", correlation, "\n")

# Identify the nature of the relationship
if(correlation > 0) {
  if(correlation < 0.3) {
    cat("The relationship between the two variables is weak and positive.\n")
  } else if(correlation < 0.7) {
    cat("The relationship between the two variables is moderate and positive.\n")
  } else {
    cat("The relationship between the two variables is strong and positive.\n")
  }
} else if(correlation < 0) {
  if(correlation > -0.3) {
    cat("The relationship between the two variables is weak and negative.\n")
  } else if(correlation > -0.7) {
    cat("The relationship between the two variables is moderate and negative.\n")
  } else {
    cat("The relationship between the two variables is strong and negative.\n")
  }
} else {
  cat("The relationship between the two variables is neutral.\n")
}


#Best possible line in for the grpah
)

# Plot the scatter plot
plot(D12$Age, D12$Price, main="Scatter Plot with Least Squares Line", xlab="Variable X", ylab="Variable Y")

# Fit a linear regression model to the data
fit <- lm(D12$Price ~ D12$Age)

# Plot the least squares line
abline(fit, col="red")

# Summarize the model
summary(fit)

# Interpret the model
cat("The slope of the least squares line is", coef(fit)[2], "\n")
cat("The intercept of the least squares line is", coef(fit)[1], "\n")
cat("The relationship between the two variables is linear with an R-squared value of", summary(fit)$r.squared, "\n")
cat("This means that the model explains", summary(fit)$r.squared * 100, "% of the variability in the dependent variable.\n")



x <- rnorm(D12$Age)
y <- 2 * x + rnorm(D12$Price)

fit <- lm(y ~ x)
fit <- lm(D12$Price ~ D12$Age)
# Get residuals
residuals <- residuals(fit)

# Plot residuals
plot(fit$fitted.values, residuals, xlab="Fitted Values", ylab="Residuals")
abline(h=0, col="red")

#-----------------------------------------------------

# Generate sample data
# Generate sample data
x <- rnorm(D12$Age)
y <- 2 * x + rnorm(D12$Price)

# Create the regression plot
plot(x, y,
     pch=16,
     col="blue",
     xlab="Predictor Variable",
     ylab="Response Variable",
     main="Regression Plot",
     cex.lab=1.2,
     cex.axis=1.2)

# Add the regression line to the plot
abline(lm(y ~ x), col="red", lwd=2)

# Load the necessary libraries
