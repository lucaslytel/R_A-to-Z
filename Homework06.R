# Homework 6 Challenge

movie_data <- read.csv(file.choose())
head(movie_data)
str(movie_data)
summary(movie_data)

#filter the data 

filt <- (movie_data$Genre == "action") | (movie_data$Genre == "animation") | (movie_data$Genre == "adventure") | (movie_data$Genre == "drama") | (movie_data$Genre == "comedy")
filt1 <- (movie_data$Studio == "Buena Vista Studios") | (movie_data$Studio == "WB") | (movie_data$Studio == "Fox") | (movie_data$Studio == "Sony") | (movie_data$Studio == "Paramount Pictures") | (movie_data$Studio == "Universal")

cleaned_data <- movie_data[filt & filt1, ]

#genre on x axis 
#gross % us on y axis 
#color is studio
#size is budget

p <- ggplot(data = cleaned_data, aes(x = Genre, y = Gross...US))

p + geom_jitter(aes(color = Studio, size = Budget...mill.)) + 
  geom_boxplot(alpha = .7, outlier.color = NA)

q <- p + geom_jitter(aes(color = Studio, size = Budget...mill.)) + 
  geom_boxplot(alpha = .7, outlier.color = NA)
q <- q + 
  xlab("Genre") +
  ylab("Gross USD") +
  ggtitle("Domestic Gross % by Genre")
q <- q +
  theme (text = element_text(family = ("Comic Sans MS")),
    axis.title.x = element_text(size = 30, color = "Blue"),
    axis.title.y = element_text(size = 30, color = "Blue"),
    axis.text.x = element_text(size = 20),
    axis.text.y = element_text(size = 20),
    legend.title = element_text(size = 20),
    legend.text = element_text(size = 12),
    plot.title = element_text(hjust = .5)
)

q$labels$size = "Budget $M"

q


#done
  
  
