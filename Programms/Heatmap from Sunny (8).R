library(gplots)
library(pheatmap)
library(tidyverse)
library(RColorBrewer)
library(cluster) #clustering algorithms
library(factoextra)
# file import and preparation
LC <- read.csv("C:/Users/hp/Desktop/Hamzah's documents/Correlation data.csv",check.names =FALSE)
LC <- LC[order(LC$HT),]

row.names(LC) <- LC$x

LC <- LC[1:33,-1]
LC <- data.matrix(Correlation.data)
SC_LC <- scale(Correlation.data, scale= TRUE)
plot(SC_LC)
y <- SC_LC

#optical cluster determination
fviz_nbclust(y, kmeans, method = "manhattan")
fviz_nbclust(y, kmeans, method = "ward")

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

