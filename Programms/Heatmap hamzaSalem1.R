library(gplots)
install.packages('gplots')
library(pheatmap)
library(tidyverse)
library(RColorBrewer)
library(cluster) #clustering algorithms
library(factoextra)
library(readxl)
# file import and preparation
LC <- read_xlsx(file.choose())
LC <- LC[order(LC$`treatmet`),]
View(LC)
# row.names(LC) <- LC$x
# View(LC)
LC_cat <- LC[,1:2]
LC_conti <- LC[,3:ncol(LC)]
LC_conti <- data.matrix(LC)
SC_LC <- scale(LC_conti, scale= TRUE)
y <- plot(SC_LC)
y <- SC_LC
#------------------------My-Way----------------
#optical cluster determination
fviz_nbclust(y, kmeans, method = "wss")
fviz_nbclust(y, kmeans, method = "silhouette")
fviz_nbclust(y, kmeans, method = "gap_stat")
## k means cluster
final <- kmeans(y, 5, nstart = 33)
fviz_cluster(final, data = y, labelsize = 1)

## row and colum=wise clustering
hr <- hclust(as.dist(1-cor(t(y), method = "pearson")), method = "complete")
hc <- hclust(as.dist(1-cor(y, method = "spearman")), method = "complete")
mycl <-cutree(hr, h=max(hr$height)/1.5); mycolhc <- rainbow(length(unique(mycl)), start = 0.1,
                                                            end = 0.9); 
mycolhc <-mycolhc[as.vector(mycl)]
cluster <- as.matrix(mycl)
output <- cbind(y,cluster)
library(grDevices)
#plot heatmap
mycol <- colorRampPalette(c("cyan", "yellow", "darkgreen"))(100)

pheatmap(y, key.xlab = "none", key.ylab = "none",cellwidth = 20, methods="none", cellheight = 15, fontsize_row =12, angle_col = "45",fontsize_col = 12, RowSideColors =mycolhc,Rowv = as.dendrogram(hr), Colv = as.dendrogram(hc), 
         col = mycol, density.info = "none", trace = "none", dendrogram = "both", scale ="row", 
         labRow = FALSE, legend = T, legend_breaks = c(1,0,-1), annotation_legend = T, Key=FALSE)

#------------------------------Hamza Saleem Wa---------------
#optical cluster determination
fviz_nbclust(y, kmeans, method = "manhattan")
fviz_nbclust(y, kmeans, method = "ward")
?
## k means cluster
final <- kmeans(y, 5, nstart = 33)
fviz_cluster(final, data = y, labelsize = 1)

## row and colum=wise clustering
hr <- hclust(as.dist(1-cor(t(y), method = "pearson")), method = "complete")
hc <- hclust(as.dist(1-cor(y, method = "spearman")), method = "complete")
mycl <-cutree(hr, h=max(hr$height)/1.5); mycolhc <- rainbow(length(unique(mycl)), start = 0.1,
                                                            end = 0.9); 
mycolhc <-mycolhc[as.vector(mycl)]

cluster <- as.matrix(mycl)
output <- cbind(y,cluster)

#plot heatmap
mycol <- colorpanel(8, "Light Blue", "Blue", "Turquoise")

pheatmap(y, key.xlab = "none", key.ylab = "none",cellwidth = 20, cellheight = 15, fontsize_row =12, angle_col = "45",fontsize_col = 12, RowSideColors =mycolhc,Rowv = as.dendrogram(hr), Colv = as.dendrogram(hc), 
         col = mycol, density.info = "none", trace = "none", dendrogram = "both", scale ="row", 
         labRow = FALSE, legend = T, legend_breaks = c(1,0,-1), annotation_legend = T, Key=FALSE)


pheatmap(y, col = colorRampPalette(rev(brewer.pal(n = 12, name = "Set3")))(100),
         kmeans_k = NA,breaks = NA,border_color = "grey60", cellwidth = 20, cellheight = 15,
         scale = "row", key.xlab = NA, key.ylab = NA, show_rownames = T, show_colnames = T,
         .legend_breaks = c(1,0,-1), display_numbers = F, fontsize_number = 5)

library(factoextra)
?pheatmap
?heatmap

sample <- read.csv(file.choose())
view(sample)
sample1<- as.matrix(df[,-1], scale = T)
heatmap(sample1, Rowv = NA, Colv = NA, scale = "row")

pheatmap(sample1, col = colorRampPalette(rev(brewer.pal(n = 12, name = "Set3")))(100),
         kmeans_k = NA,breaks = NA,border_color = "grey60", cellwidth = 20, cellheight = 15,
         scale = "column", key.xlab = NA, key.ylab = NA, show_rownames = T, show_colnames = T,
         .legend_breaks = c(1,0,-1), display_numbers = F, fontsize_number = 5)




#------------------------Changing Fonts-------------------------
font_import()
install.packages('remotes')
library(ggplot2)
library(showtext)
library(extrafont)
install.packages('extrafont
                 ')
install.packages('showtext')
library(extrafont)
font_install('fontcm')
Sys.setenv(R_GSCMD="C:/Program Files/gs/gs9.05/bin/gswin32c.exe")
y

font_add(family = "ComicSansMS", regular = "Comic.ttf")

showtext_auto()
warnings()

windowsFonts(A = windowsFont("Calibri"))
pheatmap(data, family= "A")

font_add(family = "FiraCodeRegular", regular = "FIRACODE-REGULAR.ttf")
install.packages("extrafont")
library(extrafont)

font_add(family = "TimesNewRoman", regular = "times.ttf")

