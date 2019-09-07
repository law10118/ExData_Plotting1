#Read and subset the used data
data <- read.table("household_power_consumption.txt",
                   stringsAsFactors = FALSE, header = TRUE, sep =";", dec="."  )
SortedData <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]
datetime <-strptime(paste(SortedData$Date, SortedData$Time, sep=" "), format="%d/%m/%Y %H:%M:%S")
SM1<-as.numeric(SortedData$Sub_metering_1)
SM2<-as.numeric(SortedData$Sub_metering_2)
SM3<-as.numeric(SortedData$Sub_metering_3)
#setting the png 
png(file = "plot3.png", width = 480, height = 480) 
#plotting
plot(datetime, SM1, ylab = "Energy sub metering", type = "l", col = "Black",xlab = " ") 
lines(datetime, SM2, type = "l", col = "Red")   #adding each line
lines(datetime, SM3, type = "l", col = "Blue")
#add a legend for distinction 
legend("topright", legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty = 1, 
       col = c("Black", "Red","Blue"))
dev.off()