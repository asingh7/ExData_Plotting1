##Read Data 
powerData <- read.table("household_power_consumption.txt", sep = ";", header = TRUE, na.strings = "?", colClasses = c("character","character", "numeric", "numeric", "numeric", "numeric","numeric","numeric","numeric"))
powerData$Date <- as.Date(powerData$Date, format="%d/%m/%Y")
##Subset of data for select dates
powerDataSub <- subset(powerData, Date == "2007-02-01" | Date == "2007-02-02")
#Add DateTime Column
powerDataSub$DateTime <- strptime(paste(powerDataSub$Date, powerDataSub$Time), "%Y-%m-%d %H:%M:%S")

#Create plot on screen device
par(mfrow = c(1,1), mar = c(5,4,4,2))
plot(powerDataSub$DateTime, powerDataSub$Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering")
points(powerDataSub$DateTime, powerDataSub$Sub_metering_2, type = "l", xlab = "", ylab = "Energy sub metering", col = "red")
points(powerDataSub$DateTime, powerDataSub$Sub_metering_3, type = "l", xlab = "", ylab = "Energy sub metering", col = "blue")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black", "red", "blue"), lty = 1, bty ="y", text.width = 60000)

## Copy plot to PNG file
dev.copy(png, file = "plot3.png", width = 480, height = 480)
dev.off()
