rankhospital <- function(state, outcome, num = "best") {
    
    ## reading the data frame (as character) and assigning it to variable called Data
    data <- read.csv("outcome-of-care-measures.csv", colClasses = 'character')
    
    ## defining numeric variable called "variable" which will identify the outcome which needs to be looked up
    variable <- as.numeric()
    
    if (outcome == "heart attack") {
        variable <- 11
    } else if (outcome == "heart failure"){
        variable <- 17
    } else {
        variable <- 23
    }
    
    
    ## converitng the outocme of interest in a numeric format
    data[,variable] <- as.numeric(data[,variable])
    
    ## subseting out dataframe with the values for the current state only
    stateData <- subset(data,State==state)
    
    ## removing the NAs in the data
    stateDataClean <- stateData[!is.na(stateData[,variable]),]
    
    ## ordering the stateData by the given outcome
    orderedData <- stateDataClean[order(stateDataClean[,variable],stateDataClean[,2]),]
    
    ## identifying which outcome we want
    position <- as.numeric()
    
    if(num=="best"){
        position <- 1
    } else if (num == "worst") {
        position <- nrow(orderedData)
    } else {
        position <- num
    }
    
    ## returning the name of the hospital
    orderedData[position,2]
}
