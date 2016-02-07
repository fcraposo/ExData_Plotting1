# set the file name
fileName <- "./household_power_consumption.txt"
# load the data
data <- read.table(fileName, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
# slice the data for the specified interval
slicedData <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]
# format to datetime
datetime <- strptime(paste(slicedData$Date, slicedData$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
# convert to numeric
globalActivePowerData <- as.numeric(slicedData$Global_active_power)
globalReactivePowerData <- as.numeric(slicedData$Global_reactive_power)
voltage <- as.numeric(slicedData$Voltage)
subMetering1Data <- as.numeric(slicedData$Sub_metering_1)
subMetering2Data <- as.numeric(slicedData$Sub_metering_2)
subMetering3Data <- as.numeric(slicedData$Sub_metering_3)
# creates the graphics device
png("plot4.png", width=480, height=480)
# sets the plot matrix
par(mfrow = c(2, 2)) 
# 1st plot
plot(datetime, globalActivePowerData, type="l", xlab="", ylab="Global Active Power", cex=0.2)
# 2nd plot
plot(datetime, voltage, type="l", xlab="datetime", ylab="Voltage")
# 3rd plot
plot(datetime, subMetering1Data, type="l", ylab="Energy Submetering", xlab="")
lines(datetime, subMetering2Data, type="l", col="red")
lines(datetime, subMetering3Data, type="l", col="blue")
# plots the legends
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"), bty="o", box.lwd=0)
# 4th plot
plot(datetime, globalReactivePowerData, type="l", xlab="datetime", ylab="Global_reactive_power")
# shuts down the graphics device
dev.off()