## ------------------------------------------------------------------------
library(farmtest)
set.seed(100)
p = 100
n = 20
epsilon = matrix(rnorm( p*n, 0,1), nrow = n)
B = matrix(rnorm(p*3,0,1), nrow=p)
fx = matrix(rnorm(3*n, 0,1), nrow = n)
mu = rep(0, p)
mu[1:5] = 2
X = rep(1,n)%*%t(mu)+fx%*%t(B)+ epsilon
output = farm.test(X)

## ------------------------------------------------------------------------
output = farm.test(X, alpha = 0.01,alternative = "greater")
names(output)
print(output$rejected)
hist(output$means, 20, main = "Estimated Means", xlab = "")

## ------------------------------------------------------------------------
output = farm.scree(X, K.factors = 15, K.scree = 10)

## ------------------------------------------------------------------------
set.seed(100)
Y = matrix(rnorm(1000, 0, 1),100)
pvalues = apply(Y, 1, function(x) t.test(x)$p.value)
output = farm.FDR(pvalues)
output$rejected
