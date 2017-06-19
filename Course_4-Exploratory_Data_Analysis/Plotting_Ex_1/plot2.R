################################################################
## Vasil Yordanov (b1ck0)
## 05.05.2017
################################################################


## reading the data file (reading only the two days of interest 1 and 2 February 2017)
## unfortenately by skipping the first 66636 rows we cannot read the variable names and they must be defined with additinal command

household <- read.table("household_power_consumption.txt", sep=";", nrows = 2880, skip = 66637)
names(household) <- c("Date","Time","Global_active_power", "Global_reactive_power", "Voltage", 
                      "Global_Intensity", "Sub_Metering_1", "Sub_Metering_2", "Sub_Metering_3")

## joining the date and time variables into a single variable, then converting this variable to time format
## we are doing this so we can have continuous line in our plot, if we simply convert the time and plot
## then the lines for the different days will overlap

household$Time <- paste(household$Date,household$Time)
household$Time <- strptime(household$Time,"%d/%m/%Y %H:%M:%S")

## converting the variable Global_active_power into numeric format
household$Global_active_power <- as.numeric(household$Global_active_power)

## Activating PNG drawing device
png(filename = "plot2.png", width = 480, height = 480, units = "px")

## first we are building an empty plot with defined labels and variables, we want it empty as otherwise we will see the data points
## once we have the empty plot, we only add the lines
plot(household$Time,household$Global_active_power, col = 'black', ylab = "Global Active Power (kilowatts)",type = "n", xlab = "")
lines(household$Time,household$Global_active_power, type = "l")

## Deactivating the PNG drawing device
dev.off()