library(dplyr)

if(!file.exists("data")) {
    dir.create("data")
}

fileURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv"
download.file(fileURL, destfile = "./data/Idaho.csv")

data <- read.csv("./data/Idaho.csv")
data <- tbl_df(data)

filter(data,VAL==24)