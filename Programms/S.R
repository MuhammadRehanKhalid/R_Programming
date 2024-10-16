df <- read_xlsx(file.choose())
head(df)

library(readxl)
df <- read_excel("C:/Users/mirza/OneDrive/Desktop/Drip & Drown_G5.xlsx", 
                            sheet = "Sheet2")
View(df)

df_2 <- df[,-2]
library(factoextra)
df_pca <- prcomp(df_2, scale=TRUE)
fviz_eig(df_pca, scale=TRUE)
fviz_pca_ind(df_pca, 
             col.ind = "cos2", 
             gradient.cols = c("red", "purple", "green"), 
             repel = TRUE)
fviz_pca_var(df_pca,
             col.var = "contrib", #color  by contribution
             gradient.cols = c("purple", "orange", "black", "red"),
             repel = TRUE, bg = "transparent")

df_cor = cor(df)
corrplot(df_cor,method = "circle", addCoef.col = "black",col = COL2("RdYlBu"), type = "lower")


