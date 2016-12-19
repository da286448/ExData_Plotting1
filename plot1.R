setwd("/Users/Dtrujillo/RCourse")
Data <- read.table("household_power_consumption.txt",header = TRUE, sep = ";",, na.strings = "?", colClasses = c('character','character','numeric','numeric','numeric','numeric','numeric','numeric','numeric'))
Data$Date <- as.Date(Data$Date, "%d/%m/%Y")
dateTime <- paste(Data$Date, Data$Time)
png(filename='plot1.png', width=480, height=480, units='px')
hist(Data$Global_active_power, main="Global Active Power", xlab = "Global Active Power (kilowatts)", col="red")

dev.off()
