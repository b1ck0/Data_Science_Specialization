setwd("~/GitHub/ExploratoryDataAnalysis_final")

## reading the data sets
NEI <- readRDS("summarySCC_PM25.rds")

## subsetting the data for Baltimore City only
NEIBaltimore <- subset(NEI, fips == "24510")

## calculating the total emissions per year
totalEmissionsPerYear <- tapply(NEIBaltimore$Emissions, NEIBaltimore$year, sum)

## plotting the data using the base system

## Activating PNG drawing device
png(filename = "plot2.png", width = 480, height = 480, units = "px")

plot(names(totalEmissionsPerYear), totalEmissionsPerYear, 
     xlab = "Year", 
     ylab = "TOTAL PM2.5",
     main = "PM2.5 Development for Baltimore City")
lines(names(totalEmissionsPerYear),totalEmissionsPerYear)

## Deactivating the PNG drawing device
dev.off()
