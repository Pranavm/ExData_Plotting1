createPlot4a <- function (data) {
    data <- subset(data, Date == "1/2/2007" | Date == "2/2/2007")
    y <- data$Global_active_power
    y <- as.numeric(as.character(y))
    x <- as.POSIXct(paste(as.Date(data$Date, "%d/%m/%Y"), data$Time),
                    "%d/%m/%Y hh:mm:ss")
    plot(x, y, type = "l", xlab = "", ylab = "Global Active Power")
}

createPlot4b <- function (data) {
    data <- subset(data, Date == "1/2/2007" | Date == "2/2/2007")
    y1 <- data$Sub_metering_1
    y1 <- as.numeric(as.character(y1))
    y2 <- data$Sub_metering_2
    y2 <- as.numeric(as.character(y2))
    y3 <- data$Sub_metering_3
    y3 <- as.numeric(as.character(y3))
    x <- as.POSIXct(paste(as.Date(data$Date, "%d/%m/%Y"), data$Time),
                    "%d/%m/%Y hh:mm:ss")
    plot(x, y1, type = "l", xlab = "", ylab = "Energy Sub Metering")
    lines(x, y2, col = "RED")
    lines(x, y3, col = "BLUE")
    legend("topright", 
           legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
           lty = c(1, 1, 1), lwd = c(1, 1, 1),
           col = c("BLACK", "RED", "BLUE"), bty = "n",
           pt.cex = 1, cex = 0.8)
}

createPlot4c <- function(data) {
    data <- subset(data, Date == "1/2/2007" | Date == "2/2/2007")
    y <- data$Voltage
    y <- as.numeric(as.character(y))
    x <- as.POSIXct(paste(as.Date(data$Date, "%d/%m/%Y"), data$Time),
                    "%d/%m/%Y hh:mm:ss")
    plot(x, y, type = "l", xlab = "datetime", ylab = "Global Active Power")   
}

createPlot4d <- function(data) {
    data <- subset(data, Date == "1/2/2007" | Date == "2/2/2007")
    y <- data$Global_reactive_power
    y <- as.numeric(as.character(y))
    x <- as.POSIXct(paste(as.Date(data$Date, "%d/%m/%Y"), data$Time),
                    "%d/%m/%Y hh:mm:ss")
    plot(x, y, type = "l", xlab = "datetime", ylab = "Global Active Power")   
}

temp <- tempfile()
download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip",temp)
data <- read.table(unz(temp, "household_power_consumption.txt"), sep = ";", header = TRUE)
par(mfcol = c(2, 2))
par(cex.axes = 2)
createPlot4a(data)
createPlot4b(data)
createPlot4c(data)
createPlot4d(data)
unlink(temp)