mydata <- read.table("./household_power_consumption.txt",sep=";",header=TRUE, na.strings = "?" )

#Create a column combining date and time
mydata$fullTime <- paste(mydata$Date, mydata$Time)
#convert Date to actual date format
mydata$Date <- as.Date(as.character(mydata$Date),format="%d/%m/%Y")
#create a subset to work on
mydata2 <- subset(mydata, Date>="2007-02-01" & Date <="2007-02-02")
#change the format of the full time
mydata2$fullTime <- strptime(mydata2$fullTime,format="%d/%m/%Y %H:%M:%S")


hist(mydata2$Global_active_power,col="red",xlab="Global Active Power (kilowatts)",main="Global Active Power")
dev.copy(png, file="plot1.png")
dev.off()