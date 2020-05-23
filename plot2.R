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
png(filename = "plot2.png")

##Plot line chart
plot(Data3$DateTime, Data3$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)", frame.plot = TRUE, col = "black", lty = "solid")

##Close device
dev.off()