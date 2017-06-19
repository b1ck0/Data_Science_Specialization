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

## subsetting the "motor vehicles" emission data only for Baltimore City and Los Angeles City
Baltimore <- subset(NEIVehicles, fips == "24510")
LosAngeles <- subset(NEIVehicles, fips == "06037")

## calculating the total emissions per year
EmissionsBaltimore <- tapply(Baltimore$Emissions, Baltimore$year, sum)
EmissionsLosAngeles <- tapply(LosAngeles$Emissions, LosAngeles$year, sum)

## Activating PNG drawing device
png(filename = "plot6.png", width = 800, height = 600, units = "px")

par(mfcol=c(1,2))
plot(names(EmissionsBaltimore), EmissionsBaltimore, 
     xlab = "Year", 
     ylab = "TOTAL PM2.5",
     type = "n",
     main = "PM2.5 Development Baltimore (Motor Vehicles only)")

lines(names(EmissionsBaltimore), EmissionsBaltimore, type = "l", col="black")

plot(names(EmissionsLosAngeles), EmissionsLosAngeles, 
     xlab = "Year", 
     ylab = "TOTAL PM2.5",
     type = "n",
     main = "PM2.5 Development Los Angeles (Motor Vehicles only)")
lines(names(EmissionsLosAngeles), EmissionsLosAngeles, type = "l", col="red")

## Deactivating the PNG drawing device
dev.off()