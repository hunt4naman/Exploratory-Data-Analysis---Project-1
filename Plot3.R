
data<-read.table("household_power_consumption.txt",sep=";",header=T,na="?",stringsAsFactors=F)
head(data)
str(data)         
attach(data)

subset_Date<-subset_Date<-data[Date %in% c("1/2/2007","2/2/2007"),]
str(subset_Date)

# Converting the "subset_Date" variable in the numeric format to plot the histogram
globalActivePower<-subset_Date$Global_active_power

# Converting dates
datetime <- strptime(paste(subset_Date$Date,subset_Date$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
head(datetime)

# Plotting the graph

with(subset_Date, {
  plot(datetime, Sub_metering_1, type='l', xlab="", ylab="Energy sub metering")
  lines(datetime, Sub_metering_2, type='l', col='red')
 lines(datetime, Sub_metering_3, type='l', col='blue')
})
legend('topright', legend=c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'), lwd='1', col=c('black', 'red', 'blue'))

# Copying the graph to png file with the given width and height

dev.copy(png,file="plot3.png",width=480,height=480)

#Closing the PNG device
dev.off()
