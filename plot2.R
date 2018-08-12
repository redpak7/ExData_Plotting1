df<-read.table("household_power_consumption.txt", sep = ";", header = TRUE, stringsAsFactors = FALSE)
df$Time<-strptime(paste(df$Date,df$Time),"%d/%m/%Y %H:%M:%S")
df$Date <- as.Date(df$Date, "%d/%m/%Y")
df<-subset(df, Date == as.Date("2007-02-01", "%Y-%m-%d") | Date == as.Date("2007-02-02","%Y-%m-%d"))
df[,3:9] <- lapply(df[,3:9], as.numeric)

png("plot2.png", width=400, height=400)
plot(df$Time,df$Global_active_power, type = "l",xlab="",ylab = "Global Active Power (kilowatts)")
dev.off()