# create temporary download directory
theme_49th_parallel <- fs::path_temp("49th_parallel-RStudio", 
                                     ext = "rstheme")

# download theme from github
download.file("https://raw.githubusercontent.com/wvictor14/rstudio_themes/master/49th%20Parallel.rstheme", 
              theme_49th_parallel)

# apply the theme
rstudioapi::addTheme(theme_49th_parallel, 
                     apply = TRUE)