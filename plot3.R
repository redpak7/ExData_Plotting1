df<-read.table("household_power_consumption.txt", sep = ";", header = TRUE, stringsAsFactors = FALSE)
df$Time<-strptime(paste(df$Date,df$Time),"%d/%m/%Y %H:%M:%S")
df$Date <- as.Date(df$Date, "%d/%m/%Y")
df<-subset(df, Date == as.Date("2007-02-01", "%Y-%m-%d") | Date == as.Date("2007-02-02","%Y-%m-%d"))
df[,3:9] <- lapply(df[,3:9], as.numeric)


png("plot3.png", width=400, height=400)
plot(df$Time,df$Sub_metering_1, type = "l" , xlab="", ylab = "Energy sub metering")
lines(df$Time,df$Sub_metering_2, col = "red")
lines(df$Time,df$Sub_metering_3, col = "blue")
legend("topright", col = c("black","red","blue"), c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"), lty = 1)
dev.off()