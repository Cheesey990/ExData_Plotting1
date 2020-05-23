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
png(filename = "plot1.png")

## Plot histogram
hist(Data3$Global_active_power, freq = TRUE, breaks = 12, col = "red", border = "black", main = "Global Active Power", xlab = "Global Active Power (kilowatts)", ylab = "Frequency")

##Close device
dev.off()
