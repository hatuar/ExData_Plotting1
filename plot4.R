mydata <- read.csv("exdata_data_household_power_consumption/household_power_consumption.txt",sep=";", dec=".",na.strings="?")
mydata$Date = as.Date(mydata$Date,format="%d/%m/%Y")
sub.mydata <- subset(mydata, mydata$Date >= "2007-02-01" & mydata$Date <= "2007-02-02")
datetime <- paste(as.Date(sub.mydata$Date),sub.mydata$Time)
sub.mydata$Datetime <- as.POSIXct(datetime)

par(mfrow=c(2,2), mar=c(4,4,2,1), oma=c(0,0,2,0)) 
 
   plot(y=sub.mydata$Global_active_power,x=sub.mydata$Datetime, type="l",  ylab="Global Active Power (kilowatts)", xlab="") 
       plot(y=sub.mydata$Voltage,x=sub.mydata$Datetime, type="l",  ylab="Voltage (volt)", xlab="") 
       plot(y=sub.mydata$Sub_metering_1,x=sub.mydata$Datetime, type="l",  ylab="Global Active Power (kilowatts)", xlab="") 
       lines(y=sub.mydata$Sub_metering_2,x=sub.mydata$Datetime,col='Red') 
       lines(y=sub.mydata$Sub_metering_3,x=sub.mydata$Datetime,col='Blue') 
       legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, bty="n", 
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3")) 
       plot(y=sub.mydata$Global_reactive_power,x=sub.mydata$Datetime, type="l", ylab="Global Rective Power (kilowatts)",xlab="")
       dev.copy(png,file="plot4.png", width=480, height=480)
       dev.off()
       cat("a plot has been created to the working directory")
       