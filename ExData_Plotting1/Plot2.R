
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
png("plot2.png",width = 480, height=480)
plot(datetime,dataFilter_num,type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()