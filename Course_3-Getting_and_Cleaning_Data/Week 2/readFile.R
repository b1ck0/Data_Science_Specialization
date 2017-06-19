dataFrame <- read.fwf("data.for", header = FALSE, skip = 4, widths = c(10,5,4,4,5,4,4,5,4,4,5,4,4)) 
sum(dataFrame[,6])+sum(dataFrame[,13])