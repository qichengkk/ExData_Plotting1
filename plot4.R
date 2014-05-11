file <- read.csv("./household_power_consumption.txt", sep = ";", header = FALSE, 
                 skip = 66637, nrows = 2880, na.strings = "?", 
                 col.names=colnames(read.csv("./household_power_consumption.txt", 
                                             sep = ";", header = TRUE, nrows = 1)))
file$datetime <- strptime(paste(file$Date, file$Time), format="%d/%m/%Y %H:%M:%S")
par(mfrow = c(2, 2))
plot(file$datetime, file$Global_active_power, type = "l", xlab = "", 
     ylab = "Global Active Power")
plot(file$datetime, file$Voltage, type = "l", xlab = "datetime", 
     ylab = "Voltage")

plot(file$datetime, file$Sub_metering_1, type = "n", xlab = "", 
     ylab = "Energy sub metering")
lines(file$datetime, file$Sub_metering_1)
lines(file$datetime, file$Sub_metering_2, col = "red")
lines(file$datetime, file$Sub_metering_3, col = "blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       lty = 1, col = c("black", "red", "blue"), cex = 0.6)

plot(file$datetime, file$Global_reactive_power, type = "l", xlab = "datetime", 
     ylab = "Global_reactive_power")
dev.copy(png, file = "plot4.png", width = 480, height = 480)
dev.off()