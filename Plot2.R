data<-read.table("household_power_consumption.txt",sep=";",header=T,na="?",stringsAsFactors=F)
head(data)
str(data)         
attach(data)

subset_Date<-subset_Date<-data[Date %in% c("1/2/2007","2/2/2007"),]
str(subset_Date)

# Converting the "subset_Date" variable in the numeric format to plot the histogram
globalActivePower<-as.numeric(subset_Date$Global_active_power)

# Converting dates
datetime <- strptime(paste(subset_Date$Date,subset_Date$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
head(datetime)

# Plotting the graph
plot(datetime,globalActivePower,type="l",xlab="",ylab="Global Active Power(kilowatts)")
head(datetime)

# Copying the graph to png file with the given width and height

dev.copy(png,file="plot2.png",width=480,height=480)

#Closing the PNG device
dev.off()
