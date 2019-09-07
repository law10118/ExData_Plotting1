#read the downloaded data
data <- read.table("household_power_consumption.txt",
                   stringsAsFactors = FALSE, header = TRUE, sep =";", dec="."  )
#subsetting the specific date 
SortedData <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]
#plot the data 
GAPdata <- as.numeric(SortedData$Global_active_power)
png(file = "plot1.png", width = 480, height = 480) #setting the png 
hist(GAPdata, main = "Global Active Power", col = "red", xlab = "Global Active Power (Kilowatts)")
dev.off() 