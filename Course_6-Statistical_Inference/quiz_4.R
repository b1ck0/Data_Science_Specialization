setwd("~/GitHub/StatisticalInference_Quiz4")

#######################################  1  #############################################################################################################
## A pharmaceutical company is interested in testing a potential blood pressure lowering medication. Their first examination considers only subjects that 
## received the medication at baseline then two weeks later. The data are as follows (SBP in mmHg)

## Consider testing the hypothesis that there was a mean reduction in blood pressure? Give the P-value for the associated two sided T test.
## (Hint, consider that the observations are paired.)

week0 <- c(140,138,150,148,135)
week2 <- c(132,135,151,146,130)
t.test(x = week0,y = week2, paired = TRUE)
## ANSWER: 0.087

#######################################  2  #############################################################################################################
## A sample of 9 men yielded a sample average brain volume of 1,100cc and a standard deviation of 30cc. What is the complete set of values of mu0 that a 
## test of H0:mu=mu0 would fail to reject the null hypothesis in a two sided 5% Students t-test?

1100 + c(-1, 1) * qt(0.975, 9 - 1) * 30 / sqrt(9)
## ANSWER: 1077 to 1123

#######################################  3  #############################################################################################################
## Researchers conducted a blind taste test of Coke versus Pepsi. Each of four people was asked which of two blinded drinks given in random order that 
## they preferred. The data was such that 3 of the 4 people chose Coke. Assuming that this sample is representative, report a P-value for a test of the 
## hypothesis that Coke is preferred to Pepsi using a one sided exact test.

pbinom(3, size = 4, prob = 0.5, lower.tail = FALSE)
## ANSWER: 0.31

#######################################  4  #############################################################################################################
## Infection rates at a hospital above 1 infection per 100 person days at risk are believed to be too high and are used as a benchmark. A hospital that 
## had previously been above the benchmark recently had 10 infections over the last 1,787 person days at risk. About what is the one sided P-value for 
## the relevant test of whether the hospital is *below* the standard?

ppois(10, lambda = 0.01 * 1787)
## ANSWER: 0.03

#######################################  5  #############################################################################################################
## Suppose that 18 obese subjects were randomized, 9 each, to a new diet pill and a placebo. Subjects body mass indices (BMIs) were measured at a 
## baseline and again after having received the treatment or placebo for four weeks. The average difference from follow-up to the baseline 
## (followup - baseline) was ???3 kg/m2 for the treated group and 1 kg/m2 for the placebo group. The corresponding standard deviations of the differences 
## was 1.5 kg/m2 for the treatment group and 1.8 kg/m2 for the placebo group. Does the change in BMI appear to differ between the treated and placebo 
## groups? Assuming normality of the underlying data and a common population variance, give a pvalue for a two sided t test.

m1 <- -3
s1 <- 1.5
n1 <- 9

m2 <- 1
s2 <- 1.8
n2 <- 9

Sp <- sqrt((s1^2+s2^2)/2)
err <- Sp*(1/n1+1/n2)^0.5
df <- n1+n2-2

# critical value above/below which we reject the NULL hypothesis
crVal <- c(-1,1)*qt(0.975, df=df)

# double sided t test statistics value
tStat <- (m2 - m1)/err

# obtaining the p-value, quantile = tStat
2*pt(q = tStat,lower.tail = FALSE, df = df) 
## ANSWER: Less than 0.01

#######################################  6  #############################################################################################################
## Brain volumes for 9 men yielded a 90% confidence interval of 1,077 cc to 1,123 cc. Would you reject in a two sided 5% hypothesis test of
## H0: mu = 1078

# obtaining the population mean and standard deviation from the confidence interval
A = matrix(
    c(1,qt(0.975,df=8)/sqrt(9),1,-qt(0.975,df=8)/sqrt()),
    nrow = 2,
    ncol = 2,
    byrow = TRUE
)

B = matrix(
    c(1077,1123),
    nrow = 2,
    ncol = 1,
    byrow = TRUE
    
)

X = solve(A,B)

mu <- X[1,1]
s <- X[2,1]

## checking if our t.test value is bigger than the critical value
(1078-mu)/(s/sqrt(9)) > qt(0.975,df=8)
## ANSWER: No you wouldn't reject.

#######################################  7  #############################################################################################################
## Researchers would like to conduct a study of 100 healthy adults to detect a four year mean brain volume loss of .01 mm3. Assume that the standard 
## deviation of four year volume loss in this population is .04 mm3. About what would be the power of the study for a 5% one sided test versus a null 
## hypothesis of no volume loss?

#critical value
alpha <- 0.05
n <- 100
s <- 0.04
mu0 <- 0.00
mua <- 0.01

z <- qnorm(1-alpha)

power <- pnorm(mu0 + z * s/sqrt(n), mean = mua, sd = s/sqrt(n), lower.tail = FALSE)
## ANSWER: 0.80

#######################################  8  #############################################################################################################
## Researchers would like to conduct a study of n healthy adults to detect a four year mean brain volume loss of .01 mm3. Assume that the standard 
## deviation of four year volume loss in this population is .04 mm3. About what would be the value of n needed for 90% power of type one error rate of 5% 
## one sided test versus a null hypothesis of no volume loss?
n <- 140
err <- s/sqrt(n)

pnorm(mu0 + z * s/sqrt(n), sd = err, mean = mua, lower.tail = FALSE)
## ANSWER: 140

#######################################  9  #############################################################################################################
## As you increase the type one error rate, alpha, what happens to power?

## ANSWER: You will get larger power.
