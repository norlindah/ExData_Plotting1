#Read File Household Power Consumption
dataFile <- read.table("d:\\Data Scientist\\module 4\\ExData_Plotting1\\household_power_consumption.txt", sep= ";", header = TRUE)
#data <- read.table(dataFile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
subSetData <- dataFile[dataFile$Date %in% c("1/2/2007","2/2/2007") ,]
subSetData$Time <- strptime(paste(subSetData$Date, subSetData$Time), format="%d/%m/%Y %H:%M:%S")
subSetData$Date <- as.Date(subSetData$Date, format="%d/%m/%Y")

# Plot 4
globalActivePower <- as.numeric(subSetData$Global_active_power)
globalReactivePower <- as.numeric(subSetData$Global_reactive_power)
voltage <- as.numeric(subSetData$Voltage)
subMetering1 <- as.numeric(subSetData$Sub_metering_1)
subMetering2 <- as.numeric(subSetData$Sub_metering_2)
subMetering3 <- as.numeric(subSetData$Sub_metering_3)


png("plot4.png", width=480, height=480)
par(mfrow = c(2, 2)) 

plot(subSetData$Time, globalActivePower, type="l", xlab="", ylab="Global Active Power", cex=0.2)

plot(subSetData$Time, voltage, type="l", xlab="datetime", ylab="Voltage")

plot(subSetData$Time, subMetering1, type="l", ylab="Energy Submetering", xlab="")
lines(subSetData$Time, subMetering2, type="l", col="red")
lines(subSetData$Time, subMetering3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=, lwd=2.5, col=c("black", "red", "blue"), bty="o")

plot(subSetData$Time, globalReactivePower, type="l", xlab="datetime", ylab="Global_reactive_power")
dev.off()