raw <- read.csv2("household_power_consumption.txt")
rawdate <- subset(raw, raw$Date == "1/2/2007" | raw$Date == "2/2/2007")
rawdate$Date <- with(rawdate, as.POSIXct(paste(Date, Time), format="%d/%m/%Y %H:%M:%S"))
rawdate$Global_active_power <- as.numeric(levels(rawdate$Global_active_power))[rawdate$Global_active_power]
png(filename = "plot1.png")
hist(rawdate$Global_active_power, main = "Global Active Power", 
     xlab = "Global Active Power (kilowatts)", col = "red", ylim = c(0,1200))
dev.off()


