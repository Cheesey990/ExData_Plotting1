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
png(filename = "plot3.png")

##Plot line chart using Sub Meter 1
plot(Data3$DateTime, Data3$Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering", frame.plot = TRUE, col = "black", lty = "solid")

##Add Sub meter 2
lines(Data3$DateTime, Data3$Sub_metering_2, type = "l", col = "red", lty = "solid")

##Add Sub meter 3
lines(Data3$DateTime, Data3$Sub_metering_3, type = "l", col = "blue", lty = "solid")

##Add legend
legend("topright", lty = "solid", c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), col = c("black","red", "blue"))

##Close device
dev.off()