#Read and subset the used data
data <- read.table("household_power_consumption.txt",
                   stringsAsFactors = FALSE, header = TRUE, sep =";", dec="."  )
SortedData <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]
datetime <-strptime(paste(SortedData$Date, SortedData$Time, sep=" "), format="%d/%m/%Y %H:%M:%S")
SM1<-as.numeric(SortedData$Sub_metering_1)
SM2<-as.numeric(SortedData$Sub_metering_2)
SM3<-as.numeric(SortedData$Sub_metering_3)
Voltage<-as.numeric(SortedData$Voltage)
Global_reactive_power<-as.numeric(SortedData$Global_reactive_power)
#setting the png 
png(file = "plot4.png", width = 480, height = 480)
par(mfcol = c(2,2)) #setting a 2 by 2
#1st plot
plot(datetime,GAPdata,type="l",xlab="", ylab = "Global Active Power (kilowatts)")
#2nd plot
plot(datetime, SM1, ylab = "Energy sub metering", type = "l", col = "Black",xlab="") 
lines(datetime, SM2, type = "l", col = "Red")   #adding each line
lines(datetime, SM3, type = "l", col = "Blue")
#add a legend for distinction 
legend("topright", legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty = 1, 
       col = c("Black", "Red","Blue"))
#3rd plot
plot(datetime,Voltage,type = "l")
#4th plot
plot(datetime,Global_reactive_power,type = "l")
dev.off()