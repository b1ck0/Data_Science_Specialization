## this script is not working as it cannot recognize the xml file as a xml file ....

library(XML)

fileURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Frestaurants.xml"
download.file(fileURL, destfile = "./data/restaurants.xml")

doc <- xmlTreeParse("./data/restaurants.xml", useInternalNodes = TRUE)
