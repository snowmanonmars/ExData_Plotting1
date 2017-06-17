##Download file and clean and subset the data
download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", destfile="powcons.zip")
unzip("powcons.zip")
powdata <- read.table("household_power_consumption.txt", sep =";", header= TRUE, na.strings = "?", colClasses = c('character','character','numeric','numeric','numeric','numeric','numeric','numeric','numeric'))
head(powdata)
summary(powdata)
powdata <- subset(powdata, Date == "1/2/2007" | Date == "2/2/2007")
powdata$DateTime <- paste(powdata$Date, powdata$Time)
powdata$DateTime <- strptime(powdata$DateTime, "%e/%m/%Y %H:%M:%S" )
powdata$DateTime <- as.POSIXct(powdata$DateTime)

##Plot plot3.png
png(file="plot3.png", height=480, width=480)
plot(powdata$Sub_metering_1~powdata$DateTime, type="l", ylab="Energy sub metering", xlab="")
lines(powdata$Sub_metering_2~powdata$DateTime, col="red")
lines(powdata$Sub_metering_3~powdata$DateTime, col="blue")
legend("topright", col=c("black", "red", "blue"), lty=1, c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()