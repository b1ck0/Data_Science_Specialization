################################################################
## Vasil Yordanov (b1ck0)
## 05.05.2017
################################################################


## reading the data file (reading only the two days of interest 1 and 2 February 2017)
## unfortenately by skipping the first 66636 rows we cannot read the variable names and they must be defined with additinal command

household <- read.table("household_power_consumption.txt", sep=";", nrows = 2880, skip = 66636)
names(household) <- c("Date","Time","Global_active_power", "Global_reactive_power", "Voltage", 
                      "Global Intensity", "Sub_Metering_1", "Sub_Metering_2", "Sub_Metering_3")

## converting the variable Date to date format
household$Date <- as.Date(household$Date,"%d/%m/%Y")

## converting the varable Time into time format
household$Time <- strptime(household$Time,"%H:%M:%S")

## converting the variable Global_active_power into numeric format
household$Global_active_power <- as.numeric(household$Global_active_power)

## Activating PNG drawing device
png(filename = "plot1.png", width = 480, height = 480, units = "px")

## building a histogram of the variable Global Active Power
hist(household$Global_active_power, xlab="Global Active Power (kilowatts)",col="red",main="Global Active Power")

## Deactivating the PNG drawing device
dev.off()