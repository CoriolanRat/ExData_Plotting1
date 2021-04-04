mydata <- read.table("./household_power_consumption.txt",sep=";",header=TRUE, na.strings = "?" )

#Create a column combining date and time
mydata$fullTime <- paste(mydata$Date, mydata$Time)
#convert Date to actual date format
mydata$Date <- as.Date(as.character(mydata$Date),format="%d/%m/%Y")
#create a subset to work on
mydata2 <- subset(mydata, Date>="2007-02-01" & Date <="2007-02-02")
#change the format of the full time
mydata2$fullTime <- strptime(mydata2$fullTime,format="%d/%m/%Y %H:%M:%S")

with(mydata2, plot(fullTime,Sub_metering_1, type="l",xlab=NA, ylab="Energy sub metering"))
with(mydata2,lines(fullTime,Sub_metering_2, type="l",col="red"))
with(mydata2,lines(fullTime,Sub_metering_3, type="l",col="blue"))
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), cex=0.5,bty=c("o","o","o"),fill=c("black","red","blue"))                  
dev.copy(png,width=480, height=480, units="px", file="plot3.png")
dev.off()
