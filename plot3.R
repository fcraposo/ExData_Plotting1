# set the file name
fileName <- "./household_power_consumption.txt"
# load the data
data <- read.table(fileName, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
# slice the data for the specified interval
slicedData <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]
# format to datetime
datetime <- strptime(paste(slicedData$Date, slicedData$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
# convert sub meterings to numeric
subMetering1Data <- as.numeric(slicedData$Sub_metering_1)
subMetering2Data <- as.numeric(slicedData$Sub_metering_2)
subMetering3Data <- as.numeric(slicedData$Sub_metering_3)
# creates the graphics device
png("plot3.png", width=480, height=480)
# plots the lines for each sub metering
plot(datetime, subMetering1Data, type="l", ylab="Energy Submetering", xlab="")
lines(datetime, subMetering2Data, type="l", col="red")
lines(datetime, subMetering3Data, type="l", col="blue")
# plots the legends
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))
# shuts down the graphics device
dev.off()