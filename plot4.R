##Read Data 
powerData <- read.table("household_power_consumption.txt", sep = ";", header = TRUE, na.strings = "?", colClasses = c("character","character", "numeric", "numeric", "numeric", "numeric","numeric","numeric","numeric"))
powerData$Date <- as.Date(powerData$Date, format="%d/%m/%Y")
##Subset of data for select dates
powerDataSub <- subset(powerData, Date == "2007-02-01" | Date == "2007-02-02")
#Add DateTime Column
powerDataSub$DateTime <- strptime(paste(powerDataSub$Date, powerDataSub$Time), "%Y-%m-%d %H:%M:%S")

#Create plot on screen device
par(mfrow = c(2,2), mar = c(4,4,2,2))
##plot1 - Top Left
plot(powerDataSub$DateTime, powerDataSub$Global_active_power, type = "l",xlab = "", ylab = "Global Active Power")
##plot2 - Top Right
plot(powerDataSub$DateTime, powerDataSub$Voltage, type = "l", xlab = "datetime", ylab = "Voltage")
## plot3 - Bottom Left
plot(powerDataSub$DateTime, powerDataSub$Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering")
points(powerDataSub$DateTime, powerDataSub$Sub_metering_2, type = "l", xlab = "", ylab = "Energy sub metering", col = "red")
points(powerDataSub$DateTime, powerDataSub$Sub_metering_3, type = "l", xlab = "", ylab = "Energy sub metering", col = "blue")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black", "red", "blue"), lty = 1, bty ="n", text.width = 90000, pt.cex=1, cex=0.8)
##plot4 - Bottom Right
plot(powerDataSub$DateTime, powerDataSub$Global_reactive_power, type = "l", xlab = "datetime", ylab = "Global_reactive_power")

## Copy plot to PNG file
dev.copy(png, file = "plot4.png", width = 480, height = 480)
dev.off()
