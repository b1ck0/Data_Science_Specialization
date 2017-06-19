library(ggplot2)   # loading the plotting library

rate = 0.2         # rate of the exponential distribution
mean = 1/rate      # theoretical mean of the exponential distribution
sd = 1/rate        # theoretical standard deviation of the exponential distribution
n = 40             # number of sample variables from each distribution
num.sim = 1000     # number of distributions
binwidth = 0.2     # parameter used to scale the width of the histogram

sim = NULL         # initializing the vector of sample varaibles
mns = NULL         # initializing the vector of sample means
sds = NULL         # initializing the vector of sample standard deviations

for (i in 1 : num.sim) {
    set.seed(i)
    sim = rexp(n = n, rate = rate)  # drawing n samples from the exponential distribution
    mns = c(mns, mean(sim))         # appending the sample mean to the vector of sample means
    sds = c(sds, sd(sim))           # appending the sample standrad deviation to the vector of standrd deviations
}

df = data.frame(mns,sds)            # arranging the sample means and standard deviations to a data.frame

# plotting the variable with the simulated means
p = qplot(df$mns,
      geom="histogram",
      xlab = "Value",
      fill=I("blue"), 
      col=I("black"), 
      alpha=I(.2),
      binwidth=binwidth)

# plotting the theoretical mean as a vertical red line
# fitting a normal distribution N(mean, sd/sqrt(n)) to the histogram

p + geom_vline(xintercept = mean, size = 1.5, col="red") + 
    stat_function( 
        fun = function(x, mean, sd, n, bw){ 
            dnorm(x = x, mean = mean, sd = sd) * n * bw
        }, 
        args = c(mean = mean, sd = sd/sqrt(n), n = num.sim, bw = binwidth))