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

## converting our variables into numbers
household$Sub_Metering_1 <- as.numeric(household$Sub_Metering_1)
household$Sub_Metering_2 <- as.numeric(household$Sub_Metering_2)
household$Sub_Metering_3 <- as.numeric(household$Sub_Metering_3)
household$Global_active_power <- as.numeric(household$Global_active_power)
household$Global_reactive_power <- as.numeric(household$Global_reactive_power)
household$Voltage <- as.numeric(household$Voltage)

## Activating PNG drawing device
png(filename = "plot4.png", width = 480, height = 480, units = "px")

## defining that we want 2x2 matrix of graphs which will be printed row-wise
par(mfrow=c(2,2))

## plotting the first graph
plot(household$Time,household$Global_active_power, col = 'black', ylab = "Global Active Power (kilowatts)",type = "n", xlab = "")
lines(household$Time,household$Global_active_power, type = "l")

## plotting the second graph
plot(household$Time,household$Voltage, col = 'black', ylab = "Global Active Power (kilowatts)",type = "n", xlab = "")
lines(household$Time,household$Voltage, type = "l")

## plotting the third graph
plot(household$Time,household$Sub_Metering_1, ylab = "Energy Sub Metering", type = "n", xlab = "")
lines(household$Time,household$Sub_Metering_1, type = "l", col="black")
lines(household$Time,household$Sub_Metering_2, type = "l", col="red")
lines(household$Time,household$Sub_Metering_3, type = "l", col="blue")
legend("topright", legend = c('Sub_Metering_1', 'Sub_Metering_2', 'Sub_metering_3'), lty = 1, lwd = 1, col = c('black','red','blue'))

## plotting the fourth graph
plot(household$Time,household$Global_reactive_power, col = 'black', ylab = "Global Active Power (kilowatts)",type = "n", xlab = "")
lines(household$Time,household$Global_reactive_power, type = "l")

## Deactivating the PNG drawing device
dev.off()