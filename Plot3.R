#Plot3.R
setwd("~/R Material/Coursera/Course 4 Exploratory Data Analysis/Week 1/Project 1/exdata_data_household_power_consumption")
library(dplyr)

Plot3 <- function(Dataset){
  with(Dataset, plot(TimeStamp, Sub_metering_1, type = "l",
                     xlab = "", ylab = "Energy sub metering"))
  with(Dataset, lines(TimeStamp, Sub_metering_2, col = "red"))
  with(Dataset, lines(TimeStamp, Sub_metering_3, col = "blue"))
  
  legend("topright", lty = 1, col = c("black", "red", "blue"),
         legend = c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"))
}

#Read in the data (Should find a better way to import)
ConsumpFile <- read.csv("household_power_consumption.txt", header = TRUE, sep = ";",
                        stringsAsFactors = FALSE , na.strings = "?", 
                        colClasses = c("character","character",rep("numeric", 7)))

ConsumpFile$Date <- as.Date(strptime(ConsumpFile$Date, format = "%d/%m/%Y"))

#Subset dataset by date interval: 2007-02-01 -- 2007-02-02
FilterbyDate <- filter(ConsumpFile, Date == "2007-02-01" | Date == "2007-02-02") %>% 
  mutate(TimeStamp = as.POSIXct(paste(Date,Time),format ="%Y-%m-%d %H:%M:%S" ))

Graph3 <- Plot3(FilterbyDate)