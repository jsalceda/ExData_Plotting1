## Exploratory Analysis Course Project 1
## Filename: plot4.R
## Author: jesus.salceda@gmail.com
## Date: May 2015
## Comment: Code to read Individual household electric power consumption Data Set
##          and to create plot4.png file.

# Set Working Directory
setwd("~/Coursera/Exploratory Data Analysis/Week1 - PA1")
getwd()

## Setting locale Time to English from Spanish
Sys.setlocale(category = "LC_TIME", "en_US.UTF-8")

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

## Open Graphic Device png
png(filename="plot4.png", width=480, height=480, units="px", bg="white")

## Creating layout 2x2 for plots
par(mfrow=c(2,2))

## Figure 1: Plot for Global_active_power
plot(powerdata$DateTime, powerdata$Global_active_power, type = "l", 
     xlab="", ylab="Global Active Power")

## Figure 2: Plot for Voltage
plot(powerdata$DateTime, powerdata$Voltage, type="l",
     xlab="datetime", ylab="Voltage")

## Figure 3: Plot for Sub_metering_1, Sub_metering_2, Sub_metering_3
plot(powerdata$DateTime, powerdata$Sub_metering_1, type = "l", xlab = "", ylab="Energy sub metering")
lines(powerdata$DateTime, powerdata$Sub_metering_2, type = "l", col = "red")
lines(powerdata$DateTime, powerdata$Sub_metering_3, type = "l", col = "blue")
## Added legends to plot
legend("topright",c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"),
       lty=c(1,1,1),lwd=c(1,1,1), bty="n", 
       col=c("black","blue","red"))

## Figure 4:
plot(powerdata$DateTime, powerdata$Global_reactive_power, type = "l", 
     xlab="datetime", ylab="Global_reactive_power")

## Close graphics Device
dev.off()
