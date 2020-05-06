data <- read.table("./household_power_consumption.txt", header = TRUE, sep = ";", stringsAsFactors = FALSE)
data[, 1] <- as.Date(data[, 1], format = "%d/%m/%Y")
req_data <- data[data$Date >= as.Date("2007-02-01", format = "%Y-%m-%d") & data$Date <=as.Date("2007-02-02", format = "%Y-%m-%d"), ]
req_data[ , 3:9] <- as.numeric(unlist(req_data[ , 3:9]))
req_data$Time <- strptime(paste(req_data$Date, req_data$Time, sep=" "), "%Y-%m-%d %H:%M:%S")
png("plot3.png")
plot(req_data$Time, req_data$Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering")
with(req_data, {lines(Time, Sub_metering_2, col = "red")
                lines(Time, Sub_metering_3, col = "blue")})
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black", "red", "blue"), lwd = 1, lty = )

dev.off()
