library(ggplot2)
library(dplyr)

setwd("~/GitHub/ExploratoryDataAnalysis_final")

## reading the data sets
NEI <- readRDS("summarySCC_PM25.rds")

## subsetting the data for Baltimore City only
NEIBaltimore <- subset(NEI, fips == "24510")
NEIBaltimore <- tbl_df(NEIBaltimore)

## creating factors
NEIBaltimore$year <- factor(NEIBaltimore$year)
NEIBaltimore$type <- factor(NEIBaltimore$type)

## new data frame
dataPerTypePerYear <- NEIBaltimore  %>%
                        group_by(type, year)  %>%
                        summarise(sum(Emissions))

names(dataPerTypePerYear) <- c("type","year", "Emissions")

## Activating PNG drawing device
png(filename = "plot3.png", width = 1024, height = 768, units = "px")

qplot(year, Emissions, data = dataPerTypePerYear, facets = ~type, main="Emission Development for Baltimore City grouped per Source Type")

## Deactivating the PNG drawing device
dev.off()