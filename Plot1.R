getwd()
setwd("C:/Coursera- Data Science/Exploratory Data Analysis/Project")
unzip("exdata-data-household_power_consumption.zip")


#---------------------------
# Question 1
#---------------------------

# Reading the data 
data<-read.table("household_power_consumption.txt",sep=";",header=T,na="?",stringsAsFactors=F)
head(data)
str(data)         
attach(data)

# Extracting only thedata from the table based on dates 2007-02-01 and 2007-02-02.
# Storing the new subset data in the "subset_Date" variable
subset_Date<-data[Date %in% c("1/2/2007","2/2/2007"),]
str(subset_Date)

# Converting the "subset_Date" variable in the numeric format to plot the histogram
globalActivePower<-as.numeric(subset_Date$Global_active_power)
# Plotting the histogram

hist(globalActivePower,col="red",xlab="Global Active Power(kilowatts)",ylab="Frequency",main="Global Active Power")

# Copying the graph to png file with the given width and height

dev.copy(png,file="plot1.png",width=480,height=480)

#Closing the PNG device
dev.off()
