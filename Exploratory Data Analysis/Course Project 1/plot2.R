data <- read.table("./household_power_consumption.txt", header = TRUE, sep = ";", stringsAsFactors = FALSE)
data[, 1] <- as.Date(data[, 1], format = "%d/%m/%Y")
req_data <- data[data$Date >= as.Date("2007-02-01", format = "%Y-%m-%d") & data$Date <=as.Date("2007-02-02", format = "%Y-%m-%d"), ]
req_data[ , 3:9] <- as.numeric(unlist(req_data[ , 3:9]))
req_data$Time <- strptime(paste(req_data$Date, req_data$Time, sep=" "), "%Y-%m-%d %H:%M:%S")
plot(req_data$Time, req_data$Global_active_power, type = "l", ylab = "Global Active Power (kilowatts)", xlab = "")
dev.copy(png, file="plot2.png")
dev.off()
