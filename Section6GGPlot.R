#Section 6 ggplot function
getwd()
movies <- read.csv(file.choose())
head(movies)

colnames(movies) <- c("Film", "Genre", "CriticRating", "AudienceRating", "BudgetMillions","Year")
head(movies)
tail(movies)
str(movies)

#Factors are just the way that computures refer to words
summary(movies)
factor(movies$Year)
movies$Year <- factor(movies$Year)
summary(movies)
str(movies) # change the year to a factor so that we can group by year

#Aesthetics is how the data is being mapped --- it is not the geometry

ggplot(data = movies, aes(x = CriticRating, y = AudienceRating))

#Adding Geomerty
ggplot(data = movies, aes(x = CriticRating, y = AudienceRating)) +
  geom_point()

#add color
ggplot(data = movies, aes(x = CriticRating, y = AudienceRating, 
                          color = Genre, size = BudgetMillions)) +
  geom_point()
# >> this is number 1 (will be improved)

#------------------------- PLotting With Layers

p <- ggplot(data = movies, aes(x = CriticRating, y = AudienceRating, 
                               color = Genre, size = BudgetMillions))
#Add the data to an object - Has x, y, color, and aesthetics - really powerful tool

#Points
p + geom_point()

#Lines
p + geom_line()

#Multiple Layers
p + geom_line() + geom_point()

#---------------------------- Overriding Layers

q <- ggplot(data = movies, aes(x = CriticRating, y=AudienceRating,
                               color = Genre, size = BudgetMillions))
q + geom_point()

#override aes 

#Example 1
q + geom_point(aes(size = CriticRating))

#Example 2 
q + geom_point(aes(color = BudgetMillions))

# q remains the same - the object is not changing!

#Example 3 
q + geom_point(aes(x = BudgetMillions)) +
  xlab("Budget Millions $$$")

#Example 4 -- Mapping versus seting
q + geom_line(size = 1) + geom_point()
q

r <- ggplot(data = movies, aes(x = CriticRating, y = AudienceRating))
r + geom_point()

#Add Color 
# 1.By Mapping
r + geom_point(aes(color = Genre))
# 2.By Settting
r + geom_point(color = Genre)
# This is an ERROR
r + geom_point(aes(color = "DarkGreen"))

#Adding Size
#1.Mapping
r + geom_point(aes(size = BudgetMillions))
#2.Setting
r + geom_point(size = 10)
#3.ERROR
r + geom_point(aes(size = 10))

#---------------------Geometries and Statistics 

s <- ggplot(data = movies, aes(x = BudgetMillions))

s + geom_histogram(binwidth = 20, aes(color = Genre))

#add color

s + geom_histogram(binwidth = 10, color = "Black", aes(fill = Genre))

# Chart #3 -------> 

#Density Charts

s + geom_density(aes(fill = Genre))

s + geom_density(aes(fill = Genre), position = "stack")


#------------------------

t <- ggplot(data = movies, aes(x = AudienceRating))
t + geom_histogram(binwidth = 10, 
                   fill = "White", color = "Blue")
#Another way -- this more flexible

t <- ggplot(data = movies)
t + geom_histogram(binwidth = 10, 
                   aes(x = AudienceRating),
                   fill = "White", color = "Blue")

#>>> 4 

t + geom_histogram(binwidth = 10, 
                   aes(x = CriticRating),
                   fill = "White", color = "Blue")

#>>> 5 

t <- ggplot() # add layers after


#--------------------- Statistical Transformations

?geom_smooth


u <- ggplot(data = movies, aes(x = CriticRating, y = AudienceRating,
                               color = Genre))
u + geom_point() + geom_smooth(fill = NA)

#boxplots 

u <- ggplot(data = movies, aes( x = Genre, y = CriticRating,
                                color = Genre))
u + geom_boxplot()
u + geom_boxplot(size = 1.2)
u + geom_boxplot(size = 1.2) + geom_point()

#trick

u + geom_boxplot(size = 1.2) + geom_jitter() # jittters the points

u + geom_jitter() + geom_boxplot(size = 1.2, alpha = 0.5)


#------------------------ Facets

v <- ggplot(data = movies, aes(x = BudgetMillions))
v + geom_histogram(binwidth =  10, aes(fill = Genre),
                   color = "black") # exmaple of mapping vs setting 

#facets:

v + geom_histogram(binwidth =  10, aes(fill = Genre),
                   color = "black") +
  facet_grid(Genre~., scales = "free")

#scatterplots 

w <- ggplot(data = movies, aes(x = CriticRating, y = AudienceRating,
                               color = Genre))
w + geom_point(size = 3) +
  facet_grid(Genre~Year)

w + geom_point(aes(size = BudgetMillions)) +
  geom_smooth(fill = NA) +
  facet_grid(Genre~Year) 

  
#------------------------ Coordinates

#limts 
#zoom


m <- ggplot(data = movies, aes(x = CriticRating, y = AudienceRating,
                               size = BudgetMillions,
                               color = Genre))
m + geom_point()  

m + geom_point() +
  xlim(50,100) +
  ylim(50,100) +
  geom_smooth(fill = NA)

#wont always work
n <- ggplot(data = movies, aes(x = BudgetMillions))
n + geom_histogram(binwidth = 10, aes(fill = Genre), color = "Black")

n + geom_histogram(binwidth = 10, aes(fill = Genre), color = "Black") +
  ylim(0,50) # this cuts off the data

# zoom! 
n + geom_histogram(binwidth = 10, aes(fill = Genre), color = "Black") +
  coord_cartesian(ylim = c(0,50))

w + geom_point(aes(size = BudgetMillions)) +
  geom_smooth() +
  facet_grid(Genre~Year) +
  coord_cartesian(ylim = c(0,100))


#----------------------- Theme

o <- ggplot(data = movies, aes(x = BudgetMillions))

o + geom_histogram(binwidth = 10, aes(fill = Genre), color = "Black")

h <- o + geom_histogram(binwidth = 10, aes(fill = Genre), color = "Black")

#axes labels
h +
  xlab("Money Axis") +
  ylab("Number of Movies") +
  ggtitle("Movie Budget Distribution") +
  theme(axis.title.x = element_text(color = "DarkGreen", size = 30),
        axis.title.y = element_text(color ="Red", size = 30),
        axis.text.x = element_text(size = 10),
        axis.text.y = element_text(size = 10),
        
        legend.title = element_text(size = 20),
        legend.text = element_text(size = 10),
        legend.position = c(1,1),
        legend.justification = c(1,1),
          
        plot.title = element_text(color = "DarkBlue",
                                  size = 40,
                                  family = "Courier"))
#Many of the styling aspects are done with the Theme function!!!


?ggtitle()
