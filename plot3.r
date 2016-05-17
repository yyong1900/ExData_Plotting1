

require(dplyr)



setwd("C:/Users/yyong/Desktop/Coursera/courseproject1")

data1 = read.table("household_power_consumption.txt", sep=";", header=TRUE)  # read text file 

data1$Time<-strptime(paste(data1$Date, data1$Time, sep=" "), format="%d/%m/%Y %H:%M:%OS")  
data1$Date<-as.Date(data1$Date, "%d/%m/%Y")


data2<-data1[data1$Date >= as.Date("2007-02-01") & data1$Date <= as.Date("2007-02-02"), ]


data2[as.character(data2$Global_active_power)=="?",]$Global_active_power<-"0"
data2[as.character(data2$Global_reactive_power)=="?",]$Global_reactive_power<-"0"
data2[as.character(data2$Voltage)=="?",]$Voltage<-"0"
data2[as.character(data2$Global_intensity)=="?",]$Global_intensity<-"0"
data2[as.character(data2$Sub_metering_1)=="?",]$Sub_metering_1<-"0"
data2[as.character(data2$Sub_metering_2)=="?",]$Sub_metering_2<-"0"
data2[as.character(data2$Sub_metering_3)=="?",]$Sub_metering_3<-"0"

data2$Global_active_power<-as.numeric(as.character(data2$Global_active_power))
data2$Global_reactive_power<-as.numeric(as.character(data2$Global_reactive_power))
data2$Voltage<-as.numeric(as.character(data2$Voltage))
data2$Global_intensity<-as.numeric(as.character(data2$Global_intensity))
data2$Sub_metering_1<-as.numeric(as.character(data2$Sub_metering_1))
data2$Sub_metering_2<-as.numeric(as.character(data2$Sub_metering_2))
data2$Sub_metering_3<-as.numeric(as.character(data2$Sub_metering_3))


 #plot 3
plot(data2$Time, data2$Sub_metering_1, type="l", ylab="Energy Sub metering", xlab="")
lines(data2$Sub_metering_2, type="l")
lines(data2$Time, data2$Sub_metering_2, type="l", col="red")
lines(data2$Time, data2$Sub_metering_3, type="l", col="blue")

  legend("topright", lty= c(1,1), col=c("black", "red", "blue"), legend=c("sub_metering_1","sub_metering_2","sub_metering_3"))
dev.copy(png,'plot3.png')					
 dev.off()
 