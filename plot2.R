##read data set
dataset <- read.table("household_power_consumption.txt", header = TRUE,sep=";",na.strings = "?")
## selecct only the 2 relevant days
dataset <- subset(dataset, Date == "1/2/2007" | Date == "2/2/2007")
##combine date and time cols
cols <- c( 'Date' , 'Time' )
dataset$DateTime <- apply( dataset[ , cols ] , 1 , paste , collapse = " " )
dataset$DateTime <- strptime( dataset$DateTime, "%d/%m/%Y %H:%M:%S")
## plot line chart
plot(dataset$DateTime, dataset$Global_active_power, type="l", ylab = "Global Active Power (kilowatt)", xlab = "")
## save plot to png file
dev.copy(png, file = "plot2.png")
dev.off()