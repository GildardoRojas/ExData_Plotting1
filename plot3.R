## Data Science Specialization, Johns Hopkins University
## Exploratory Data Analysis - Course Project 1 - Plot 3
## Written by Gildardo Rojas Nandayapa
## -----------------------------------------------------
## Dowloads and unzips file to working directory
myURL<-"https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(myURL,"hpc.zip",quiet=FALSE,cacheOK = TRUE)
filetounzip<-paste(getwd(),'/hpc.zip',sep="")
unzip(filetounzip)
## Creates Plot 3
ds <- read.csv("household_power_consumption.txt",sep=";")
ds2<-ds[ds$Date=="1/2/2007" | ds$Date=="2/2/2007",]
ds2$dt<-strptime(paste(ds2$Date,ds2$Time),format="%d/%m/%Y %H:%M:%S")
Sys.setlocale("LC_TIME", "C")
plot(ds2$dt,as.numeric(ds2$Sub_metering_1),type="n",ylim=c(-1,38),
     ylab="Energy sub metering",xlab="",cex.lab=.8,cex.axis=.8)
points(ds2$dt,as.numeric(as.character(ds2$Sub_metering_1)),type="l")
points(ds2$dt,as.numeric(as.character(ds2$Sub_metering_2)),type="l",col="red")
points(ds2$dt,as.numeric(as.character(ds2$Sub_metering_3)),type="l",col="blue")
legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),  
       lty=c(1,1,1),lwd=c(2.5,2.5,2.5),col=c("black","red","blue"),cex=0.6)
dev.copy(png,file="plot3.png")
dev.off()

