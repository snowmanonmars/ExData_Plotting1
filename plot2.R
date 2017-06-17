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

##Plot plot2.png
plot(powdata$Global_active_power~powdata$DateTime, type="l", ylab="Global Active Power (kilowatts)", xlab="")
dev.copy(png, "plot2.png", height=480, width=480)
dev.off()
