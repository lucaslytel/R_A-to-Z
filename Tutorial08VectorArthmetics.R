V1 <- c(10,20,34,45,10,3)
V2 <- c(2,4,5)


V3 <- V1 + V2


x <- rnorm(5)
# R specific loop
for(i in x) {
  print(i)
}

#conventional programming loop
for(j in 1:5){
  print(x[j])
}


#----------------- 2nd Part For Today

N <- 1000000
a <- rnorm(N)
b <- rnorm(N)

#Vectorized Approach # fastest way b/c R translates code into other programing language
c <- a * b

#De-vectorized Approach -- this method is slower than the above method
d <- rep(NA,N) # Allocate Memory
for(i in 1:N) {
  d[i] <- a[i] * b[i]
}

