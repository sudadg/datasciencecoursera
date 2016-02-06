
#step 1
## Read data into table
dataFile <- "./exdata-data-household_power_consumption/household_power_consumption.txt"
Readdata <- read.table(dataFile, header=TRUE, sep=";", stringsAsFactors=FALSE )
#head(Readdata)
#dim(Readdata)

#step 2
## Filter data for feb01-2007 and feb02-2007

dataFilter <- subset(Readdata,Readdata$Date %in% c("1/2/2007","2/2/2007"))
#dim(dataFilter)



datetime <- strptime(paste(dataFilter$Date, dataFilter$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
#datetime
dataFilter_num <- as.numeric(dataFilter$Global_active_power)
subMetering1 <- as.numeric(dataFilter$Sub_metering_1)
subMetering2 <- as.numeric(dataFilter$Sub_metering_2)
subMetering3 <- as.numeric(dataFilter$Sub_metering_3)
globalReact_pow <- as.numeric(dataFilter$Global_reactive_power )
voltage <- as.numeric(dataFilter$Voltage)


png("plot4.png",width=480,height=480)
par(mfrow = c(2,2))
plot(datetime,dataFilter_num,type="l",xlab="", ylab = "Global Active Power", cex =0.2)

plot(datetime, voltage, type="l", xlab="datetime", ylab="Voltage")

plot(datetime, subMetering1, type="l", ylab="Energy Submetering", xlab="")
lines(datetime, subMetering2, type="l", col="red")
lines(datetime, subMetering3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=, lwd=2.5, col=c("black", "red", "blue"), bty="o")

plot(datetime, globalReact_pow, type="l", xlab="datetime", ylab="Global_reactive_power")

dev.off()

