## In a population of interest, a sample of 9 men yielded a sample average brain volume of 1,100cc 
## and a standard deviation of 30cc. What is a 95% Student's T confidence interval for the mean 
## brain volume in this new population?
1100 + c(-1,1)*qt(0.975,8)*30/sqrt(9)

## A diet pill is given to 9 subjects over six weeks. The average difference in weight 
## (follow up - baseline) is -2 pounds. What would the standard deviation of the difference in 
## weight have to be for the upper endpoint of the 95% T confidence interval to touch 0?
## mu + qt(0.975,8)*s/sqrt(n) = 0
2*sqrt(9)/qt(0.975,8)

## In an effort to improve running performance, 5 runners were either given a protein supplement 
## or placebo. Then, after a suitable washout period, they were given the opposite treatment. 
## Their mile times were recorded under both the treatment and placebo, yielding 10 measurements 
## with 2 per subject. The researchers intend to use a T test and interval to investigate the 
## treatment. Should they use a paired or independent group T test and interval?

## In a study of emergency room waiting times, investigators consider a new and the standard 
## triage systems. To test the systems, administrators selected 20 nights and randomly assigned 
## the new triage system to be used on 10 nights and the standard system on the remaining 10 
## nights. They calculated the nightly median waiting time (MWT) to see a physician. The average 
## MWT for the new system was 3 hours with a variance of 0.60 while the average MWT for the old 
## system was 5 hours with a variance of 0.68. Consider the 95% confidence interval estimate for 
## the differences of the mean MWT associated with the new system. Assume a constant variance. 
## What is the interval? Subtract in this order (New System - Old System).
X <- 3
sx <- 0.60
nx <- 10

Y <- 5
sy <- 0.68
ny <- 10

df <- nx + ny - 2 # degrees of freedom

Sp <- sqrt(((nx-1)*sx^2+(ny-1)*sy^2)/df) # pooled variance estimator
err <- Sp*(1/nx+1/ny)^0.5 # standard error

(X - Y) + c(-1,1)*qt((1-0.025/2),df)*err # 95% confidence interval (two-sided)

## Suppose that you create a 95% T confidence interval. You then create a 90% interval using 
## the same data. What can be said about the 90% interval with respect to the 95% interval?

## To further test the hospital triage system, administrators selected 200 nights and randomly 
## assigned a new triage system to be used on 100 nights and a standard system on the remaining 
## 100 nights. They calculated the nightly median waiting time (MWT) to see a physician. The 
## average MWT for the new system was 4 hours with a standard deviation of 0.5 hours while the 
## average MWT for the old system was 6 hours with a standard deviation of 2 hours. Consider the 
## hypothesis of a decrease in the mean MWT associated with the new treatment.
## What does the 95% independent group confidence interval with unequal variances suggest vis a 
## vis this hypothesis? (Because there's so many observations per group, just use the Z quantile 
## instead of the T.)
X <- 4
sx <- 0.50
nx <- 100

Y <- 6
sy <- 2
ny <- 100

(Y - X) + c(-1,1)*qnorm(1-0.025/2)*(sx^2/nx+sy^2/ny)^0.5

################################################################################################

x1 <- -3
s1 <- 1.5
n1 <- 9

x2 <- 1
s2<- 1.8
n2 <- 9

s <- sqrt(((n1 - 1) * s1^2 + (n2 - 1) * s2^2)/(n1 + n2 - 2))

(x1 - x2) + c(-1, 1) * qt(0.95, n1 + n2 - 2) * s * sqrt(1/n1 + 1/n2)
