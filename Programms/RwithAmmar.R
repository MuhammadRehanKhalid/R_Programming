lapply(.packages(all.available = TRUE), function(x)library(x,character.only = TRUE))
#---------------------Class-1---RwithAMMAR-----------
library(readxl)
Correlation <- read_excel("D:/Study and Extras/Dr Nawaz Sb Paper/PCA-Co-Relation/PCA Raouf/Correlation.xlsx", 
                          col_types = c("numeric", "numeric", "numeric", 
                                        "numeric", "numeric", "numeric", 
                                        "numeric", "numeric", "numeric", 
                                        "numeric", "numeric", "numeric", 
                                        "numeric", "numeric", "numeric", 
                                        "numeric", "numeric", "numeric", 
                                        "numeric", "numeric", "numeric"))
View(Correlation)
#----------------------Class2-3-4--Chartstypes-----------
stripchart(Correlation$RL ~ Correlation$SL)
hist(Correlation$SL, col = blues9)
plot(Correlation$SL,Correlation$SFW, xlab = "FKF", ylab = "goNawazgo")
qqnorm(Correlation$SL)
barplot(Correlation$SL,col = "purple")
boxplot(Correlation$SL,Correlation$RL)
boxplot(Correlation$SFW~Correlation$Chl.a)
boxplot(SFW~RL, data = Correlation)
#---------------------Class-5----RwithAMMAR--------------
mean(Correlation$SL)
median(Correlation$SL)
mode(Correlation$SL)
sd(Correlation$SL)
lapply(Correlation[,2:5], mean)
lapply(Correlation[,2:10], sd)

summary(Correlation)

#-------------------ANOVA--------------------------------

a1 <- aov(Correlation$SL~Correlation$RL)
summary(a1)
TukeyHSD(a1) 
library(readxl)
Experiment_1_sheet <- read_excel("D:/Study and Extras/Dr Nawaz Sb Paper/Bedar Bhi/Data Sheets/attachments/Experiment 1 sheet.xlsx", 
                                 sheet = "Stat", col_types = c("numeric", 
                                                               "numeric", "numeric", "numeric", 
                                                               "numeric", "numeric", "numeric", 
                                                               "numeric", "numeric", "numeric", 
                                                               "numeric", "numeric", "numeric", 
                                                               "numeric", "numeric", "numeric", 
                                                               "numeric", "numeric", "numeric", 
                                                               "numeric", "numeric", "numeric", 
                                                               "numeric", "numeric", "numeric", 
                                                               "numeric", "numeric", "numeric"))
View(Experiment_1_sheet)
a2 <- aov(Experiment_1_sheet$Variety+Experiment_1_sheet$Stress~Experiment_1_sheet$RL)
summary(a2)
plot(a2)
a3 <- aov(Experiment_1_sheet$RL~Experiment_1_sheet$Variety*Experiment_1_sheet$Stress)
summary(a3)
TukeyHSD(a2)
#-----------------------Class--6-----------------------
boxplot(Experiment_1_sheet$RL~Experiment_1_sheet$Variety)
library(agricolae)
#tuky test
model <- aov(RL~Stress, data = Experiment_1_sheet)
out <- HSD.test(model, "RL", group = TRUE, console = TRUE, 
                main = "Mean Comparision Test")
plot(out)
#LSD test
model <- aov(RL~Stress, data = Experiment_1_sheet)
out <- LSD.test(model, "RL", group = TRUE, console = TRUE, 
                main = "Mean Comparision Test")
plot(out)
#duncan Test
model <- aov(RL~Stress, data = Experiment_1_sheet)
out <- duncan.test(model, "RL", group = TRUE, console = TRUE, 
                main = "Mean Comparision Test")
plot(out)
#--------------------------ggplot2--class-7------------------
library(ggplot2)
#data, #mapping, #geomatry
ggplot(datax,aes(crop,height)) + geom_point(size=5, alpha=.9, color='blue')+
  geom_line(size=1.5, color="red")

ggplot(datax,aes(crop,height))+
  geom_boxplot(size=2, color="red")+
  geom_point(color="purple",size=3)+
  geom_line(color="green",size=1.5)
ggplot(datax,aes(crop,height,color=water))+
  geom_boxplot()

ggplot(datax,aes(crop,height,fill=water))+
  geom_boxplot()+
  facet_wrap(~fert.type)+
  labs(x="Crop Type",
       y="Plant Height (cm)",
       title = "Plant Growth")+
  theme_dark()+ ggsave("mrehan.pdf",units = "in",width = 8 ,height = 6, dpi = 300)
#corrdinate flip
ggplot(datax,aes(crop,height,fill=water))+
  geom_boxplot()+
  facet_wrap(~fert.type)+
  labs(x="Crop Type",
       y="Plant Height (cm)",
       title = "Plant Growth")+
  coord_flip()+
  theme_dark()+ ggsave("mrehan.pdf",units = "in",width = 8 ,height = 6, dpi = 300)

#--------------------class-8--Rbuiltin data set-----
data()
View(iris)
View(PlantGrowth)
View(npk)
View(CO2)
 head(CO2)
names(CO2)
nrow(CO2)
ncol(CO2)
install.packages("writexl")
library(writexl)
write_xlsx(CO2, path = "D:/Study and Extras/R Files Projects/CO2 data.xlsx")

#-----------------class-9-----comments------
ggplot(CO2, aes(uptake,conc))+ geom_point()+geom_smooth(method = "lm")

