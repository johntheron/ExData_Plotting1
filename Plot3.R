raw <- read.csv2("household_power_consumption.txt")
rawdate <- subset(raw, raw$Date == "1/2/2007" | raw$Date == "2/2/2007")
rawdate$Date <- with(rawdate, as.POSIXct(paste(Date, Time), format="%d/%m/%Y %H:%M:%S"))
rawdate$Sub_metering_1 <- as.numeric(levels(rawdate$Sub_metering_1))[rawdate$Sub_metering_1]
rawdate$Sub_metering_2 <- as.numeric(levels(rawdate$Sub_metering_2))[rawdate$Sub_metering_2]
rawdate$Sub_metering_3 <- as.numeric(levels(rawdate$Sub_metering_3))[rawdate$Sub_metering_3]
png(filename = "plot3.png")
plot(rawdate$Date,rawdate$Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering")
lines(rawdate$Date, rawdate$Sub_metering_2, type = "l", col = "red")
lines(rawdate$Date, rawdate$Sub_metering_3, type = "l", col = "blue")
legend("topright" , legend = names(rawdate)[7:9], lty=1, 
       col=c("black", "red", "blue"))
dev.off()


