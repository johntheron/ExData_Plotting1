raw <- read.csv2("household_power_consumption.txt")
rawdate <- subset(raw, raw$Date == "1/2/2007" | raw$Date == "2/2/2007")
rawdate$Date <- with(rawdate, as.POSIXct(paste(Date, Time), format="%d/%m/%Y %H:%M:%S"))
rawdate$Global_active_power <- as.numeric(levels(rawdate$Global_active_power))[rawdate$Global_active_power]
rawdate$Global_reactive_power <- as.numeric(levels(rawdate$Global_reactive_power))[rawdate$Global_reactive_power]
rawdate$Voltage <- as.numeric(levels(rawdate$Voltage))[rawdate$Voltage]
rawdate$Sub_metering_1 <- as.numeric(levels(rawdate$Sub_metering_1))[rawdate$Sub_metering_1]
rawdate$Sub_metering_2 <- as.numeric(levels(rawdate$Sub_metering_2))[rawdate$Sub_metering_2]
rawdate$Sub_metering_3 <- as.numeric(levels(rawdate$Sub_metering_3))[rawdate$Sub_metering_3]
png(filename = "plot4.png")
par(mfrow=c(2,2))
plot(rawdate$Date,rawdate$Global_active_power, type = "l", ylab = "Global Active Power (kilowatts)")
plot(rawdate$Date,rawdate$Voltage, type = "l", xlab = "datetime", ylab = "Voltage")
plot(rawdate$Date,rawdate$Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering")
lines(rawdate$Date, rawdate$Sub_metering_2, type = "l", col = "red")
lines(rawdate$Date, rawdate$Sub_metering_3, type = "l", col = "blue")
legend("topright" , legend = names(rawdate)[7:9], lty=1,col=c("black", "red", "blue"))
plot(rawdate$Date,rawdate$Global_reactive_power, type = "l", xlab = "datetime", 
     ylab = "Global_reactive_power")
dev.off()


