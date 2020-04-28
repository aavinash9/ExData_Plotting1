plotData <- read.table("household_power_consumption.txt", header = TRUE, sep = ";")

subplotdata <- subset(plotData, Date %in% c("1/2/2007","2/2/2007"))

png("plot4.png", width = 480, height = 480)

par(mfrow = c(2,2))

datetime <- strptime(paste(subplotdata$Date, subplotdata$Time, sep=" "), "%d/%m/%Y %H:%M:%S")

plot(datetime, as.numeric(subplotdata$Global_active_power), type = "l", xlab = "", ylab="Global Active Power")

plot(datetime, as.numeric(subplotdata$Voltage), type="l", xlab="datetime", ylab="Voltage")

plot(datetime, as.numeric(subplotdata$Sub_metering_1), type="l", ylab="Energy Submetering", xlab="")
lines(datetime, as.numeric(subplotdata$Sub_metering_2), type="l", col="red")
lines(datetime, as.numeric(subplotdata$Sub_metering_3), type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))

plot(datetime, as.numeric(subplotdata$Global_reactive_power), type = "l", xlab = "datetime", ylab="Global_reactive_Power")

dev.off()

