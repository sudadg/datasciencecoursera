
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

#step 3
## Draw plot using hist and save in plot1.png filename

dataFilter_num <- as.numeric(dataFilter$Global_active_power)
png("plot1.png",width = 480, height=480)
hist(dataFilter_num,col="red",main="Global Active Power", xlab="Global Active power (Kilowatts)")
dev.off()



