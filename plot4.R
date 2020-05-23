## Read data
data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")

## Filter the specific dates required
library(dplyr)
data2 <- filter(data, xor(Date == "1/2/2007",Date == "2/2/2007"))

## Create time variable merging Date and Time column
DateTime <- strptime(paste(data2$Date, data2$Time), format = "%d/%m/%Y %H:%M:%S")

## Combine the new column to the dataset
Data3 <- cbind(DateTime, subset(data2, select = -c(Date, Time)))

##Create png file
png(filename = "plot4.png")

##Create plot window
par(mfrow = c(2,2), mar= c(4,2,4,2))

## Plot top left chart
plot(Data3$DateTime, Data3$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power", frame.plot = TRUE, col = "black", lty = "solid", lwd = 0.5)

## Plot top right chart
plot(Data3$DateTime, Data3$Voltage, type = "l", xlab = "datetime", ylab = "Voltage", frame.plot = TRUE, col = "black", lty = "solid",lwd = 0.5)

## Plot bottom left chart
plot(Data3$DateTime, Data3$Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering", frame.plot = TRUE, col = "black", lty = "solid", lwd = 0.5)

## Add Sub meter 2 for bottom left chart
lines(Data3$DateTime, Data3$Sub_metering_2, type = "l", col = "red", lty = "solid", lwd = 0.5)

## Add Sub meter 3 for bottom left chart
lines(Data3$DateTime, Data3$Sub_metering_3, type = "l", col = "blue", lty = "solid", lwd = 0.5)

## Add legend for bottom left chart
legend("topright", lty = "solid", c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), col = c("black","red", "blue"))

## Add bottom right chart
plot(Data3$DateTime, Data3$Global_reactive_power, type = "l", xlab = "datetime", ylab = "Global_reactive_power", frame.plot = TRUE, col = "black", lty = "solid", lwd = 0.5)

##Close device
dev.off()
