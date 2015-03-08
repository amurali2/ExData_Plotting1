## When sourced creates plot3.png in working directory as per README.md
## Requires a valid' household_power_consumption.txt file in data directory

## Read text file whole into table
data <- read.table("data/household_power_consumption.txt", header=T, sep=';', na.strings="?", colClasses=c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric"))

## Subset the table for specified dates
data <- data[(data$Date == "1/2/2007") | (data$Date == "2/2/2007"),]
data$DateTime <- strptime(paste(data$Date, data$Time), "%d/%m/%Y %H:%M:%S")

## Graph plot 3
png(filename = "plot3.png", width = 480, height = 480, units = "px", bg = "transparent")
plot(data$DateTime, data$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")

## Annotate plot 3
lines(data$DateTime, data$Sub_metering_2, col="red")
lines(data$DateTime, data$Sub_metering_3, col="blue")
legend("topright", lwd = 1, col=c("black","red","blue"), c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()