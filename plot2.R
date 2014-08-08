## This assignment uses data from the UC Irvine Machine Learning Repo,
## a popular repository for machine learning datasets. I'll use the 
## “Individual household electric power consumption Data Set” 
## from the dates 2007-02-01 and 2007-02-02 (that is between the rows:
## 66638 and (66638+2880))

## Plot the Global Active Power in dep. of the time of the day

my_table <- read.table("household_power_consumption.txt", sep = ";", 
                       nrows = 2880, skip = 66637, na.strings = c("?"), 
                       col.names = c("Date", "Time", "Global_Active_Power", 
                                     "Global_Reactive_Power", "Voltage", 
                                     "Global intensity", "Sub_metering_1", 
                                     "Sub_metering_2", "Sub_metering_3"))
# date <- as.Date(my_table$Date)
# time <- strptime(my_table$Time, format = "%H:%M:%S")


## plot on a png file device
png(filename = "plot2.png", width = 480, height = 480)

library(datasets)
x <- c(1:2880)

plot(x, my_table$Global_Active_Power, type ="l", xlab = "",
     ylab ="Global Active Power (kilowatts)", xaxt = "n")
x_ticks <- c(1, 2880, by = "1440")
axis(1, at=x_ticks, labels = c("Thu",  "Sat", "Fri"))

dev.off()
