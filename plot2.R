#read the downloaded data
data <- read.table("household_power_consumption.txt",
                   stringsAsFactors = FALSE, header = TRUE, sep =";", dec="."  )
#subsetting the specific date 
SortedData <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]
GAPdata <- as.numeric(SortedData$Global_active_power)
#Merging the date and time of each data points
datetime <-strptime(paste(SortedData$Date, SortedData$Time, sep=" "), format="%d/%m/%Y %H:%M:%S")
png(file = "plot2.png", width = 480, height = 480) #setting the png 
#plot the active power in each date and time
plot(Date.time,GAPdata,type="l",xlab="", ylab = "Global Active Power (kilowatts)")
dev.off()