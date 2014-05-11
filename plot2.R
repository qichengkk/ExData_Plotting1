file <- read.csv("./household_power_consumption.txt", sep = ";", header = FALSE, 
                 skip = 66637, nrows = 2880, na.strings = "?", 
                 col.names=colnames(read.csv("./household_power_consumption.txt", 
                                        sep = ";", header = TRUE, nrows = 1)))
file$datetime <- strptime(paste(file$Date, file$Time), format="%d/%m/%Y %H:%M:%S")
plot(file$datetime, file$Global_active_power, type = "l", xlab = "", 
     ylab = "Global Active Power (kilowatts)")
dev.copy(png, file = "plot2.png", width = 480, height = 480)
dev.off()
