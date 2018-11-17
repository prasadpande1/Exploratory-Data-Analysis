Inputfile <- read.table("C:/Users/prasad.pande/Documents/household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")
InputfileSub <- subset(Inputfile, Date %in% c("1/2/2007","2/2/2007"))
dim(InputfileSub)
hist(InputfileSub$Global_active_power, xlab = "Global Active Power(Kilowatts)", ylab = "Frequency",
     main = "Global Active Power", col = "red")
dev.copy(png, "plot1.png",height=480, width=480)
dev.off()

