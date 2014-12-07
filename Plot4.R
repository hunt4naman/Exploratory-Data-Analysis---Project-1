data<-read.table("household_power_consumption.txt",sep=";",header=T,na="?",stringsAsFactors=F)
head(data)
str(data)         
attach(data)

subset_Date<-subset_Date<-data[Date %in% c("1/2/2007","2/2/2007"),]
str(subset_Date)

# Converting the "subset_Date" variable in the numeric format to plot the histogram
globalActivePower<-(subset_Date$Global_active_power)
globalReactivePower<-(subset_Date$Global_reactive_power)
# Converting dates
datetime <- strptime(paste(subset_Date$Date,subset_Date$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
head(datetime)

# Plotting the graph
par(mfrow=c(2,2),mar=c(4,2,1,0.5),oma=c(0,2,0,0))

with(subset_Date, {
  plot(datetime,globalActivePower,type="l",xlab="",ylab="Global Active Power")
  plot(datetime,Voltage,type="l",xlab="datetime",ylab="Voltage")

  plot(datetime, Sub_metering_1, type='l', xlab="", ylab="Energy sub metering")
  lines(datetime, Sub_metering_2, type='l', col='red')
  lines(datetime, Sub_metering_3, type='l', col='blue')
  legend('topright', legend=c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'), lwd='1', col=c('black', 'red', 'blue'),bty="n",seg.len=1,cex=0.7)
  
  plot(datetime,Global_reactive_power,type="l",xlab="datetime",ylab="Global_reactive_power")
})


# Copying the graph to png file with the given width and height

dev.copy(png,file="plot4.png",width=480,height=480)

#Closing the PNG device
dev.off()
