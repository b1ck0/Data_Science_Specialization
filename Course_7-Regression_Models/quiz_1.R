# 1 Give the value of mu that minimizes the least squares equation

x <- c(0.18, -1.54, 0.42, 0.95)
w <- c(2, 1, 3, 1)

m = 0.1471

sum(w*(x-m)^2)

# ANSWER: 0.1471

# 2 Fit the regression through the origin and get the slope treating y as the outcome and x as the regressor. (Hint, do not center the data since we want 
# regression through the origin, not through the means of the data.)

x <- c(0.8, 0.47, 0.51, 0.73, 0.36, 0.58, 0.57, 0.85, 0.44, 0.42)
y <- c(1.39, 0.72, 1.55, 0.48, 1.19, -1.59, 1.23, -0.65, 1.49, 0.05)

cor(x,y) * sd(x)/sd(y)

# ANSWER: -0.04462

# 3 Do data(mtcars) from the datasets package and fit the regression model with mpg as the outcome and weight as the predictor. Give the slope coefficient.
data(mtcars)
with(mtcars, cor(mpg, wt) * sd(mpg) / sd(wt))
# ANSWER: -5.344

# 4 Consider data with an outcome (Y) and a predictor (X). The standard deviation of the predictor is one half that of the outcome. 
# The correlation between the two variables is .5. What value would the slope coefficient for the regression model with Y as the outcome and X as the predictor?

# ANSWER: 1

# 5 Students were given two hard tests and scores were normalized to have empirical mean 0 and variance 1. The correlation between the scores on the two tests 
# was 0.4. What would be the expected score on Quiz 2 for a student who had a normalized score of 1.5 on Quiz 1?
1.5 * 0.4

# ANSWER: 0.6

# 6 What is the value of the first measurement if x were normalized (to have mean 0 and variance 1)?

x <- c(8.58, 10.46, 9.01, 9.64, 8.86)

(x - mean(x)) / sd(x)

# ANSWER: -0.9719

# 7 Consider the following data set (used above as well). What is the intercept for fitting the model with x as the predictor and y as the outcome?
x <- c(0.8, 0.47, 0.51, 0.73, 0.36, 0.58, 0.57, 0.85, 0.44, 0.42)
y <- c(1.39, 0.72, 1.55, 0.48, 1.19, -1.59, 1.23, -0.65, 1.49, 0.05)

intercept = mean(y) - mean(x)*(cor(x,y)*sd(y)/sd(x))

# ANSWER: 1.567

# 8 You know that both the predictor and response have mean 0. What can be said about the intercept when you fit a linear regression?

# ANSWER: It must be identically 0.

# 9 What value minimizes the sum of the squared distances between these points and itself?
x <- c(0.8, 0.47, 0.51, 0.73, 0.36, 0.58, 0.57, 0.85, 0.44, 0.42)
mean(x)

# ANSWER: 0.573

# 10 Let the slope having fit Y as the outcome and X as the predictor be denoted as beta1. Let the slope from fitting X as the outcome and Y as the predictor be 
# denoted as gamma1. Suppose that you divide beta1 by gamma1; in other words consider beta1/gamma1. What is this ratio always equal to?

# ANSWER: var(y)/var(x)
