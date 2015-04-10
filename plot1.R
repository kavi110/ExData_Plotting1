#read the data
  data <- read.table("household_power_consumption.txt", header = TRUE,  na.strings = "?", sep = ";", stringsAsFactors = FALSE) 
#change the Date column to date class
#subset the data according to the dates feb 1 and feb 2 of 2007
  data$Date <- as.Date(data$Date, format = "%d/%m/%Y")
  dataSubset <- subset(data, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))
#pasting date and time to one column called DateTime and changing to POSIXct
  DateTime <- paste(as.Date(dataSubset$Date), dataSubset$Time)
  dataSubset$DateTime <- as.POSIXct(DateTime)
# plotting the hitogram for global activepower
  hist(dataSubset$Global_active_power, main = "Global Active Power" , xlab = "Global Active Power (kilowatts)", ylab = "Frequency", col = "Red")

#copying the graphs to the file in png format

  dev.copy(png, file = "plot1.png", width = 480, height = 480)
  dev.off()