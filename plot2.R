## I use the data from the UC Irvine Machine Learning Repo,
## a repository for machine learning datasets. I'll use the 
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

## x axis: 
## I create a vector, time, with the date and time of day stored as time objects

time <- strptime(paste(my_table$Date, my_table$Time), 
                 format = "%d/%m/%Y %H:%M:%S")

## plot on a png file device
png(filename = "plot2.png", width = 480, height = 480)

library(datasets)

plot(time, my_table$Global_Active_Power, type ="l", xlab = "",
     ylab ="Global Active Power (kilowatts)")

dev.off()
