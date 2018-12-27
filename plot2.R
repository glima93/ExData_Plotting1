setwd("C:/Users/Gonçalo/Desktop/R")

# Reading the data
file.loc <- "./data/household_power_consumption.txt"
data <- read.table(file.loc, skip = 66637, nrows = 2880,  sep = ";", na.strings = "?")
varnames <- read.table(file.loc, nrows = 1, sep = ";", header = TRUE)
library(dplyr)
names(data) <- names(varnames)

# Preparing the data
data$Date  <-  as.Date(data$Date, format="%d/%m/%Y")

# Plotting (plot 2)
png(file = "plot2.png", width = 480, height = 480, units = "px")
plot(data$Global_active_power,
     type="l", 
     xaxt="n",
     xlab="",
     ylab="Global Active Power (kilowatts)")
axis(1,
     at = c(1, as.integer(nrow(data)/2), nrow(data)),
     labels = c("Thu", "Fri", "Sat"))
dev.off()