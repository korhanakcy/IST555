#height
set.seed(2510)
x <- sample(140:195, 1000, replace = T)
#weight
set.seed(99)
weight <- sample(45:100, 1000, replace = T)

model <- summary(lm(weight ~ x))
model

X <- data.frame(rep(1,1000),x)
X <- as.matrix(X)


hatb <- solve(t(X)%*%X)%*%t(X)%*%weight
rownames(hatb) <- c("b0","b1")
colnames(hatb) <- c("X")
hatb

yhat <- fitted.values(lm(weight ~ x))

#residuals
sigma=0
for (i in 1:1000){
  sigma = sigma + ((weight[i]-yhat[i])**2/998)
}
sqrt(sigma)

#other formula
yi_y_hat <- (weight-yhat)
yi_yhat_square <- yi_y_hat**2
sum_yi_yhat_square <- sum(yi_yhat_square)
sigma <- sum_yi_yhat_square/998
sqrt(sigma)

#r2
y_hat_y_i <- (yhat-mean(weight))
ssres <- (y_hat_y_i)**2

y_i_y_mean <- (weight - mean(weight))
sst <- (y_i_y_mean)**2

r2 <- (sum(ssres)/sum(sst))
r2


#F-statistiscs
sst <- (t(weight)%*%weight)-((sum(weight))**2/1000)
sst  

ssres <- (t(weight)%*%weight)-t(hatb)%*%t(X)%*%weight
ssres

ssreg <- sst-ssres

msreg <- (ssreg)
msres <- ssres/998

F0 <- msreg/msres
F0
