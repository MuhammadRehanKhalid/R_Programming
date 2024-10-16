##----Syntax -----
2+3 # we added 2 and 3
x = 3
y = 5
x-y # subtract x from y
y-x # subtract y from x
x*y # multiply x and y
x/y # divide x by y
2^3 # 2 to the power of 3
a <- 2
b <- 3
a+b

#-------------
# data structures in R, define them and give examples of each 
# 1. Vectors
# 2. Matrices
# 3. Arrays
# 4. Data Frames
# 5. Lists

numeric_vec <- c(1,2,3,4,5)
numeric_vec
character_vec <- c("a","b","c","d","e")
character_vec
logical_vec <- c(TRUE, FALSE, TRUE, FALSE, TRUE)
logical_vec
logical_vec2 <- c(T, F, T, F, T)
logical_vec2
# data frames are two dimensional data structures
# they are used to store data in rows and columns
df  <- data.frame(numeric_vec, character_vec, logical_vec,
                  number = c(1,2,32,4,5))
df
# now create a matrix
mat <- matrix(1:9, nrow = 3, ncol = 3)
mat
# make another similar matarix
mat2 <- matrix(10:18, nrow = 3, ncol = 3)
mat2
# dot and cross product
mat * mat2
# build and array
arr <- array(1:24, dim = c(2,3,4))
arr
# make lsits
list1 <- list(1,2,3,4,5)
list1
list2 <- list("a","b","c","d","e")
list2
listt  <- list(numeric_vec, character_vec, logical_vec,
                  number = c(1,2,32,4,5))
listt
