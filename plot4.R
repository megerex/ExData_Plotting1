## Switch linguistic system to English as I am using a Chinese windows
Sys.setlocale("LC_ALL", "English")


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

## set up figure frame parametres
par(mfrow = c(2,2), mar = c(5,4,4,2), oma = c(0,0,1,0))

## plot multiple figures
with(my.data.subset, {
  ## plot subfigure 1
  plot(Global_active_power ~ Date.time, type = "l", ylab = "Global Active Power", xlab = "")
  
  ## plot subfigure 2
  plot(Voltage ~ Date.time, type = "l", ylab = "Voltage", xlab = "datetime")
  
  ## plot subfigure 3
  plot(Sub_metering_1 ~ Date.time, type = "l", ylab = "Energy sub metering", xlab = "")
      lines(Sub_metering_2 ~ Date.time, col = 'Red')
      lines(Sub_metering_3 ~ Date.time, col = 'Blue')
      legend("topright", col = c("black", "red", "blue"), 
             lty = 1, lwd = 2, bty = "n", 
             legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
  ## plot subfigure 4
  plot(Global_reactive_power ~ Date.time, type = "l", 
       ylab = "Global_rective_power", xlab = "datetime")
})