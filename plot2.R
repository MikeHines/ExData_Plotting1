#Import Data
setClass('myDate')
setAs("character","myDate", function(from) as.Date(from, format="%d/%m/%Y") )

classes<-c("myDate","factor","numeric","numeric","numeric","numeric","numeric","numeric","numeric")
data<-read.table("household_power_consumption.txt",header=TRUE,colClasses=classes,sep=";",na.strings="?")

graphdata<-data[data$Date>="2007-02-01"& data$Date<="2007-02-02",]
datetime <- paste(as.Date(graphdata$Date), graphdata$Time)
graphdata$Datetime <- as.POSIXct(datetime)


## Plot 2
plot(graphdata$Global_active_power~graphdata$Datetime,type="l",ylab="Global Active Power (kilowatts)", xlab="")
##Create Plot
dev.copy(png, file="plot2.png", height=480, width=480)
dev.off()