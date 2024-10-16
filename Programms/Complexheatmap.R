getwd()
setwd("D:\\Study and Extras\\R Files Projects")
#--------------------------------Experiment--------------
discrete_mat <- matrix(sample(1:4, 100, replace = TRUE), 10, 10)
colors <- structure(1:4, names = c("1", "2", "3", "4")) # black, red, green, blue
heatmap(discrete_mat, name = "mat", col = colors,
        column_title = "a discrete numeric matrix")

heatmap(data, name = "mat", border_gp = gpar(col = "black", lty = 2),
        column_title = "set heatmap borders")

library(factoextra)

mydata <- read.csv(file.choose())
my_data1 <- prcomp(mydata,scale = T)
fviz_eig(my_data1)
fviz_pca_var(my_data1,
             col.var = "contrib",
             gradient.col= c("red","green","blue"),
             repel = T)

fviz_pca_ind(my_data1,
             col.ind = "contrib",
             gradient.col = c("red", "blue", "green"),
             repel = T)
prime<- fviz_pca_var(my_data1,
             col.var = "cos2",
             gradient.col= c("red","green","blue"),
             repel = T)
ggsave("muhammad.jpeg",width = 6,height = 8,dpi = 600)
prime
dev.off()

#--------------------------2nd test-----------
pheatmap(my_data1)
?pheatmap
data(iris)
view(iris[,-5])

library(ggplot2)
library(corrplot)
m <- read.csv(file.choose())
mdata <- cor(m)
N<-corrplot(mdata, method = "pie")
jpeg("mydata.png", width = 6, height = 6, unit= "in", res = 2400)
N<-corrplot(mdata, method = "pie")
dev.off()


