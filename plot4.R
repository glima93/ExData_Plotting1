setwd("C:/Users/Gonçalo/Desktop/R")

# Reading the data
file.loc <- "./data/household_power_consumption.txt"
data <- read.table(file.loc, skip = 66637, nrows = 2880,  sep = ";", na.strings = "?")
varnames <- read.table(file.loc, nrows = 1, sep = ";", header = TRUE)
library(dplyr)
names(data) <- names(varnames)

# Preparing the data
data$Date  <-  as.Date(data$Date, format="%d/%m/%Y")

# Plotting (plot 4)
png(file = "plot4.png", width = 480, height = 480, units = "px")
par(mfrow=c(2,2))
with(data,{
        plot(data$Global_active_power, # Plot in 1st position
             type="l", 
             xaxt="n",
             xlab="",
             ylab="Global Active Power (kilowatts)")
        axis(1,
             at = c(1, as.integer(nrow(data)/2), nrow(data)),
             labels = c("Thu", "Fri", "Sat"))
        
        plot(Voltage, # Plot in 2nd position
             type="l", 
             xaxt="n",
             col = "black",
             xlab="datetime",
             ylab="Voltage")  
        axis(1,
                at = c(1, as.integer(nrow(data)/2), nrow(data)),
                labels = c("Thu", "Fri", "Sat"))
        
        plot(Sub_metering_1, # Plot in 3rd position
             type="l", 
             xaxt="n",
             col = "black",
             xlab="",
             ylab="Energy sub metering")
        lines(Sub_metering_2, col = "red")
        lines(Sub_metering_3, col = "blue")
        axis(1,
             at = c(1, as.integer(nrow(data)/2), nrow(data)),
             labels = c("Thu", "Fri", "Sat"))
        legend("topright",
               lty=1, 
               col=c("black", "red", "blue"), 
               legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
        
        plot(Global_reactive_power, # Plot in the 4th position
             type="l", 
             xaxt="n",
             col = "black",
             xlab="datetime",
             ylab="Global_reactive_power")  
        axis(1,
             at = c(1, as.integer(nrow(data)/2), nrow(data)),
             labels = c("Thu", "Fri", "Sat"))
})
dev.off()