## Data Science Specialization, Johns Hopkins University
## Exploratory Data Analysis - Course Project 1 - Plot 4
## Written by Gildardo Rojas Nandayapa
## -----------------------------------------------------
## Dowloads and unzips file to working directory
myURL<-"https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(myURL,"hpc.zip",quiet=FALSE,cacheOK = TRUE)
filetounzip<-paste(getwd(),'/hpc.zip',sep="")
unzip(filetounzip)
## Creates Plot 4
ds <- read.csv("household_power_consumption.txt",sep=";")
ds2<-ds[ds$Date=="1/2/2007" | ds$Date=="2/2/2007",]
ds2$dt<-strptime(paste(ds2$Date,ds2$Time),format="%d/%m/%Y %H:%M:%S")
par(mfcol=c(2,2))
par(mar=c(4.5,4,4,2))
Sys.setlocale("LC_TIME", "C")
plot(ds2$dt,as.numeric(ds2$Global_active_power)/500,type="l",cex.lab=.7,
     cex.axis=.8,cex.main=.9,ylab="Global Active Power(kilowatts)",xlab="")
plot(ds2$dt,as.numeric(ds2$Sub_metering_1),type="n",ylim=c(-1,38),
     ylab="Energy Sub metering",xlab="",cex.lab=.7,cex.axis=.8)
points(ds2$dt,as.numeric(as.character(ds2$Sub_metering_1)),type="l")
points(ds2$dt,as.numeric(as.character(ds2$Sub_metering_2)),type="l",col="red")
points(ds2$dt,as.numeric(as.character(ds2$Sub_metering_3)),type="l",col="blue")
legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),  
       lty=c(1,1,1),lwd=c(2.5,2.5,2.5),col=c("black","red","blue"),cex=0.6)
plot(ds2$dt,as.numeric(as.character(ds2$Voltage)),type="l",cex.lab=.7,
     cex.axis=.8,cex.main=.9,ylab="Voltage",xlab="datetime")
plot(ds2$dt,as.numeric(as.character(ds2$Global_reactive_power)),type="l",
     cex.lab=.7,cex.axis=.8,cex.main=.9,ylab="Global_Reactive_Power",
     xlab="datetime")
dev.copy(png,file="plot4.png")
dev.off()

