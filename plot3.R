createPlot3 <- function (data) {
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
           col = c("BLACK", "RED", "BLUE"))
}

temp <- tempfile()
download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip",temp)
data <- read.table(unz(temp, "household_power_consumption.txt"), sep = ";", header = TRUE)
createPlot3(data)
unlink(temp)