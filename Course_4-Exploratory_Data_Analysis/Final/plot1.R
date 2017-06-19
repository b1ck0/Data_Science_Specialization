setwd("~/GitHub/ExploratoryDataAnalysis_final")

## reading the data sets
NEI <- readRDS("summarySCC_PM25.rds")

## calculating the total emissions per year
totalEmissionsPerYear <- tapply(NEI$Emissions, NEI$year, sum)

## plotting the data using the base system

## Activating PNG drawing device
png(filename = "plot1.png", width = 480, height = 480, units = "px")

plot(names(totalEmissionsPerYear), totalEmissionsPerYear, 
     xlab = "Year", 
     ylab = "TOTAL PM2.5",
     main = "PM2.5 Development for USA")
lines(names(totalEmissionsPerYear),totalEmissionsPerYear)

## Deactivating the PNG drawing device
dev.off()
