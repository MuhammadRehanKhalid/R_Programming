my_data <- read.csv(file.choose())
M<-as.matrix(my_data)
library(factoextra)
n<- prcomp(M,scale = T)
fviz_eig(n, scale=T)
fviz_pca_ind(n,
             col.ind = "cos2",
             gradient.col=c("blue","green","red"),
             repel = TRUE)
fviz_pca_var(n,
             col.var = "cos2",
             gradient.col=c("blue","green","red"),
             repel = TRUE)
fviz_pca_var(n,
             col.var = "contrib",
             gradient.col=c("blue","red"),
             repel = TRUE)
