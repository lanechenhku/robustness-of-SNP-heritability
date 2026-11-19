set.seed(39)
siga <- 50 
sige <- 1
beta0 <- 100 
beta1 <- 1
beta2 <- 1 
n<-10000
I<-rep(c(1:2),n/2)
effA <- rep(rnorm(2, 0, siga), each=n/2) #level a
x1 <- scale(rnorm(n, 0, 8))#obs level 
x2 <- scale(rep(c(1,-1),n/2)+rnorm(n,0,1)) #obs level 
#x3 <- rnorm(n, 0, 8) #obs level 
#x4 <- 0.3*x3+0.7*rnorm(n, 0, 8) #obs level
x3<-scale(x[,2])
x4<-scale(x[,3])
x5 <- scale(rnorm(n, 0, 8)) #obs level
eps <- rnorm(n, 0, sige)
y <- beta1*x2+beta1*x1 + eps
g <- beta1*x2+beta1*x1
dat <- data.frame(effA, I,x1, x2,x3,x4,x5, y)
library(Matrix)

library(lme4)
mod1 <- lmer(y ~ 1+(x1+x2+x3+x4+x5|I), data=dat) 
varf_1 <- var(predict(mod1,re.form=NA))
vars1 <- as.data.frame(VarCorr(mod1))
vara_1 <- sum(vars1[,4]) 
m2<-summary(mod1)
vare_1 <- vars1[length(vars1[,1]),4]
R2LMMc <- (varf_1+vara_1-vare_1)/(varf_1+vara_1)
var<-varf_1+vara_1
library(MuMIn)
r.squaredGLMM(mod1)
R2LMMc
var(y)
var
m<-summary(lm(y~x1+x2+x3+x4+x5))
m$r.squared
cor(g,y)^2
