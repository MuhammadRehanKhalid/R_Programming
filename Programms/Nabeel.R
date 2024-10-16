# Load necessary libraries
#install.packages("GGally")
library(GGally)
library(ggplot2)

# Create dummy data
set.seed(42) # Ensures reproducibility
dummy_data <- data.frame(
  LRL = rnorm(100, mean = 50, sd = 10),
  TRL = rnorm(100, mean = 50, sd = 10),
  LRD = rnorm(100, mean = 50, sd = 10),
  LRN = rnorm(100, mean = 50, sd = 10),
  MLRL = rnorm(100, mean = 50, sd = 10),
  RDW = rnorm(100, mean = 50, sd = 10)
)

# Generate the plot
ggpairs(dummy_data,
        upper = list(continuous = wrap("cor", size = 4)),
        lower = list(continuous = wrap("points", size = 1, alpha = 0.5)),
        diag = list(continuous = wrap("barDiag"))
)
