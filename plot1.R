## When sourced creates plot1.png in working directory as per README.md
## Requires a valid' household_power_consumption.txt file in data directory

## Read text file whole into table
data <- read.table("data/household_power_consumption.txt", header=T, sep=';', na.strings="?", colClasses=c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric"))

## Subset the table for specified dates
data <- data[(data$Date == "1/2/2007") | (data$Date == "2/2/2007"),]
data$DateTime <- strptime(paste(data$Date, data$Time), "%d/%m/%Y %H:%M:%S")

## Graph plot 1
png(filename = "plot1.png", width = 480, height = 480, units = "px", bg="transparent")
hist(data$Global_active_power, main="Global Active Power", xlab="Global Active Power (kilowatts)", col="red", breaks = 12, ylim = c(0, 1200))
dev.off()