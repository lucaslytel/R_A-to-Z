# Homework: Law of Large Numbers

y <- 0
n <- 0

while (n < 100000) {
  x <- rnorm(1)
  if (x < 1 & x > -1) {
    y <- y + 1
    n <- n + 1
  }
    else {
      n <- n + 1
    }

}

mean <- y/n
# expected mean is 68.2%


# Other solution

N <- 100000
count <- 0

for(i in rnorm(N)) {
  if(i < 1 & i > -1) {
    count <- count + 1
  }
}

answer <- count / N 
answer

