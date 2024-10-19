# ---- Packages and Functions----
## ---- Data_Loading_and_Writing----
install.packages("readr")
install.packages("readxl")
install.packages("tibble")
install.packages("forcats")
install.packages("stringr")
install.packages("purrr")
install.packages("ggplot2")
install.packages("openxlsx")
install.packages("writexl")
install.packages("haven")
# install.packages("tidyr")
## ---- Packages_for_Data_manipulation_data_wrangling/Handling----
install.packages("dplyr")
# These are te he help places to learn
?base::Logic
?base::Arithmetic
?base::Comparison
?base::Control
?base::Data
?base::Math
?base::Numeric
?base::Complex







#----Packages_for_Data_Visualization----
install.packages("ggplot2")# check ggplot2 book and also check Andrew abbe la guide for plotting
library(ggplot2)
df <- data.frame(mpg)
print(df)
ggplot(df, aes(x=manufacturer, y=cty)) + geom_point()
ggplot(df, aes(x=manufacturer, y=cty)) + geom_boxplot()
ggplot(df, aes(x=manufacturer, y=cty)) + geom_bar(stat = "identity")
ggplot(df, aes(x=manufacturer, y=cty)) + geom_bin2d()
ggplot(df, aes(x=manufacturer, y=cty)) + geom_jitter()
ggplot(df, aes(x=manufacturer, y=cty)) + geom_violin()

