#PCA finding
library("factoextra")

my_data <- read.csv(file.choose())

res.pca <- prcomp(my_data, scale = TRUE)

fviz_eig(res.pca)

#to calculate the individual PCA for treatment/ genotype/variety

fviz_pca_ind(res.pca,
             col.ind = "cos2", # Color by the quality of representation
             gradient.cols = c("#00AFBB", "#E7B800", "#FC4E07"),
             repel = TRUE     # Avoid text overlapping
)

#to calculate the PCA of parameter
jpeg("image.tiff",
     width = 20, height = 20, units = "in", res = 600, pointsize = 10)
fviz_pca_var(res.pca,
             col.var = "contrib", # Color by contributions to the PC
             gradient.cols = c("cyan", "blue", "red"),
             repel = TRUE     # Avoid text overlapping
)
dev.off()

#2#for triangle form
library(corrplot)
M <- cor(read.csv(file.choose()))
jpeg("image2.tiff",
     width = 10, height = 10, units = "in", res = 1200, pointsize = 10)
corrplot(M,method = "pie", order = "FPC", type = "upper", diag = FALSE,col = COL2('RdYlBu'))
dev.off()

plot_grid(res.pca, corrplot)



                                                                                                                                         ----------------------------------------------------------------------------
#Code of correlation 1
library(corrplot)
## corr plot 0.90 loaded
M <- cor(Correlation)
1-	corrplot(M, method = 'number') # colorful number


#Code Correlation 2
library(corrplot)
## corr plot 0.90 loaded
M <- cor(DATAX)
corrplot(M, order = 'AOE') # after 'AOE' reorder
#----------------------------------------------------------------------------
  
lapply(.packages(all.available = TRUE), function(xx) library(xx, character.only = TRUE))

mystring <- "Muhammd Rehaan Khalid"
print(mystring)

rstudioapi::addTheme("https://raw.githubusercontent.com/batpigandme/night-owlish/master/rstheme/night-owlish.rstheme", apply = TRUE)

lapply(.packages(all.available = TRUE), function(xx) library(xx, character.only = TRUE))

rstudioapi::addTheme("https://raw.githubusercontent.com/jnolis/synthwave85/master/Synthwave85.rstheme", TRUE, TRUE, FALSE)
yule_theme <- fs::path_temp("Yule-RStudio", ext = "rstheme")
download.file("https://git.io/yule-rstudio", yule_theme)
rstudioapi::addTheme(yule_theme, apply = TRUE)

install.packages("RColorBrewer")
install.packages("heat_map_save")
install.packages("complexheatmap")
install.packages("Heat_map_save")
install.packages('reticulate')
reticulate::install_miniconda()
reticulate::conda_install('r-reticulate', 'python-kaleido')
reticulate::conda_install('r-reticulate', 'plotly', channel = 'plotly')
reticulate::use_miniconda('r-reticulate')
library(ComplexHeatmap)
library(RColorBrewer)
if (!require("BiocManager", quietly = TRUE))
  install.packages("BiocManager")

BiocManager::install("ComplexHeatmap")
install.packages("https://cran.r-project.org/src/contrib/Archive/GetoptLong/GetoptLong_0.1.8.tar.gz", repo = NULL)
BiocManager::install("ComplexHeatmap")
library(circlize)



lapply(.packages(all.available = TRUE), function(xx)library(xx,character.only = TRUE))
