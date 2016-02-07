# set the file name
fileName <- "./household_power_consumption.txt"
# load the data
data <- read.table(fileName, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
# filter the data for the specified interval
slicedData <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]
# format to datetime
datetime <- strptime(paste(slicedData$Date, slicedData$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
# convert to numeric
globalActivePowerData <- as.numeric(slicedData$Global_active_power)
# creates the graphics device
png("plot2.png", width=480, height=480)
# plots the scatter plot in the graphics device
plot(datetime, globalActivePowerData, type="l", xlab="", ylab="Global Active Power (kilowatts)")
# shuts down the graphics device
dev.off()