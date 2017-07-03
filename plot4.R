## 2017.07.02
## Coursera_DataScienceSpecializationSeriers/Coursera_ExploratoryDataAnalysis
## Course_Project_1
## Plot4.R

## set working directory
setwd("C:/Users/liujb/Desktop/Coursera_DataScienceSpecializationSeriers/Coursera_ExploratoryDataAnalysis")

## read data
data0 = read.table("household_power_consumption.txt",header=TRUE,sep=";")

## subesting the data for 2007-02-01 and 2007-02-02
data = subset(data0,Date =="1/2/2007"| Date =="2/2/2007")

data$Date3 = paste(as.character(data$Date),as.character(data$Time),sep=" ")
data$Date4 = strptime(data$Date3,format='%d/%m/%Y %H:%M:%S')

df = t(as.data.frame(strsplit(as.character(data$Date4),' ')))
colnames(df) = c("Date5","Time2")
data2 = cbind(data,df)

## Plot4.R -- multiple panels
png("plot4.png",width=480,height=480,units='px')
par(mfrow=c(2,2))

plot(data2$Date4,as.numeric(as.character(data2$Global_active_power)),type="l",xlab="",ylab="Global Active Power")

plot(data2$Date4,as.numeric(paste(data2$Voltage)),type="l",xla="datetime",ylab="Voltage")

plot(data2$Date4,data2$Sub_metering_1,type="n",xlab="",ylab="",ylim=c(0,max(as.numeric(paste(data2$Sub_metering_1)))))
lines(data2$Date4,as.numeric(paste(data2$Sub_metering_1)),col="black")
lines(data2$Date4,as.numeric(paste(data2$Sub_metering_2)),col="red")
lines(data2$Date4,data2$Sub_metering_3,col="blue")
legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col=c("black","red","blue"),lty=c(1,1,1),bty="n",cex=0.65)
title(ylab="Energy sub metering",xlab="")

plot(data2$Date4,as.numeric(paste(data2$Global_reactive_power)),type="l",cex.axis=0.8,xla="datetime",ylab="Global_reactive_power")

dev.off()