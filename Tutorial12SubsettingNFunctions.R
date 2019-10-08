x <- c("a", "b", "c", "d", "e")
x
x[c(1,5)]
x[1]


Games[1:3,6:10]
Games[c(1,10),]
Games[,c("2008","2009")]


is.matrix(Games[1,])
is.vector(Games[1,])

# R is trying to guess what you want - since object isn't 2D it returns a named vector
# Consistent behavior for []

Games[1,, drop=F] # drop = F always returns same class of object from Matrix

Data <- MinutesPlayed[1,, drop = F]
matplot(t(Data), type = "b", pch = 15:18, col = c(1:4, 6))
legend("bottomleft", inset = 0.01, legend = Players[1], pch = 15:18, col = c(1:4, 6))


# Creating a function that does the above operation


myplot <- function(data, rows=1:10){
  Data <- data[rows,, drop = F]
  matplot(t(Data), type = "b", pch = 15:18, col = c(1:4, 6))
  legend("bottomleft", inset = 0.01, legend = Players[rows], pch = 15:18, col = c(1:4, 6))
}

myplot(Games)


#Doing Analysis!! 

#Salary Metrics
myplot(Salary)
myplot(Salary / Games)
myplot(Salary / FieldGoals)

#In Game Metrics
myplot(MinutesPlayed)
myplot(Points)

#In Game Metrics - Normalized
myplot(FieldGoals / Games)
myplot(FieldGoals / FieldGoalAttempts)
myplot(FieldGoalAttempts / Games)
myplot(Points/Games)

#Interesting Observation
myplot(MinutesPlayed / Games)
myplot(Games)

#Time is valueable

myplot(FieldGoals / MinutesPlayed)

#Player Style

myplot(Points / FieldGoals)

