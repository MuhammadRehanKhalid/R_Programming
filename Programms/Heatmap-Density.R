library(ggplot2)
library(reshape2)

df<-read.csv(file.choose())
data<-cor(df[sapply(df,is.numeric)])
data1<-melt(data)

ggplot(data1,aes(x=Var1,
                 y=Var2,
                 fill=value))+geom_tile()+
  scale_fill_gradient(low = "red",
                      high = "black",
                      guide = "colorbar")


df <- as.matrix(df)
heatmap.2(df, scale = "row", col = bluered(100), 
          trace = "row", density.info = "density")
library("d3heatmap")
install.packages("d3heatmap")


Heatmap(df, 
        name = "roma", #title of legend
        column_title = "Variables", row_title = "Samples",
        row_names_gp = gpar(fontsize = 7) # Text size for row names
)


# Heatmap 1
ht1 = Heatmap(df, name = "ht1", km = 2,
              column_names_gp = gpar(fontsize = 9))
# Heatmap 2
ht2 = Heatmap(df, name = "ht2", 
              col = circlize::colorRamp2(c(-2, 0, 2), c("green", "white", "red")),
              column_names_gp = gpar(fontsize = 9))
# Combine the two heatmaps
ht1 + ht2




# Define some graphics to display the distribution of columns
.hist = anno_histogram(df, gp = gpar(fill = "lightblue"))
.density = anno_density(df, type = "line", gp = gpar(col = "blue"))
ha_mix_top = HeatmapAnnotation(
  hist = .hist, density = .density,
  height = unit(3.8, "cm")
)
# Define some graphics to display the distribution of rows
.violin = anno_density(df, type = "violin", 
                       gp = gpar(fill = "lightblue"), which = "row")
.boxplot = anno_boxplot(df, which = "row")
ha_mix_right = HeatmapAnnotation(violin = .violin, bxplt = .boxplot,
                                 which = "row", width = unit(4, "cm"))
# Combine annotation with heatmap
Heatmap(df, name = "mtcars", 
        column_names_gp = gpar(fontsize = 8),
        top_annotation = ha_mix_top) + ha_mix_right


densityHeatmap(scale(df))


dat <- as.matrix(df)
dat2 <- dat %>%
  tbl_df() %>%
  rownames_to_column('Var1') %>%
  gather(Var2, value, -Var1) %>%
  mutate(
    Var1 = factor(Var1, levels=1:10),
    Var2 = factor(gsub("V", "", Var2), levels=1:10)
  )

## plot data
ggplot(dat2, aes(Var1, Var2)) +
  geom_tile(aes(fill = value)) + 
  geom_text(aes(label = round(value, 1))) +
  scale_fill_gradient(low = "white", high = "red") 


dat <- matrix(df)
names(dat) <- paste("X", 1:10)
install.packages('pheatmap') # if not installed already
library(pheatmap)
pheatmap(dat, display_numbers = T)
library(heatmaply)
#----------------------packages-------------------
webshot::install_phantomjs()
library("microbenchmark")
install.packages("microbenchmark")
library("heatmaply")
library("pheatmap")
library(RColorBrewer)
par(mar=c(3,4,2,2))
display.brewer.all()
if (!requireNamespace("BiocManager", quietly = TRUE))
    install.packages("BiocManager")
    
# install and load package
BiocManager::install("DESeq")
library("DESeq")

# if you can't install DESeq, I have hosted the file at https://davetang.org/file/TagSeqExample.tab
# example_file <- "https://davetang.org/file/TagSeqExample.tab"