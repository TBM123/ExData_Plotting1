##read data set
dataset <- read.table("household_power_consumption.txt", header = TRUE,sep=";",na.strings = "?")
## selecct only the 2 relevant days
dataset <- subset(dataset, Date == "1/2/2007" | Date == "2/2/2007")
##combine date and time cols
cols <- c( 'Date' , 'Time' )
dataset$DateTime <- apply( dataset[ , cols ] , 1 , paste , collapse = " " )
dataset$DateTime <- strptime( dataset$DateTime, "%d/%m/%Y %H:%M:%S")
## prepare the canvas for 4 charts
par(mfrow = c(2, 2))
## plot top left line chart
plot(dataset$DateTime, dataset$Global_active_power, type="l", ylab = "Global Active Power (kilowatt)", xlab = "")
## plot top right line chart
plot(dataset$DateTime, dataset$Voltage, type="l", xlab = "datetime", ylab = "Voltage")
## plot bottom left chart
plot(dataset$DateTime, dataset$Sub_metering_1, type="l", ylab = "Energy sub metering", xlab = "")
lines(dataset$DateTime, dataset$Sub_metering_2, type="l", col="Red")
lines(dataset$DateTime, dataset$Sub_metering_3, type="l", col="Blue")
## add legend
legend("topright", lty = 1, cex=0.8, col = c("black","blue", "red"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), bty="n")
## plot bottom right line chart
plot(dataset$DateTime, dataset$Global_reactive_power, type="l", xlab = "datetime", ylab = "Global_reactive_power")
## save plot to png file
dev.copy(png, file = "plot4.png")
dev.off()