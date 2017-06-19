best <- function(state, outcome) {
    ## Read outcome data
    data <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
    
    variable <- as.numeric()
    
    if(outcome == "heart attack"){
        variable <- 11
    } else if (outcome == "heart failure"){
        variable <- 17
    } else {
        variable <- 23
    }
    
    data[,variable] <- as.numeric(data[,variable])
    
    stateData <- subset(data,State==state)
    
    minimum <- min(stateData[,variable], na.rm = TRUE)
    
    name <- stateData$Hospital.Name[stateData[variable] == minimum]
    
    name
}
