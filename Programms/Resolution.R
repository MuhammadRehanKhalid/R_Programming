setwd("D:\\Study and Extras\\R Files Projects")
#Method “circle”, “square”, “ellipse”, “number”, “shade”, “color”, “pie”
library(corrplot)
M=cor(DATAX)
corrplot(M,method = "shade")

library(corrplot)
M=cor(mydata)
corrplot(M, method = 'pie', order = 'AOE', addCoef.col = 'black', tl.pos = 'd',
         cl.pos = 'n', col = COL2('BrBG'))
bitmap("rehan.tiff", height = 4, width = 4, units = 'in', type="tifflzw", res=300)
dev.off()

library(corrplot)
library(ggplot2)
library(extrafont)
font <- "Times New Roman"
font <- "Calibri"
loadfonts(device = "win")
windowsFonts(text = font)
data <- mtcars
font <- "Times New Roman Regular"
par(family = font)
corr_mat <- cor(data)
corrplot(corr_mat, type = "upper", order = "hclust", tl.col = "black", tl.srt = 45, 
         addrect = 2, rect.col = "white", cl.pos = "n", cl.cex = 0.7, number.cex = 0.8, 
         diag = FALSE, tl.cex = 0.8)
library(extrafont)
font_import(pattern = "Arial")
plot(1:10, main = "My Plot", family = "Arial")





