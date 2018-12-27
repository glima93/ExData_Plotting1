setwd("C:/Users/Gonçalo/Desktop/R")

# Reading the data
file.loc <- "./data/household_power_consumption.txt"
data <- read.table(file.loc, skip = 66637, nrows = 2880,  sep = ";", na.strings = "?")
varnames <- read.table(file.loc, nrows = 1, sep = ";", header = TRUE)
library(dplyr)
names(data) <- names(varnames)

# Plotting (plot 1)
png(file = "plot1.png", width = 480, height = 480, units = "px")
hist(data$Global_active_power, 
     main = "Global Active Power", 
     col = "red",
     xlab = "Global Active Power (kilowatts)")
dev.off()