

## Selection of text to be read into memory.
text.of.selection <- grep("^[1,2]/2/2007", readLines("./household_power_consumption.txt"), value = TRUE)

## define data frame column names.
column.names <- c("Date", "Time", "Global.active.power", "Global.reactive.power", "Voltage", "Global.intensity", "Sub.metering.1", "Sub.metering.2", "Sub.metering.3")

## acquire target data from selected text and read into memory as data frame.
my.data <- read.table( text = text.of.selection, col.names = column.names, sep = ";", header = TRUE)

## plot histogramme for global active power.
hist(my.data$Global.active.power, main = "Global Active Power",  col = "red", xlab = "Global Active Power (kilowatts)")