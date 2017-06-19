library(dplyr)

setwd("~/GitHub/ExploratoryDataAnalysis_final")

## reading the data sets
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

## converting the data frame into dplyr format
SCC <- tbl_df(SCC)

## removing the non-used columns from SCC
SCC <- select(SCC, SCC, Short.Name, EI.Sector)

## filtering the SCC (selecting the rows with SCC codes which indicate motor vehicles only)
newData <- filter(SCC, grepl("^Highway Veh", Short.Name))

## subsetting the emissions produced by "motor vehicles"
NEIVehicles <- subset(NEI, SCC %in% newData$SCC)

## subsetting the "motor vehicles" emission data only for Baltimore City
NEIVehiclesBaltimore <- subset(NEIVehicles, fips == "24510")

## calculating the total emissions per year
totalEmissionsPerYear <- tapply(NEIVehiclesBaltimore$Emissions, NEIVehiclesBaltimore$year, sum)

## Activating PNG drawing device
png(filename = "plot5.png", width = 800, height = 600, units = "px")

plot(names(totalEmissionsPerYear), totalEmissionsPerYear, 
     xlab = "Year", 
     ylab = "TOTAL PM2.5",
     main = "PM2.5 Development for Baltimore City (Motor Vehicles only)")
lines(names(totalEmissionsPerYear),totalEmissionsPerYear)

## Deactivating the PNG drawing device
dev.off()