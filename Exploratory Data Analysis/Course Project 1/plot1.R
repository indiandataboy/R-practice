data <- read.table("./household_power_consumption.txt", header = TRUE, sep = ";", stringsAsFactors = FALSE)
data[, 1] <- as.Date(data[, 1], format = "%d/%m/%Y")
req_data <- data[data$Date >= as.Date("2007-02-01", format = "%Y-%m-%d") & data$Date <=as.Date("2007-02-02", format = "%Y-%m-%d"), ]
req_data[ , 3:9] <- as.numeric(unlist(req_data[ , 3:9]))
req_data <- req_data[complete.cases(req_data), ]
hist(req_data$Global_active_power, col = "red", xlab="Global Active Power (kilowatts)", main="Global Active Power")
dev.copy(png, file="plot1.png")
dev.off()


