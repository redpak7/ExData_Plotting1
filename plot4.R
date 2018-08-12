df<-read.table("household_power_consumption.txt", sep = ";", header = TRUE, stringsAsFactors = FALSE)
df$Time<-strptime(paste(df$Date,df$Time),"%d/%m/%Y %H:%M:%S")
df$Date <- as.Date(df$Date, "%d/%m/%Y")
df<-subset(df, Date == as.Date("2007-02-01", "%Y-%m-%d") | Date == as.Date("2007-02-02","%Y-%m-%d"))
df[,3:9] <- lapply(df[,3:9], as.numeric)

png("plot4.png", width=400, height=400)

par(mfrow= c(2,2))

plot(df$Time,df$Global_active_power, type = "l",xlab="",ylab = "Global Active Power")

plot(df$Time,df$Voltage, type = "l",xlab="datetime",ylab = "Voltage")

plot(df$Time,df$Sub_metering_1, type = "l" , xlab="", ylab = "Energy sub metering")
lines(df$Time,df$Sub_metering_2, col = "red")
lines(df$Time,df$Sub_metering_3, col = "blue")
legend("topright", col = c("black","red","blue"), c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"), lty = 1, cex = 0.50, box.lty = 0, bg="transparent")

plot(df$Time,df$Global_reactive_power, type = "l",xlab="datetime",ylab = "Global_reactive_power")

dev.off()