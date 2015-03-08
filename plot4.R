## When sourced creates plot4.png in working directory as per README.md
## Requires a valid' household_power_consumption.txt file in data directory

## Read text file whole into table
data <- read.table("data/household_power_consumption.txt", header=T, sep=';', na.strings="?", colClasses=c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric"))

## Subset the table for specified dates
data <- data[(data$Date == "1/2/2007") | (data$Date == "2/2/2007"),]
data$DateTime <- strptime(paste(data$Date, data$Time), "%d/%m/%Y %H:%M:%S")

## Graph and annotate plot 4
png(filename = "plot4.png", width = 480, height = 480, units = "px", bg = "transparent")
par(mfrow = c(2, 2))
with(data, {  
  # Subgraph 1
  plot(DateTime, Global_active_power, type = "l", xlab = "", ylab = "Global Active Power")
  
  # Subgraph 2
  plot(DateTime, Voltage, type = "l", xlab = "datetime", ylab = "Voltage")
  
  # Subgraph 3
  plot(DateTime, Sub_metering_1, type = "l", col = "black", xlab = "", ylab = "Energy sub metering")
  lines(DateTime, Sub_metering_2, col = "red")
  lines(DateTime, Sub_metering_3, col = "blue")
  legend("topright", bty = "n", col = c("black", "red", "blue"), c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lwd = 1)
  
  # Subgraph 4
  plot(DateTime, Global_reactive_power, type = "l", col = "black", xlab = "datetime", ylab = colnames(data)[4])       
})    
dev.off()