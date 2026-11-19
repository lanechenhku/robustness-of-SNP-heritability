beta0 <- 100 
beta1 <- 3 
beta2 <- 1.2 
Alevel <- rep(paste("A", 1:20, sep=""), each=50) 
effA <- rep(rnorm(20, 0, siga), each=50) #level a
x1 <- rnorm(1000, 0, 8) #obs level 
x2 <- rnorm(1000, 0, 8) #obs level 
eps <- rnorm(1000, 0, sige)
y <- beta0 + beta1*x1 + effA + eps
dat <- data.frame(Alevel,effA, x1, x2, y)
library(lme4)
mod1 <- lmer(y ~ 1+x1 + (1|Alevel), data=dat) 
varf_1 <- var(predict(mod1, re.form=NA))
vars1 <- as.data.frame(VarCorr(mod1))
vara_1 <- vars1[1,4] 
vare_1 <- vars1[2,4] 
R2LMMc <- (varf_1+vara_1)/(varf_1+vara_1+vare_1)
summary(mod1)
library(MuMIn)
r.squaredGLMM(mod1)