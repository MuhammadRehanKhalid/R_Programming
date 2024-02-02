Dr_Azeem_1 <- read_excel("Azeem/CORRELATION  SAMPLE A AND B.xlsx", 
                                         sheet = "Sample A")
Dr_Azeem_2 <- read_excel("Azeem/CORRELATION  SAMPLE A AND B.xlsx", 
                                         sheet = "Sample B")
res.pca<- prcomp(Dr_Azeem_1,scale=TRUE)
pca_plot1<-fviz_eig (res.pca)
#diff color

pca_plot1<-fviz_pca_ind(res.pca, 
             col.ind = "cos2", 
             gradient.cols = c("red", "purple", "green"), 
             repel = TRUE,
             axes = c(1,4), # Specify the components you want to plot (e.g., 1 and 3)
             title = "PCA - Principal Component Analysis") # Specify grouping variable if needed)
#to calculate PCA of PARAMETER
pca_plot1<-fviz_pca_var(res.pca,
                        col.var = "contrib", #color  by contribution
                        gradient.cols = c("purple", "orange", "black", "red"),
                        repel = TRUE, bg = "transparent",
                        axes = c(1,4), # Specify the components you want to plot (e.g., 1 and 3)
                        title = "PCA - Principal Component Analysis",
)


# Assuming you have performed PCA on your complete dataset
pca_result <- prcomp(Dr_Azeem_2, scale. = TRUE)

# Specify the number of components to visualize
num_components <- 4  # Change this to the number of components you want to visualize

# Create a grid of scatterplot matrices
par(mfrow = c(2, 2))  # Adjust the layout based on the number of components
for (i in 1:num_components) {
  for (j in 1:num_components) {
    if (i < j) {
    }
  }
}

#dev.off()
ggsave("First_Dr_Azeem.pdf",pca_plot1, width = 4,height = 4, units = "in", dpi = 600, bg='transparent', pointsize = 30)
ggsave("Second_Dr_Azeem.pdf",pca_plot2, width = 8,height = 8, units = "in", dpi = 600, bg='transparent', pointsize = 30)
ggsave("Third_Dr_Azeem.pdf",pca_plot3, width = 6,height = 6, units = "in", dpi = 600, bg='transparent', pointsize = 30)


# Install and load the gridExtra package
M=cor(Dr_Azeem_2)
jpeg("Dr_Azeem2.jpeg", width = 4, height = 4, units = "in", res = 600,pointsize = 6)
corrplot(method = "circle", addCoef.col = "black" ,col = COL2("RdYlBu"), type = "lower", 
         bg = "transparent" )



