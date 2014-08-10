#Import Data
setClass('myDate')
setAs("character","myDate", function(from) as.Date(from, format="%d/%m/%Y") )

classes<-c("myDate","factor","numeric","numeric","numeric","numeric","numeric","numeric","numeric")
data<-read.table("household_power_consumption.txt",header=TRUE,colClasses=classes,sep=";",na.strings="?")
graphdata<-data[data$Date>="2007-02-01"& data$Date<="2007-02-02",]

## Plot 1
hist(graphdata$Global_active_power, main="Global Active Power",
  xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")
##Create Plot
dev.copy(png, file="plot1.png", height=480, width=480)
dev.off()