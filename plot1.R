createPlot1 <- function (data) {
    data <- subset(data, Date == "1/2/2007" | Date == "2/2/2007")
    data <- data$Global_active_power
    data <- as.numeric(as.character(data))
    hist(data, col = "RED", xlab = "Global Active Power(kilowatts)")
}
temp <- tempfile()
download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip",temp)
data <- read.table(unz(temp, "household_power_consumption.txt"), sep = ";", header = TRUE)
createPlot1(data)
unlink(temp)