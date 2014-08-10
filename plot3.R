#Import Data
setClass('myDate')
setAs("character","myDate", function(from) as.Date(from, format="%d/%m/%Y") )

classes<-c("myDate","factor","numeric","numeric","numeric","numeric","numeric","numeric","numeric")
data<-read.table("household_power_consumption.txt",header=TRUE,colClasses=classes,sep=";",na.strings="?")

#Subset and add date time
graphdata<-data[data$Date>="2007-02-01"& data$Date<="2007-02-02",]
datetime <- paste(as.Date(graphdata$Date), graphdata$Time)
graphdata$Datetime <- as.POSIXct(datetime)


## Plot 3
with(graphdata, {
  plot(Sub_metering_1~Datetime, type="l",
       ylab="Global Active Power (kilowatts)", xlab="")
  lines(Sub_metering_2~Datetime,col='Red')
  lines(Sub_metering_3~Datetime,col='Blue')
})
legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2,cex=.5,
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
##Create Plot
dev.copy(png, file="plot3.png", height=480, width=480)
dev.off()