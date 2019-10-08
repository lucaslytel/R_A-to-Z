# Tutorial 6

# A vector is a sequence of data elements of the same basic type
# It is like an Array - it is an ordered set - always has a beginning and end
# Vectors are indexs at 1- can only have data elements of the same type
# Even a single number is stored as a vector of 1

MyFirstVector <- c(3, 45, 56, 732)
is.numeric(MyFirstVector) # this object is numeric - True
is.integer(MyFirstVector) # False because default is double
is.double(MyFirstVector)

V2 <- c(3L, 12L, 243L, 0L)
is.integer(V2)


V3 <- c("a", "b23", "Hello", 7) 
# cannot mix types in vectors
is.character(V3)
V3

seq() #sequence - like ':'
rep() #replicate


seq(1,15)

seq(1,15,2)
z <- seq(1,15,4)

rep(3, 50)
d <- rep(3, 50)
rep("a", 5)

x <- c(80, 20) # conbine functoin is c()
y <- rep(x, 10)

