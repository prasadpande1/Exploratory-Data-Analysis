Inputfile <- read.table("C:/Users/prasad.pande/Documents/household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")
InputfileSub <- subset(Inputfile, Date %in% c("1/2/2007","2/2/2007"))
dim(InputfileSub)
InputfileSub$Date <- as.Date(InputfileSub$Date, format = "%d/%m/%Y")
InputfileSub$Datetime1 <- strptime(paste(InputfileSub$Date, InputfileSub$Time), "%Y-%m-%d %H:%M:%S")
InputfileSub$Datetime1 <- as.POSIXct(InputfileSub$Datetime1)
par(mfrow=c(2,2))

# Plot 1
plot(InputfileSub$Global_active_power ~ InputfileSub$Datetime1, type="l", ylab = "Global Active Power",
     xlab="")

# Plot 2
plot(InputfileSub$Voltage ~ InputfileSub$Datetime1, type="l", ylab = "Voltage",
     xlab="datetime")
# Plot 3
plot(InputfileSub$Sub_metering_1 ~ InputfileSub$Datetime1, type="l", ylab = "Energy Submetering",
     xlab="")
lines(InputfileSub$Sub_metering_2 ~ InputfileSub$Datetime1, col = "Red")
lines(InputfileSub$Sub_metering_3 ~ InputfileSub$Datetime1, col = "Blue")
legend(legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       col = c("black","red","blue"),"topright",lty=1)
# Plot 4
plot(InputfileSub$Global_reactive_power ~ InputfileSub$Datetime1, type="l", ylab = "Global_reactive_power(Kilowatt)",
     xlab="datetime")
dev.copy(png, "plot4.png", height=480, width=480)
dev.off()