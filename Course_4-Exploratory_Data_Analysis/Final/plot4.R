library(dplyr)

setwd("~/GitHub/ExploratoryDataAnalysis_final")

## reading the data sets
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

SCC <- tbl_df(SCC)

## removing the non-used columns from SCC
SCC <- select(SCC, SCC, Short.Name, EI.Sector)

## filtering the SCC which have something to do with "coal combustion=related sources"
newData <- filter(SCC, grepl("[Cc]oal", EI.Sector))

## subsetting the emissions produced by "coal combustion=related sources"
NEICoal <- subset(NEI, SCC %in% newData$SCC)

## calculating the total emissions per year
totalEmissionsPerYear <- tapply(NEICoal$Emissions, NEICoal$year, sum)

## Activating PNG drawing device
png(filename = "plot4.png", width = 800, height = 600, units = "px")

plot(names(totalEmissionsPerYear), totalEmissionsPerYear, 
     xlab = "Year", 
     ylab = "TOTAL PM2.5",
     main = "PM2.5 Development for Coal Combustion-Related Sources across USA")
lines(names(totalEmissionsPerYear),totalEmissionsPerYear)

## Deactivating the PNG drawing device
dev.off()