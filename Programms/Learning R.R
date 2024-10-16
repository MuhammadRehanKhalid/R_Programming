library()
getwd()
setwd("D:\\Study and Extras\\R Files Projects")
help("reshape2")
##-----------------Data types--------
y=5.5
is.integer(y)
as.integer(y)





#My First Project
myname <- "Muhammad Rehan Khalid"
print(myname)
v<-TRUE
print(class(v))
v<-FALSE
print(class(v))
v<-23.5
print(class(v))
v<-2L
print(class(v))
v<-3 + 2i
print(class(v))
v<-"TRUE"
print(class(v))
v<- charToRaw("HELLO")
print(class(v))

#Creating Vector
apple <- c('green','yellow','red')
print(apple)
print(class(apple))

#creating list
list(c((23),3),2.13)
list1<- list(c(2,3,6),223.2,sin)
print(list1)
M=matrix(c('a','a','b','c','c','b'),nrow = 3,ncol = 4,byrow = TRUE)
print(M)

#---------------------Pipe Fnctio-----
library(tidyverse)

f(x)
h(g(f(x)))
filter(morley,Expt == 1)
morley%>%filter(Expt == 1)


?heatmap
View(m)
datax <- as.matrix(m)
heatmap(datax, Rowv = T, symm = F, margins = c(6,6),col = topo.colors(30.0))
library(heatmaply)
?heatmaply
m<-mtcars
View(m)
install.packages("dendextend")
library(desc)
library(DESeq)
install.packages("DESeq")


x = 5
print(x)
typeof(x)
is.numeric(x)
x1<-as.integer(x)
typeof(x1)
x=as.integer(x)
is.integer(x)
 x=5
 y=5
x=y 
####Handel Vectorss######
c(2,3,4)
typeof(c)
class(c)
class(c(2,3,"joe"))
typeof(d)

a=c(0,1,2,3,4,5)
b=c("ab","bc","cd")
d=c(TRUE,FALSE)
lst_1=list(a,b,d)
lst_1[[2]][3]

View(mydata)
r <- iris[,-5]
View(r)
dimnames(r)<-list(c(1),c("z"))
str(r)
xxx<- dimnames((r)(row.names(2:151)))

