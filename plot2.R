## read in full data frame into R memory.
my.data <- read.csv("./household_power_consumption.txt", header = T, sep = ';', 
                      na.strings = "?", nrows = 2075259, check.names = F, 
                      stringsAsFactors = F, comment.char = "", quote = '\"')
my.data$Date <- as.Date(my.data$Date, format = "%d/%m/%Y")

## generate a subset of the data with dates as required.
my.data.subset <- subset(my.data, subset = (Date >= "2007-02-01" & Date <= "2007-02-02"))

## Switch date objects into POSIXct class
date.time <- paste(as.Date(my.data.subset$Date), my.data.subset$Time)
my.data.subset$Date.time <- as.POSIXct(date.time)

## generate plot according to sample
plot(my.data.subset$Global_active_power ~ my.data.subset$Date.time, type = "l",
     ylab = "Global Active Power (kilowatts)", xlab = "")

## important notice:
## For Chinese system, the weekdays are not displayed as in sample pictures.
## If this code is run in an English operation system. The dates should be identical to Roger Peng's example
