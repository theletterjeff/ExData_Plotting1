data <- read.table("household_power_consumption.txt", sep = ";", skip = 66637, nrows = 2879, 
                   na.strings = "?")
colnames(data) <- c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", 
                    "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")
data$Time <- paste(data$Date, data$Time)
data$Time <- strptime(data$Time, format = "%Y-%m-%d %H:%M:%S")
png(filename = "plot3.png")
plot(data$Time, data$Sub_metering_1, type = "n", xlab = "", ylab = "Energy sub metering")
points(data$Time, data$Sub_metering_1, type = "l", col = "black")
points(data$Time, data$Sub_metering_2, type = "l", col = "red")
points(data$Time, data$Sub_metering_3, type = "l", col = "blue")
legend("topright", pch = "-", col = c("black", "red", "blue"), legend = 
               c("Sub_metering_1", "Sub_metering_2", "Sub_m"))
dev.off()