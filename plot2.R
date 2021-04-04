mydata <- read.table("./household_power_consumption.txt",sep=";",header=TRUE, na.strings = "?" )

#Create a column combining date and time
mydata$fullTime <- paste(mydata$Date, mydata$Time)
#convert Date to actual date format
mydata$Date <- as.Date(as.character(mydata$Date),format="%d/%m/%Y")
#create a subset to work on
mydata2 <- subset(mydata, Date>="2007-02-01" & Date <="2007-02-02")
#change the format of the full time
mydata2$fullTime <- strptime(mydata2$fullTime,format="%d/%m/%Y %H:%M:%S")



with(mydata2, plot(fullTime,Global_active_power, type="l", xlab=NA, ylab="Global Active Power (kilowatts)"))
dev.copy(png,width=480, height=480, units="px", file="plot2.png")
dev.off()
