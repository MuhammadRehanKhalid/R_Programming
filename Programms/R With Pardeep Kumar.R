getwd()
setwd("D:\\Study and Extras\\R Files Projects")
#--------------first Class---NewFontFira------
install.packages("gmp")
#file.edit("~/.Rprofile")
#-------------Class-2----Numbers-----------
#infix notation
#--Ended-------------------------------------------------------
library(ggplot2) 
data("iris")
View(iris)
p <- ggplot(iris,aes(Sepal.Width,Petal.Width, col=Species))+
  geom_tile(size=2, shape=3)+
  facet_grid(~Sepal.Width )+
  scale_fill_gradient(name="Muhammad",
                      high = "red",
                      low = "blue")+
    geom_jitter()
p
ggsave("jittr.png", width = 24, height = 6, dpi = 600)
p
dev.off()
#-------------------------PCATOOL-PACKAGES-------
if (!requireNamespace('BiocManager', quietly = TRUE))
  install.packages('BiocManager')

BiocManager::install('PCAtools')
BiocManager::install('airway')
#-------------------------PCA------------------------
library(PCAtools)
library(airway)
library(magrittr)
data('airway')



data(iris)
x <-prcomp(iris[,-5], center=T,scale=T)
print(x)   #make principal components
library(factoextra)
library(FactoMineR)
summary(x)
#ggplot bind PC1,PC2 grouping

View(iris)
iris <- cbind(iris,x$x)
ggplot(iris,aes(PC1,PC2,color=iris$Species,fill=iris$Species))+
  stat_ellipse(geom = "polygon", col="red",alpha= 0.5)+
  geom_point(shape=21,col="black")
#PCA table
iris.pca <- PCA(iris[,-5],graph = T,scale.unit = T)
#Screenplot
fviz_eig(iris.pca, addlabels = T, ylim=c(0,80))
fviz_pca_var(iris.pca,
             col.var = "cos2",
             gradient.col= c("red","blue","green"),
             repel = T)
pf<-fviz_pca_ind(iris.pca,
             col.ind = "cos2",
             gradient.col= c("red","blue","green"),
             repel = T)
ggsave("pf.png", width = 12, height = 12, dpi = 600)
pf
dev.off()



library(PCAtools)
library(factoextra)
library(FactoMineR)
library(ggplot2)        


p<- prcomp(iris[,-5], scale=T)
p.pca<- PCA(p, graph = T)










