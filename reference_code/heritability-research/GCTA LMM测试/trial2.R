library(lars)
n <- 1000
x1 <- rnorm(n)
x2 <- 12/13*x1+rnorm(n)*5/13
x3 <- rnorm(n)
x4 <- rnorm(n)
x5 <- rnorm(n)
y <- 0.01*x1 + 0.01*x2 + 0.01*x3 + 0.01*x4 + 0.5*x1*x2+rnorm(n)
x <- cbind(x1,x2,x3,x4,x5)
cov(cbind(y,x))
summary(lm(y ~ x1 + x2 +x3 + x4 + x5))
library(glmnet)

n <- 10
x1 <- rnorm(n)
x2 <- 12/13*x1+rnorm(n)*5/13
x3 <- rnorm(n)
x4 <- rnorm(n)
x5 <- rnorm(n)
y2 <- 0.01*x1  + 0.01*x3 + 0.01*x4 + 0.1*x1*x3+0.8*rnorm(n)
g <- 0.01*x1  + 0.01*x3 + 0.01*x4 + 0.1*x1*x3
x <- cbind(x1,x2,x3,x4,x5,g)
xx <- cbind(x1,x2,x3,x4,x5)
lambda_seq <- 10^seq(2, -2, by = -.1)

cov(cbind(y2,x))
summary(lm(y2 ~ x1+x2+x3))
m<-lars(xx,y2,"lasso",trace=T)
m$beta