#-----------------class-10----vector--------
v1<-c(1,3,5,7,9)
v2<-c(2,4,6,8,10)
print(c(v1,v2))
v3<-c(v1+v2)
#vectors to strings
s1 <- c("i","hate","marriage")
print(s1)
s2<-c(v1,s1)
#-----------------Class-11------seqence--repeat----
seq(1,221
    )
rep(1,20)
rep("Homework",1000)
rep("hello",each=3)
rep(1:103,each=4)
#---------------Class-12---Scatter plot-------
#scattterplot is between two numeriacal variables
data("cars")
ggplot(cars,aes(speed,dist))+geom_point()+geom_smooth(method = "lm", se=T,level=.95)
#scatterplot with multiple lines
ggplot(Orange,aes(age,circumference,color=Tree))+
  geom_point(size=4,shape=15,aes(shape=Tree))

ggplot(Orange,aes(age,circumference,color=Tree))+   #you can add diferent shapes from number 1-26
  geom_point(size=4,aes(shape=Tree))+ #change shape with alpha
  geom_line(aes(linetype=Tree),size=1)+
  ggsave("highquality.pdf")

#bubble plot
library(viridis)
nrow(quakes)
q_sample<- quakes[seq(from = 1,1000,by=10),]
nrow(q_sample)
ggplot(q_sample,aes(lat,long))+
  geom_point(size=3)+ #hidden when preceded by new argument
  geom_point(aes(size=mag,color=mag))+
  scale_colour_viridis(option = "B")+
  scale_size_continuous(range = c(1,9))+
  #guides(color=T)+
  labs(x="Lattitude", y="longitude",title = "Bubble Plot")+
  ggsave("bubbleplot.pdf")

#jitter plot
data("diamonds")
d_sample<- diamonds[seq(from = 1,49000,by=10),]
nrow(d_sample)
ggplot(d_sample,aes(cut,price,color=cut))+geom_jitter()

#---------------class-13---Violin plot----
d_sample<- diamonds[seq(from = 1,53000,by=100),]
nrow(d_sample)
a<-ggplot(d_sample,aes(cut,price,color=cut))+geom_violin()
a+geom_boxplot(width=0.1)+geom_jitter()+
ggsave("violin Plot.pdf",width=6,height=4,unit="in",dpi = 300)
#--------------PCA---class-14----------
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
fviz_pca_ind(iris.pca,
             col.ind = "cos2",
             gradient.col= c("red","blue","green"),
             repel = F)
#-------------------class-15---Heatmap------
#heatmap
data("mtcars")
x<- as.matrix(mtcars)
heatmap(x, scale = "column")
#gplotss
library(gplots)
heatmap.2(x,scale = "column", col = "heat.colors", trace = "none", dendrogram = "row")
?FactoMineR
#pheatmap
library(pheatmap)
pheatmap(x, scale = "column",cutree_cols = 4, cutree_rows = 2, cellwidth = 40, cellheight = 5)

#ggplot2
install.packages("reshape")
library(reshape)
y<- melt(iris)
ggplot(y,aes(y$Species,y$variable,fill=y$value))+
  geom_tile()+
  scale_fill_gradient(low = "red",
                      high= "blue")
#-----------p-value-Article ready barplot with letters--class-16-------
install.packages("ggpval")
install.packages("ggthemes")
install.packages("multcompView")
install.packages("dplyr")
library(ggplot2)
library(ggthemes)
library(multcompView)
library(dplyr)

data("chickwts")
tibble(chickwts) #tibble is a function of dplyr package
#Calculate means of you treatment groups and the standard deviation SD to show on error bars as follows:
mean_data <- group_by(chickwts, feed) %>% #feed is our treatmnet in this example
  summarise(weight_mean=mean(weight), sd = sd(weight)) %>% #to calculate mean and SD
  arrange(desc(weight_mean)) #to arange in descending order
tibble(mean_data)

#This step involves performing analysis of variance ANOVA, using buitin aov() function.
anova <- aov(weight ~ feed, data = chickwts)
summary(anova)

#If the ANOVA is significantly diffrent then, we will draw a multiple mean comparison test (TUKEY HSD, LSD, or Duncan Multiple Range) on anova object from previous step.
tukey <- TukeyHSD(anova)
tukey
##Draw multiple comparison letters using multcomp R package as follows:
group_letters <- multcompLetters4(anova, tukey)
# we have to mention both anova model and tukey objects to get group letters
group_letters
##As we have group letters now in step-5, we can extract these group letters add them to our mean_data a data frame developed in step-2 as follows:
##extracting group letters
group_letters <- as.data.frame.list(group_letters$feed)
##adding to the mean_data
mean_data$group_letters <- group_letters$Letters
tibble(mean_data)
#Drawing the publication ready Barplot in ggplot2
p <- ggplot(mean_data, aes(x = feed, y = weight_mean)) +
  geom_bar(stat = "identity", aes(fill = feed), show.legend = FALSE, width = 0.6) + #barplot
  geom_errorbar( #this argument is putting sd as error bars
    aes(ymin = weight_mean-sd, ymax=weight_mean+sd), 
    width = 0.1
  ) + 
  geom_text(aes(label = group_letters, y = weight_mean + sd), vjust=-0.4) + #add letters
  scale_fill_brewer(palette = "BrBG", direction = 1) + #theme setting
  labs(#this will add labels 
    x = "Feed Type",
    y = "Chicken Weight (g)",
    title = "Publication Ready Barplot",
    subtitle = "Made by #RwithAammar",
    fill = "Feed Type"
  ) +
  ylim(0,410)+ #change your yaxis limits based on the letters
  ggthemes::theme_par(); p
tiff('Barplot.tiff', units="in", width=10, height=6, res=300, compression = 'lzw')
p
dev.off()
----









