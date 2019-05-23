#Plot2.R

setwd("~/R Material/Coursera/Course 4 Exploratory Data Analysis/Week 1/Project 1/exdata_data_household_power_consumption")
library(dplyr)

Plot2 <- function(Dataset){
  
  with(Dataset,plot(TimeStamp, Global_active_power, type = "l",
                    ylab = "Global Active Power (kilowatts)", xlab = ""))
  
}


#Read in the data (Should find a better way to import)
ConsumpFile <- read.csv("household_power_consumption.txt", header = TRUE, sep = ";",
                        stringsAsFactors = FALSE , na.strings = "?", 
                        colClasses = c("character","character",rep("numeric", 7)))

ConsumpFile$Date <- as.Date(strptime(ConsumpFile$Date, format = "%d/%m/%Y"))

#Subset dataset by date interval: 2007-02-01 -- 2007-02-02
FilterbyDate <- filter(ConsumpFile, Date == "2007-02-01" | Date == "2007-02-02") %>% 
  mutate(TimeStamp = as.POSIXct(paste(Date,Time),format ="%Y-%m-%d %H:%M:%S" ))

Graph2 <- Plot2(FilterbyDate)