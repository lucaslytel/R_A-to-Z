# Review
x <- c(1,123,523,12,3)  #combine
y <- seq(201,250,11)    #sequence
z <- <- rep("Hi!", 3)   #replicate

# How to acess individual elements of a vector

w <- c("a", "b", "c", "d", "e")

w[1]
w[2]
w[3]
w[-1] # all except 1 
v <- w[-3]

w[1:3] # passing a vector into a vector! - multiple ways to do the same thing
w[3:5]
w[c(1,3,5)]
w[c(-2, -4)]
w[-3:-5]
w[1:2]

w[0]
w[-7] # returns entire vector
w[100]
w[8] # returns NA

# lygometry measuring what you don't know
