## I use the data from the UC Irvine Machine Learning Repo,
## a repository for machine learning datasets. I'll use the 
## “Individual household electric power consumption Data Set” 
## from the dates 2007-02-01 and 2007-02-02 (that is between the rows:
## 66638 and (66638+2880))

## Three sets of data in one plot. X axis = time of the day
## Y axis:
## 1) energy sub-metering No. 1 (in watt-hour of active energy) 
## It corresponds to the kitchen, containing mainly a dishwasher, an oven and a microwave (hot plates are not electric but gas powered).
## 2) energy sub-metering No. 2 
## It corresponds to the laundry room, containing a washing-machine, a tumble-drier, a refrigerator and a light. 
## 3) energy sub-metering No. 3 
## It corresponds to an electric water-heater and an air-conditioner.


my_table <- read.table("household_power_consumption.txt", sep = ";", 
                       nrows = 2880, skip = 66637, na.strings = c("?"), 
                       col.names = c("Date", "Time", "Global_Active_Power", 
                                     "Global_Reactive_Power", "Voltage", 
                                     "Global intensity", "Sub_metering_1", 
                                     "Sub_metering_2", "Sub_metering_3"))

## plot on a png file device
png(filename = "plot3.png", width = 480, height = 480)

library(datasets)

## x axis: 
## I create a vector, time, with the date and time of day stored as time objects

time <- strptime(paste(my_table$Date, my_table$Time), 
                 format = "%d/%m/%Y %H:%M:%S")

plot(time, my_table$Sub_metering_1, 
     ylim = range(c(my_table$Sub_metering_1, my_table$Sub_metering_2, 
                    my_table$Sub_metering_3)), type ="l", xlab = "",
     ylab ="Energy sub metering")
lines(time, my_table$Sub_metering_2, col = "red")
lines(time, my_table$Sub_metering_3, col = "blue")

legend("topright", lty = 1, legend=c("Sub_metering_1", "Sub_metering_2", 
                    "Sub_metering_3"), col=c("black", "red", "blue"))


dev.off()