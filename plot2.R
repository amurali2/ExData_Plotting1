## When sourced creates plot2.png in working directory as per README.md
## Requires a valid' household_power_consumption.txt file in data directory

## Read text file whole into table
data <- read.table("data/household_power_consumption.txt", header=T, sep=';', na.strings="?", colClasses=c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric"))

## Subset the table for specified dates
data <- data[(data$Date == "1/2/2007") | (data$Date == "2/2/2007"),]
data$DateTime <- strptime(paste(data$Date, data$Time), "%d/%m/%Y %H:%M:%S")

## Graph plot 2
png(filename = "plot2.png", width = 480, height = 480, units = "px", bg = "transparent")
plot(data$DateTime, data$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")
dev.off()