## This assignment uses data from the UC Irvine Machine Learning Repo,
## a popular repository for machine learning datasets. I'll use the 
## “Individual household electric power consumption Data Set” 
## from the dates 2007-02-01 and 2007-02-02 (that is between the rows:
## 66638 and (66638+2880))

my_table <- read.table("household_power_consumption.txt", sep = ";", 
                       nrows = 2880, skip = 66637, na.strings = c("?"), 
                       col.names = c("Date", "Time", "Global_Active_Power", 
                                     "Global_Reactive_Power", "Voltage", 
                                     "Global intensity", "Sub_metering_1", 
                                     "Sub_metering_2", "Sub_metering_3"))

## Four plots in a canvas - x = Time of the day
## Plot I:  y = Global Active Power (Same as plot2)
## Plot II: y = Energy sub metering for three data sets (Sub metering 1, 2 and 3) (Same as plot 3)
## Plot III: y = Voltage
## Plot IV: y = Global Reactive Power 

## plot on a png file device
png(filename = "plot4.png", width = 480, height = 480)

library(datasets)

par(mfcol = c(2, 2))

x <- c(1:2880)

## Plot I

plot(x, my_table$Global_Active_Power, type ="l", xlab = "",
     ylab ="Global Active Power", xaxt = "n")

x_ticks <- c(1, 2880, by = "1440")

axis(1, at=x_ticks, labels = c("Thu",  "Sat", "Fri"))


## Plot II

plot(x, my_table$Sub_metering_1, 
     ylim = range(c(my_table$Sub_metering_1, my_table$Sub_metering_2, 
                    my_table$Sub_metering_3)), type ="l", xlab = "",
     ylab ="Energy sub metering", xaxt = "n")
lines(x, my_table$Sub_metering_2, col = "red")
lines(x, my_table$Sub_metering_3, col = "blue")

legend("topright", lty = 1, legend=c("Sub_metering_1", "Sub_metering_2", 
        "Sub_metering_3"), col=c("black", "red", "blue"),
        bty = 'n')

x_ticks <- c(1, 2880, by = "1440")

axis(1, at=x_ticks, labels = c("Thu",  "Sat", "Fri"))


## Plot III

plot(x, my_table$Voltage, type ="l", xlab = "datetime",
     ylab ="Voltage", xaxt = "n")

x_ticks <- c(1, 2880, by = "1440")

axis(1, at=x_ticks, labels = c("Thu",  "Sat", "Fri"))


## Plot IV

plot(x, my_table$Global_Reactive_Power, type ="l", xlab = "datetime",
     ylab ="Global_Reactive_Power", xaxt = "n")

x_ticks <- c(1, 2880, by = "1440")

axis(1, at=x_ticks, labels = c("Thu",  "Sat", "Fri"))


dev.off()