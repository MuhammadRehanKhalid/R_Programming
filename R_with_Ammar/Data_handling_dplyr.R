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
str(df)
# summarize by dplyr
summarize(df) 
df %>% glimpse() #first tell worj, then call function on it
df |> glimpse() # two ways to apply pipline
df |> summarize(avg = mean(Age, na.rm = TRUE)) # summarize the data
# summarize all
df |> summarize_all(mean, na.rm = FALSE) # summarize all columns
df %>%
  group_by(Age) %>%
  summarize(avg = mean(Age, na.rm = TRUE)) # group by and summarize
# filter the fdata just for sex=females and take average of age
df_female <- df %>%
  filter(Sex == "female") # female data
df_male <- df %>%
  filter(Sex == "male") # males data
write_csv(df_male, "./Data/tit_male_data.csv")
write_csv(df_female, "./Data/tit_female_data.csv")
# plot data of fare for female only using dplyr
df %>% 
  filter(Sex == "female") %>%
  filter(Fare > 100) %>% 
  ggplot(aes(x = Fare)) + geom_histogram(binwidth = 10, fill = "purple", color="black")
# male fare filter fare above 100
df %>% 
  filter(Sex == "male") %>% 
  filter(Fare > 100) %>% 
  ggplot(aes(x = Fare)) + geom_histogram(binwidth = 10, fill = "purple", color="black")

# Point plot
df %>% 
  filter(Sex == "male") %>%
  ggplot(aes(x = Age, y = Fare, colour = class)) + 
  geom_point()
