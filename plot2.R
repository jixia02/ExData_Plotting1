## 2017.07.02
## Coursera_DataScienceSpecializationSeriers/Coursera_ExploratoryDataAnalysis
## Course_Project_1
## Plot2.R

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

## plot2.R -- plot with lines
png("plot2.png",width=480,height=480,units='px')
plot(data2$Date4,as.numeric(as.character(data2$Global_active_power)),type="l",xlab="",ylab="Global Active Power (kilowatts)")
dev.off()