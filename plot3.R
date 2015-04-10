#read the data
  data <- read.table("household_power_consumption.txt", header = TRUE,  na.strings = "?", sep = ";", stringsAsFactors = FALSE) 
#change the Date column to date class
#subset the data according to the dates feb 1 and feb 2 of 2007
  data$Date <- as.Date(data$Date, format = "%d/%m/%Y")
  dataSubset <- subset(data, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))
#pasting date and time to one column called DateTime and changing to POSIXct
  DateTime <- paste(as.Date(dataSubset$Date), dataSubset$Time)
  dataSubset$DateTime <- as.POSIXct(DateTime)
#plotting line graph with dateTime on x axis and Sub metering 1,2 and 3 on y axis
#with different colored liness and legend


  plot(dataSubset$DateTime,dataSubset$Sub_metering_1, type = "l" , xlab = " ", ylab = "Energy sub metering")
  lines(dataSubset$DateTime,dataSubset$Sub_metering_2, type="l",col="red")
  lines(dataSubset$DateTime,dataSubset$Sub_metering_3, type="l",col="blue")
  legend("topright" , legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), lty=c(1,1,1)
  ,lwd=c(2.5,2.5,2.5),col=c("black","red","blue")) 
#copying the graphs to the file in png format
  dev.copy(png, file = "plot3.png", width = 480, height = 480)
  dev.off() 

