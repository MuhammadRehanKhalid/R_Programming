# seq() function
# seq(from, to, by)
# seq(from, to, length.out)
# seq_along(x)
# create an example
seq(1,10)
seq
seq(from=1, to=10, by=2)
seq(from=1, to=10, length.out=5)
seq_along(1:10)
seq(1, 100000000000, by =1276)
seq(from=1, to=10, length.out=10) # divide into equal parts (xlengthout)
# lengthout argument
seq(1,10, length.out = 30)
# alongwith argument
seq_along(1:10)
vec <- c(1,2,3,4,5)
seq(along.with=(vec))
# descending sequence
seq(10,1)
seq(10,1, by = -1)
# create a sequence of characters
seq("a", "z")
seq("a", "z", by = 2)
