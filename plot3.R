setwd("C:/Users/Gonçalo/Desktop/R")

# Reading the data
file.loc <- "./data/household_power_consumption.txt"
data <- read.table(file.loc, skip = 66637, nrows = 2880,  sep = ";", na.strings = "?")
varnames <- read.table(file.loc, nrows = 1, sep = ";", header = TRUE)
library(dplyr)
names(data) <- names(varnames)

# Preparing the data
data$Date  <-  as.Date(data$Date, format="%d/%m/%Y")

# Plotting (plot 3)
png(file = "plot3.png", width = 480, height = 480, units = "px")
with(data,{
        plot(Sub_metering_1,
             type="l", 
             xaxt="n",
             col = "black",
             xlab="",
             ylab="Energy sub metering")
        lines(Sub_metering_2, col = "red")
        lines(Sub_metering_3, col = "blue")
})
axis(1,
     at = c(1, as.integer(nrow(data)/2), nrow(data)),
     labels = c("Thu", "Fri", "Sat"))
legend("topright",
       lty=1, 
       col=c("black", "red", "blue"), 
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()