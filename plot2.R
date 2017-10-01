createPlot2 <- function (data) {
    data <- subset(data, Date == "1/2/2007" | Date == "2/2/2007")
    y <- data$Global_active_power
    y <- as.numeric(as.character(y))
    x <- as.POSIXct(paste(as.Date(data$Date, "%d/%m/%Y"), data$Time),
                    "%d/%m/%Y hh:mm:ss")
    plot(x, y, type = "l", xlab = "", ylab = "Global Active Power(kilowatts)")
}
temp <- tempfile()
download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip",temp)
data <- read.table(unz(temp, "household_power_consumption.txt"), sep = ";", header = TRUE)
createPlot2(data)
unlink(temp)