library(xlsx)

if(!file.exists("data")){
    dir.create("data")
}

fileURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FDATA.gov_NGAP.xlsx"
download.file(fileURL, destfile = "./data/NGAP.xlsx")

dat <- read.xlsx("./data/NGAP.xlsx", sheetIndex = 1, rowIndex = 18:23, colIndex = 7:15)

sum(dat$Zip*dat$Ext,na.rm=T)