file <- read.csv("./household_power_consumption.txt", sep = ";", header = FALSE, 
                 skip = 66637, nrows = 2880, na.strings = "?", 
                 col.names=colnames(read.csv("./household_power_consumption.txt", 
                                      sep = ";", header = TRUE, nrows = 1)))
hist(file$Global_active_power, xlab = "Global Active Power (kilowatts)", 
     col = "red", main = "Global Active Power")
dev.copy(png, file = "plot1.png", width = 480, height = 480)
dev.off()