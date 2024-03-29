lapply(.packages(all.available = TRUE), function(xx)library(xx,character.only = TRUE))

df <- read.csv(file.choose())
head(df)
df = df[,-2]
head(df)

df_pca <- prcomp(df, scale=TRUE)
fviz_eig(df_pca, scale=TRUE)
fviz_pca_ind(df_pca, 
             col.ind = "cos2", 
             gradient.cols = c("red", "purple", "green"), 
             repel = TRUE)
fviz_pca_var(df_pca,
              col.var = "contrib", #color  by contribution
              gradient.cols = c("purple", "orange", "black", "red"),
              repel = TRUE, bg = "transparent")
#should be one of “RdBu”, “BrBG”, “PiYG”, “PRGn”, “PuOr”, “RdYlBu”
library(corrplot)
df = cor(df)
corrplot(df,method = "shade", addCoef.col = "black",col = COL2("BrBG"), type = "upper")




SxVxTxR
3x2x5x6




