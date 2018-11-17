Inputfile <- read.table("C:/Users/prasad.pande/Documents/household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")
InputfileSub <- subset(Inputfile, Date %in% c("1/2/2007","2/2/2007"))
dim(InputfileSub)
InputfileSub$Date <- as.Date(InputfileSub$Date, format = "%d/%m/%Y")
InputfileSub$Datetime1 <- strptime(paste(InputfileSub$Date, InputfileSub$Time), "%Y-%m-%d %H:%M:%S")
InputfileSub$Datetime1 <- as.POSIXct(InputfileSub$Datetime1)
plot(InputfileSub$Sub_metering_1 ~ InputfileSub$Datetime1, type="l", ylab = "Energy Submetering",
     xlab="")
lines(InputfileSub$Sub_metering_2 ~ InputfileSub$Datetime1, col = "Red")
lines(InputfileSub$Sub_metering_3 ~ InputfileSub$Datetime1, col = "Blue")
legend(legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       col = c("black","red","blue"),"topright",lty=1)
dev.copy(png, "plot3.png", height=480, width=480)
dev.off()
