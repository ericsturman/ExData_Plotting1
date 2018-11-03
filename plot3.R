library(lubridate)

# read in data and add datetime field
householdPower<-read.csv("household_power_consumption.txt", sep=";", stringsAsFactors=FALSE)
householdChartData<-householdPower[as.Date(householdPower$Date, "%d/%m/%Y") >= as.Date(ymd("20070201")) & as.Date(householdPower$Date, "%d/%m/%Y") <= as.Date(ymd("20070202")),]
# Create datetime column for plots 2-4
householdChartData$datetime=strptime(paste(householdChartData[,1], householdChartData[,2]), format="%d/%m/%Y %H:%M:%S")

png(filename = "plot3.png",height=480, width=480)
plot(householdChartData$datetime, as.numeric(householdChartData$Sub_metering_1), xlab="",ylab="Energy sub metering", type="n") 
lines(householdChartData$datetime, as.numeric(householdChartData$Sub_metering_1))
lines(householdChartData$datetime, as.numeric(householdChartData$Sub_metering_2), col="red")
lines(householdChartData$datetime, as.numeric(householdChartData$Sub_metering_3), col="blue")
legend("topright", legend=names(householdChartData[7:9]),col=c("black","red", "blue"), lty=1)
dev.off()
