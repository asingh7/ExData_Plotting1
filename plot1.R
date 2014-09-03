##Read Data 
powerData <- read.table("household_power_consumption.txt", sep = ";", header = TRUE, na.strings = "?", colClasses = c("character","character", "numeric", "numeric", "numeric", "numeric","numeric","numeric","numeric"))
powerData$Date <- as.Date(powerData$Date, format="%d/%m/%Y")
##Subset of data for select dates
powerDataSub <- subset(powerData, Date == "2007-02-01" | Date == "2007-02-02")

#Create plot on screen device
par(mfrow = c(1,1), mar = c(5,4,4,2))
hist(powerDataSub$Global_active_power, main = "Global Active Power", ylab = "Frequency", xlab = "Global Active Power (kilowatts)", col = "red", breaks = 13, xlim = c(0,6), ylim = c(0,1200))

## Copy plot to PNG file
dev.copy(png, file = "plot1.png", width = 480, height = 480)
dev.off()
