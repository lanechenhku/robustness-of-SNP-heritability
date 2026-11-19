# Splitting the data into test and train
x_var<-data.frame(xx)
y_var<-data.frame(y2)
set.seed(86)
train = sample(1:nrow(x_var), nrow(x_var)/2)
x_test = data.frame(x_var[-train,])
y_test = y_var[-train,]
lambda_seq <- 10^seq(2, -2, by = -.1)
cv_output <- cv.glmnet(x_vars[train,], y_var[train,], 
                       alpha = 1, lambda = lambda_seq)

# identifying best lamda
best_lam <- cv_output$lambda.min
lasso_best <- glmnet(x_vars[train,], y_var[train,], alpha = 1, lambda = best_lam)
pred <- predict(lasso_best, s = best_lam, newx = x_test)

        