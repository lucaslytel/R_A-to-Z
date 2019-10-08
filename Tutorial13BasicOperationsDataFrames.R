

# Method 1 choose file manually
stats <- read.csv(file.choose())


#Method 2: Set WD and Read Data 
getwd()

setwd("/Users/llytel/Desktop/R Programming")
rm(stats)
# Setting working directory
stats <- read.csv("Demographic-Data.csv")


#------------------------- Exploring Data

nrow(stats)
ncol(stats)

head(stats, n = 10)
tail(stats)
str(stats) #str - means preview the data - stands for structure
runif(stats) # r stands for random unif stans for uniform distribution
summary(stats)

#------------------------- Using the $ sign

stats
head(stats)

stats[3,3]
stats[3, "Birth.rate"]
stats["Angola",3] # columns have names but rows are just numbers

stats$Internet.users[2] # this returns a vector
levels(stats$Income.Group) # also returns a vector

#subsetting

stats[1:10, ]
stats[3:9, ]
stats[c(4,100), ]

is.data.frame(stats[1, ])

is.data.frame(stats[, 1])
is.data.frame(stats[, 1, drop=F])

#multiple columns
stats$Birth.rate * stats$Internet.users
stats$Birth.rate + stats$Internet.users

#add columns
head(stats)
stats$MyCalc <- stats$Birth.rate * stats$Internet.users
# these are all vectorized operations 

#test of knowledge

stats$xyz <- 1:4 # vector gets recylced - must be a multiple of the total rows 
head(stats)
head(stats, n= 20)

stats$MyCalc <- NULL
stats$xyz <- NULL
head(stats)


#--------------------- Filtering Data Frames

head(stats)

filter <- stats$Internet.users < 2 # vector!! 
stats[filter,]


stats[stats$Birth.rate > 40 & stats$Internet.users < 2, ]
stats[stats$Income.Group == "High income", ]
levels(stats$Income.Group)

stats[117, ]
stats[stats$Country.Name == "Malta",]


#--------------------- Introduction to qplot()

library(ggplot2)
?qplot()

qplot(data=stats, x = Internet.users)
qplot(data = stats, x = Income.Group, y = Birth.rate)
qplot(data = stats, x = Income.Group, y = Birth.rate, size=I(5), 
      colour = I("green"))

qplot(data = stats, x = Income.Group, y = Birth.rate, geom = "boxplot")


qplot(data = stats, x = Internet.users, y = Birth.rate)
qplot(data = stats, x = Internet.users, y = Birth.rate, 
      size = I(4), color = I("red"))
qplot(data = stats, x = Internet.users, y = Birth.rate, 
      size = Income.Group, color = Income.Group) # can map visuals to variables!!

#--------------- creating a data frame with vectors

mydf <- data.frame(Countries_2012_Dataset, Codes_2012_Dataset, 
                   Regions_2012_Dataset)
head(mydf)

colnames(mydf) <- c("County", "Code", "Region")

rm(mydf)

mydf <- data.frame(Country = Countries_2012_Dataset, Code = Codes_2012_Dataset, 
                   Region = Regions_2012_Dataset) 
#naming the columns inside creation of data frame

head(mydf)

# ----------------------- Merging Data Frames


merged <- merge(stats, mydf, by.x = "Country.Code", by.y = "Code")
head(merged)

merged$County <-  NULL
head(merged)
str(merged)


qplot(data = merged, x = Internet.users, y = Birth.rate, color = Region, size = I(5))

#1. Shapes

qplot(data = merged, x = Internet.users, y = Birth.rate, 
      color = Region, size = I(5), shape = I(13))

#2. Transparency
qplot(data = merged, x = Internet.users, y = Birth.rate, 
      color = Region, size = I(5), shape = I(19),
      alpha = .6)

#3. Title

qplot(data = merged, x = Internet.users, y = Birth.rate, 
      color = Region, size = I(5), shape = I(19),
      alpha = .6, main = "Birth Rate vs Internet Users",
      position = .5)

?qplot
