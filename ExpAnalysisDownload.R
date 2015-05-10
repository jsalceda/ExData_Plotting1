## Exploratory Analysis Course Project 1
## Filename: ExpAnalysisDownload.R
## Author: jesus.salceda@gmail.com
## Date: May 2015
## Comment: Script to download and uncompress file with 
## "Individual household electric power consumption Data Set"

## Set Working Directory
setwd("~/Coursera/Exploratory Data Analysis/Week1 - PA1")
getwd()

## Set File URL to download, Local Dataset ZIP Filename and Destination Filename
URLFilename <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
DestFilename <- "household_power_consumption.zip"
SrcFilename <- "household_power_consumption.txt"


## Download Dataset Zip File in Working Directory if file does not exist
if (file.exists(DestFilename) == FALSE) {
  download.file(URLFilename, DestFilename, method = "curl")
}

## Unzip Dataset ZIP File if Data Directory does not exist
if (file.exists(SrcFilename) == FALSE) {
  unzip(DestFilename)
}