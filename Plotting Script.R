#Coursera Exploratory Analysis Project 1
#Plotting System Script
setwd("~/R Material/Coursera/Course 4 Exploratory Data Analysis/Week 1/Project 1/exdata_data_household_power_consumption")
library(dplyr)


#Read in the data (Should find a better way to import)
ConsumpFile <- read.csv("household_power_consumption.txt", header = TRUE, sep = ";",
                     stringsAsFactors = FALSE , na.strings = "?", 
                     colClasses = c("character","character",rep("numeric", 7)))

ConsumpFile$Date <- as.Date(strptime(ConsumpFile$Date, format = "%d/%m/%Y"))

#Subset dataset by date interval: 2007-02-01 -- 2007-02-02
FilterbyDate <- filter(ConsumpFile, Date == "2007-02-01" | Date == "2007-02-02")

Plot1 <- function(Dataset ){
  par(mfrow = c(1,1), mar = c(4,4,3,3))
  with(Dataset, hist(Global_active_power, freq = TRUE, 
                     col = "red", main = "Global Active Power",
                     xlab = "Global Active Power (kilowatts)", ylim = c(0,1200) ))
}

Graph1 <- Plot1(FilterbyDate)