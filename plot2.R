##Read Data 
powerData <- read.table("household_power_consumption.txt", sep = ";", header = TRUE, na.strings = "?", colClasses = c("character","character", "numeric", "numeric", "numeric", "numeric","numeric","numeric","numeric"))
powerData$Date <- as.Date(powerData$Date, format="%d/%m/%Y")
##Subset of data for select dates
powerDataSub <- subset(powerData, Date == "2007-02-01" | Date == "2007-02-02")
#Add DateTime Column
powerDataSub$DateTime <- strptime(paste(powerDataSub$Date, powerDataSub$Time), "%Y-%m-%d %H:%M:%S")

#Create plot on screen device
par(mfrow = c(1,1), mar = c(5,4,4,2))
plot(powerDataSub$DateTime, powerDataSub$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")

## Copy plot to PNG file
dev.copy(png, file = "plot2.png", width = 480, height = 480)
dev.off()
