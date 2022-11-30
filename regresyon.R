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
  sigma = sigma + ((weight[i]-yhat[i])**2/999)
}
sqrt(sigma)
