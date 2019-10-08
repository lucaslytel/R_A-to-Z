# This is the R file that I will be using for the R course I bought

library(ggplot2)

mydata <- read.csv(file.choose())

ggplot(data = mydata[mydata$carat < 2.5,], 
       aes(x=carat, y=price, color = clarity)) +
  geom_point(alpha=0.1) +
  geom_smooth()

#integer 
x <- 2L
typeof(x)

#double 
y <- 2.5
typeof(y)

#character
a <- "h"
typeof(a)

#logical
q1 <- T
typeof(q1)

