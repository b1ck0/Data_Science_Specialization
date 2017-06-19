library(sqldf)
library(dyplr)

acs <- read.csv("pid.csv")

value1 <- acs[acs$AGEP < 50,pwgtp1]
value2 <- sqldf("select pwgtp1 from acs where AGEP < 50")

value3 <- unique(acs$AGEP)
value4 <- sqldf("select distinct AGEP from acs")
    
identical(value3,value4)