##read data set
dataset <- read.table("household_power_consumption.txt", header = TRUE,sep=";", na.strings = "?")
## selecct only the 2 relevant days
dataset <- subset(dataset, Date == "1/2/2007" | Date == "2/2/2007")
## plot histogram
hist(dataset$Global_active_power, xlab = "Global Active Power (kilowatt)", main="Global Active Power", col="Red")
## save plot to png file
dev.copy(png, file = "plot1.png")
dev.off()