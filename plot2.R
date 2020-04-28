plotData <- read.table("household_power_consumption.txt", header = TRUE, sep = ";")

subplotdata <- subset(plotData, Date %in% c("1/2/2007","2/2/2007"))

datetime <- strptime(paste(subplotdata$Date, subplotdata$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

png("plot2.png", width = 480, height = 480)

plot(as.numeric(subplotdata$Global_active_power), type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")

dev.off()
