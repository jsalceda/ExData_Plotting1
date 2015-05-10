## Exploratory Analysis Course Project 1
## Filename: plot1.R
## Author: jesus.salceda@gmail.com
## Date: May 2015
## Comment: Code to read Individual household electric power consumption Data Set
##          and to create plot1.png file.

## Set Working Directory
setwd("~/Coursera/Exploratory Data Analysis/Week1 - PA1")
getwd()

## Function to Getting and cleaning Data

getPowerData <- function(){
  ## Set Source Filename to load
  SrcFilename <- "household_power_consumption.txt"
  
  ## Load table with data from file
  dp <- read.table(SrcFilename, header = TRUE, sep = ";", na.strings = "?")
  
  ## Subsetting 2007-02-01 and 2007-02-02 data
  dp <- dp[(dp$Date=="1/2/2007") | (dp$Date=="2/2/2007"),]
  
  ## Convert Date and Time variables to Date/Time classes in R 
  dp$DateTime <- strptime(paste(dp$Date, dp$Time), "%d/%m/%Y %H:%M:%S")
  dp$Date <- as.Date(dp$Date)
  
  return(dp)
}

powerdata <- getPowerData()

## Create histogram for Global_active_power
hist(powerdata$Global_active_power, main = paste("Global Active Power"), col="red", xlab="Global Active Power (kilowatts)")

## Copy plot to PNG file with a width of 480 pixels and a height of 480 pixelx
dev.copy(png, file="plot1.png", width=480, height=480)
## Close graphics Device
dev.off()


