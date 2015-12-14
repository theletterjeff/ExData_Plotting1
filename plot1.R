data <- read.table("household_power_consumption.txt", sep = ";", skip = 66637, nrows = 2879, 
                   na.strings = "?")
colnames(data) <- c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", 
                    "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")
hist(data$Global_active_power, col = "red", main = "Global Active Power", 
     xlab = "Global Active Power (kilowatts")