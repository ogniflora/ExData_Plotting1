## This assignment uses data from the UC Irvine Machine Learning Repo,
## a popular repository for machine learning datasets. I'll use the 
## “Individual household electric power consumption Data Set” 
## from the dates 2007-02-01 and 2007-02-02

## Hist Global Active Power

my_table <- read.table("household_power_consumption.txt", sep = ";", 
                       nrows = 2880, skip = 66637, na.strings = c("?"), 
                       col.names = c("Date", "Time", "Global_Active_Power", 
                                     "Global_Reactive_Power", "Voltage", 
                                     "Global intensity", "Sub_metering_1", 
                                     "Sub_metering_2", "Sub_metering_3"))
library(datasets)

## plot on a png file device
png(filename = "plot1.png", width = 480, height = 480)

hist(my_table$Global_Active_Power, col = "red", 
     xlab = "Global Active Power (kilowatts)",
     main = "Global Active Power", 
     yaxt="n")
y_ticks <- seq(0, 1200, by=200)  
axis(2, at=y_ticks)

dev.off()