setwd("/Users/Dtrujillo/RCourse")
Data <- read.table("household_power_consumption.txt",header = TRUE, sep = ";",, na.strings = "?", colClasses = c('character','character','numeric','numeric','numeric','numeric','numeric','numeric','numeric'))
Data$Date <- as.Date(Data$Date, "%d/%m/%Y")
Data <- Data[complete.cases(Data),]
dateTime <- paste(Data$Date, Data$Time)

png(filename='plot3.png', width=480, height=480, units='px')

startDay = as.POSIXct(strftime("2007-02-01 00:00:00"))
endDay = as.POSIXct(strftime("2007-02-02 00:00:00"))

plot(Data$Date,
     Data$Sub_metering_1,
     xlim=c(startDay, endDay),
     xaxt="l",
     type="n",
     xlab="",
     ylab="Energy sub metering"
)

lines(Data$Date, Data$Sub_metering_2, col="red")
lines(Data$Date, Data$Sub_metering_3, col="blue")

axis.POSIXct(1, at=seq(startDay, endDay, by="day"), format="%a")

legend("topright", 
       legend=c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'),
       col=c('black', 'red', 'blue'), lty=c(1, 1, 1))

dev.off()

