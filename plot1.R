## Data Science Specialization, Johns Hopkins University
## Exploratory Data Analysis - Course Project 1 - Plot 1
## Written by Gildardo Rojas Nandayapa
## -----------------------------------------------------
## Dowloads and unzips file to working directory
myURL<-"https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(myURL,"hpc.zip",quiet=FALSE,cacheOK = TRUE)
filetounzip<-paste(getwd(),'/hpc.zip',sep="")
unzip(filetounzip)
## Creates Plot 1
ds <- read.csv("household_power_consumption.txt",sep=";")
ds2<-ds[ds$Date=="1/2/2007" | ds$Date=="2/2/2007",]
hist(as.numeric(ds2$Global_active_power)/500,col="red",cex.lab=.8,cex.axis=.8,
     cex.main=.9,main="Global Active Power",
     xlab="Global Active Power (kilowatts)")
dev.copy(png,file="plot1.png")
dev.off()

