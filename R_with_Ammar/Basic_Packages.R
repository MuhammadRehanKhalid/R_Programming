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
install.packages("tidyr")
install.packages("lubridate")
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
install.packages("plotly")
install.packages("RcolorBrewer") # color palettes
install.packages("leaflet") # geography
install.packages("dygraphs") # times series
install.packages("gganimate")
install.packages("ggpubr")
install.packages("heatmaply")
install.packages("d3heatmap")
install.packages("rgl")

install.packages("viridis")
install.packages("cowplot")
install.packages("ggstatsplot")
install.packages("patchwork")# combine plots
library(ggplot2)
df <- data.frame(mpg)
print(df)
ggplot(df, aes(x=manufacturer, y=cty)) + geom_point()
ggplot(df, aes(x=manufacturer, y=cty)) + geom_boxplot()
ggplot(df, aes(x=manufacturer, y=cty)) + geom_bar(stat = "identity")
ggplot(df, aes(x=manufacturer, y=cty)) + geom_bin2d()
ggplot(df, aes(x=manufacturer, y=cty)) + geom_jitter()
ggplot(df, aes(x=manufacturer, y=cty)) + geom_violin()

library(plotly)
fig <- plot_ly(df, x = ~manufacturer, y = ~cty, type = 'scatter', mode = 'markers')
fig
fig2 <- plot_ly(midwest, x = ~percollege, color = ~state, type = 'box')
fig2



# ----Statistics_Machine_Learning----
install.packages("tidymodels") # tidyverse for modeling
install.packages("caret") # classification and regression training
install.packages("car") # companion to applied regression
install.packages("lme4") # linear mixed effects models
installl.packages("multcomp") # multiple comparison
install.packages("nlme") # linear and nonlinear mixed effects models
install.packages("vcd") # visualizing categorical data
install.packages("survival") # survival analysis
install.packages("agricolae") # statistical procedures for agricultural research
