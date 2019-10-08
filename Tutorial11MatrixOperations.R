Games

Games["LeBronJames", "2012"]

FieldGoals

round(FieldGoals / Games, 1) 

round(MinutesPlayed / Games)

MinutesPlayed


FieldGoals / FieldGoalAttempts

#Mat Plot
?matplot # by default does columns

matplot(t(FieldGoals), type="b", pch = 15:19, col=c(1:4, 6))
?legend
legend("bottomleft", inset=0.01, legend=Players, col=c(1:4, 6), pch=15:18, horiz = F) # these are two different objects
#this is a main reaons to use ggplot2 

matplot(t(FieldGoals/FieldGoalAttempts), type = "b", pch = 15:18, col= c(1:4,6))
legend("bottomleft", inset=0.01, legend=Players, col=c(1:4, 6), pch=15:18, horiz = F) # these are two different objects

