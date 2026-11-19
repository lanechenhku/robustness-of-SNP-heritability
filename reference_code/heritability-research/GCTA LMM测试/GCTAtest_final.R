set.seed(39)
m<-100
siga <- 0.8 
sige <- 0.4
beta<-rnorm(m,0,sqrt(siga/m))
n<-10000
x<-NA
x<-rbind(rnorm(m,0,8))
for(i in 2:n){
  x<-rbind(x,0.9*x[i-1,]+0.1*rnorm(m,0,8))
}
eps <- rnorm(n, 0, sige)
y <- x%*%beta + eps
g<-x%*%beta
I<-c(rep(1,n/5),rep(2,n/5),rep(1,n/5),rep(4,n/5),rep(5,n/5))
dat <- data.frame(I,x, y)
library(lme4)
mod1 <- lmer(y ~ 1 + (X1+X2+X3+X4+X5+X6+X7+X8+X9+X10+X15+X16+X17+X18+X19+X20|I), data=dat) 
varf_1 <- var(predict(mod1,re.form=NA))
vars1 <- as.data.frame(VarCorr(mod1))
vara_1 <- sum(vars1[,4]) 
m<-summary(mod1)
vare_1 <- vars1[length(vars1[,1]),4]
R2LMMc <- (varf_1+vara_1-vare_1)/(varf_1+vara_1)
var<-varf_1+vara_1
library(MuMIn)
r.squaredGLMM(mod1)
R2LMMc
var(y)
var
m<-summary(lm(y~dat$X1+dat$X2+dat$X3+dat$X4))
m$r.squared
cor(y,g)
LD=cor(x,x)
GRM=cor(t(x),t(x))
k<-sample(1:100,50)
GRM2<-cor(t(x)[k,],t(x)[k,])
mean(abs(GRM))
mean(abs((GRM-GRM2)[1,]))
