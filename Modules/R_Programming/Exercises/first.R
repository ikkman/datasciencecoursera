add <- function (x, y)
{
   x + y
}

above10 <- function (x)
{
   x[x > 10]
}

above <- function (x, n = 10)
{
   y <- x[x > n]
   
   if (length(y) == 0) 
      return(NA)
   
   return(y)
}

columnmean <- function(x, excludeNA = TRUE)
{
   nc <- ncol(x)
   means <- numeric(nc)
   
   for (i in 1:nc)
   {
      means[i] <- mean(x[, i], na.rm = excludeNA)
   }
   
   means
}

make.power <- function(n) 
{
   pow <- function (x)
   {
      x ^ n
   }
   
   pow
}

y <- 10

f <- function (x)
{
   y <- 2
   y^2 + g(x)
}

g <- function (x)
{
   x * y
}

