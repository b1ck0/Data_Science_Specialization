# 1 Give a P-value for the two sided hypothesis test of whether slope from a linear regression model is 0 or not.
x <- c(0.61, 0.93, 0.83, 0.35, 0.54, 0.16, 0.91, 0.62, 0.62)
y <- c(0.67, 0.84, 0.6, 0.18, 0.85, 0.47, 1.1, 0.65, 0.36)

# manual linear regression
n = length(x)
slope = cor(y,x) * sd(y) / sd(x)
intercept = mean(y) - slope*mean(x)
residuals = y - intercept - slope*x

# residual standard deviation
residuals.sd = sqrt(sum(residuals^2) / (n-2))

# standard error
ssx = sum((x - mean(x))^2)
intercept.err = ((1 / n + mean(x) ^ 2 / ssx) ^ .5) * residuals.sd
slope.err = residuals.sd / sqrt(ssx)

# testing for H0: slope == 0 and intercept == 0
intercept.t = (intercept - 0)/intercept.err
slope.t = (slope - 0)/slope.err

# calculating the p-values for the slope and intercept (H0: slope == 0 and intercept == 0)
intercept.p = 2*pt(abs(intercept.t), df=n-2, lower.tail = FALSE)
slope.p =  2*pt(abs(slope.t), df=n-2, lower.tail = FALSE)

#ANSWER :0.05296
#ANSWER :0.223

# 3 In the mtcars data set, fit a linear regression model of weight (predictor) on mpg (outcome). Get a 95% confidence interval for the expected mpg at the 
# average weight. What is the lower endpoint?

model1 = with(mtcars, lm(mpg ~ wt))
newx = mtcars[1,]
newx$wt = mean(mtcars$wt)
predict(model1, newx, interval = ("confidence"))

#ANSWER: 18.991

# 4 Refer to the previous question. Read the help file for mtcars. What is the weight coefficient interpreted as?
?mtcars
summary(model1)
# ANSWER: The estimated expected change in mpg per 1,000 lb increase in weight.

# 5 Consider again the mtcars data set and a linear regression model with mpg as predicted by weight (1,000 lbs). 
# A new car is coming weighing 3000 pounds. Construct a 95% prediction interval for its mpg. What is the upper endpoint?
newx$wt = 3
predict(model1, newx, interval = ("prediction"), level = 0.95)
# ANSWER: 27.57

# 6 Consider again the mtcars data set and a linear regression model with mpg as predicted by weight (in 1,000 lbs). A "short" ton is defined as 2000 lbs. 
# Construct a 95% confidence interval for the expected change in mpg per 1 short ton increase in weight. Give the lower endpoint.
sumCoef = summary(model1)$coefficients
(sumCoef[2,1] + c(-1, 1) * qt(.975, df = model2$df) * sumCoef[2, 2])*2
# ANSWER: -12.973

# 7 If my X from a linear regression is measured in centimeters and I convert it to meters what would happen to the slope coefficient?
# ANSWER: ???

# 8 I have an outcome, Y, and a predictor, X and fit a linear regression model with Y=intercept+slope*X+err to obtain intercept and slope. What would be the 
# consequence to the subsequent slope and intercept if I were to refit the model with a new regressor, X+c for some constant, c?

# ANSWER: The new intercept would be intercept-c*slope

# 9 Refer back to the mtcars data set with mpg as an outcome and weight (wt) as the predictor. About what is the ratio of the the sum of the squared errors, 
# when comparing a model with just an intercept (denominator) to the model with the intercept and slope (numerator)?

model1 = with(mtcars, lm(mpg ~ wt))
model2 = with(mtcars, lm(mpg ~ 1))

predict1 = predict(model1)
predict2 = predict(model2)

SSE1 = sum((predict1 - mtcars$mpg)^2)
SSE2 = sum((predict2 - mtcars$mpg)^2)

SSE1/SSE2

# ANSWER: 4 - SSE with intercept will be smaller than SSE without intercept

# 10 Do the residuals always have to sum to 0 in linear regression?
# ANSWER: If an intercept is included, then they will sum to 0.
    