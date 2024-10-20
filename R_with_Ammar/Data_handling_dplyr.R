# ---- dplyr -----
library(tidyr)
library(tidyverse)
library(readxl)
# ----import data----
df <- read_csv("./Data/titanic.csv")
view(df)
# ----data_understaning----
glimpse(df)
tibble(df)
summary(df)
