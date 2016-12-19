setwd("/Users/Dtrujillo/RCourse")
Data <- read.table("household_power_consumption.txt",header = TRUE, sep = ";",, na.strings = "?", colClasses = c('character','character','numeric','numeric','numeric','numeric','numeric','numeric','numeric'))
Data$Date <- as.Date(Data$Date, "%d/%m/%Y")
dateTime <- paste(Data$Date, Data$Time)

png(filename='plot2.png', width=480, height=480, units='px')

startDay = as.POSIXct(strftime("2007-02-01 00:00:00"))
endDay = as.POSIXct(strftime("2007-02-03 00:00:00"))
plot(Data$Global_active_power~Data$Date, type="l", ylab="Global Active Power (kilowatts)", xlab="")
     ylab="Global_active_power"
)
axis.POSIXct(1, at=seq(startDay, endDay, by="day"), format="%a")

dev.off()
