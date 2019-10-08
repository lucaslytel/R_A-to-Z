

#matrix()

?matrix #nrow * ncol must equal amount of values in matrix
mydata <- 1:20
A <- matrix(mydata, 4, 5)


A[2,3]
A

B <- matrix(mydata, 4, 5, byrow = T)
B[2,5]
A

#rbind()
r1 <- c("I", "am", "happy")
r2 <- c("what", "a", "day")
r3 <- c(1,2,3) # cannot mix tpyes these numbers become characters

rbind(r1,r2,r3)

#cbind()
c1 <- 1:5
c2 <- -1:-5

cbind(c1,c2)


#Named Vectors

charlie <- 1:5

#give names 
names(charlie) <- c("a", "b", "c", "d", "e")
names(charlie)
charlie["b"]

#------------------------

#naming matrix dimensions 1

temp.vec <- rep(c("a", "b", "Zz"), each=3)
temp.vec

Bravo <- matrix(temp.vec, 3, 3)
Bravo

rownames(Bravo) <- c("How", "Are", "You?")
Bravo

colnames(Bravo) <- c("x", "y", "z")
Bravo
Bravo[2,2]
Bravo["Are", "y"] <- 0 # change things inside a matrix! 

rownames(Bravo) <- NULL
Bravo
