install.packages("PerformanceAnalytics")
library("PerformanceAnalytics")
library(gclus)


my_data <- Correlation[]
chart.Correlation(my_data, histogram=TRUE, pch=19, method = "pearson")

#------------overall just rang branga graph------------
corr <- abs(cor(Correlation)) 

colors <- dmat.color(corr)
order <- order.single(corr)

cpairs(Correlation,                    # Data frame of variables
       order,                   # Order of the variables
       panel.colors = colors,   # Matrix of panel colors
       border.color = "grey70", # Borders color
       gap = 0.45,              # Distance between subplots
       main = "Ordered variables colored by correlation", # Main title
       show.points = TRUE,      # If FALSE, removes all the points
       pch = 21,                # pch symbol
       bg = rainbow(3)[Correlation$RL]) # Colors by group

#--------------significant correaltion using psych package------------
# install.packages("psych")
library(psych)
install.packages("psych")


jpeg("muhamma.png", width = 12, height = 12, units = "in", res = 600)
pairs.panels(Correlation,
             smooth = T,      # If TRUE, draws loess smooths
             scale = T,      # If TRUE, scales the correlation text font
             density = TRUE,     # If TRUE, adds density plots and histograms
             ellipses = T,    # If TRUE, draws ellipses
             method = "pearson", # Correlation method (also "spearman" or "kendall")
             pch = 21,           # pch symbol
             lm = FALSE,         # If TRUE, plots linear fit rather than the LOESS (smoothed) fit
             cor = TRUE,         # If TRUE, reports correlations
             jiggle = FALSE,     # If TRUE, data points are jittered
             factor = 2,         # Jittering factor
             hist.col = 4,       # Histograms color
             stars = TRUE,       # If TRUE, adds significance level with stars
             ci = TRUE)          # If TRUE, adds confidence intervals
dev.off()

correlation_matrix <- function(df, 
                               type = "pearson",
                               digits = 3, 
                               decimal.mark = ".",
                               use = "all", 
                               show_significance = TRUE, 
                               replace_diagonal = FALSE, 
                               replacement = "")


#-----------Corrplot------------------
install.packages("Hmisc")
install.packages("correlation_matrix")
install.packages("xlsx")
library(Hmisc)
library(xlsx)
my <- cor(Correlation)
round(my, 2)
c<-Hmisc::rcorr(my)



library(Hmisc)
library(xtable)
library(corrplot)
install.packages("corrtable")
library(corrtable)

correlation_matrix(iris)
correlation_matrix(Correlation)
save_correlation_matrix(df = Correlation,
                        filename = "muhammadrehan first.csv",
                        digits = 2,
                        use = "")
#If you are looking for ways to visualize your correlations do have a look at the packages corrr, corrplot, or ppsr.
par(mfrow = c(2,2))
corrplot(M)
fviz_pca_ind(res.pca,
             col.ind = "cos2", 
             gradient.cols = c("red", "purple", "green"), 
             repel = TRUE)

