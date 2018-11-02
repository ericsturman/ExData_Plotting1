#as.Date(householdAbbrev[1,1], "%d/%m/%Y")

householdPower<-read.csv("household_power_consumption.txt", sep=";")
householdChartData<-householdPower[as.Date(householdPower$Date, "%d/%m/%Y") >= as.Date(ymd("20070201")) & as.Date(householdPower$Date, "%d/%m/%Y") <= as.Date(ymd("2000202")),]

png(filename = "plot1.png",height=480, width=480)
hist(as.numeric(householdChartData$Global_active_power), xlab="Global Active Power (killowatts)", col="red", main="Global Active Power")
dev.off()


#strptime(paste(householdChartData[5,1], householdChartData[5,2]), format="%m/%d/%Y %H:%M:%S")
householdChartData$Timestamp=strptime(paste(householdChartData[,1], householdChartData[,2]), format="%m/%d/%Y %H:%M:%S")

png(filename = "plot2.png",height=480, width=480)
plot(householdChartData$Timestamp, as.numeric(householdChartData$Global_active_power), xlab="",ylab="Global Active Power (killowatts)", type="n") 
lines(householdChartData$Timestamp, as.numeric(householdChartData$Global_active_power))
dev.off()

#plot3
plot(householdChartData$Timestamp, as.numeric(householdChartData$Sub_metering_1), xlab="",ylab="Energy sub metering", type="n") 
lines(householdChartData$Timestamp, as.numeric(householdChartData$Sub_metering_1))
lines(householdChartData$Timestamp, as.numeric(householdChartData$Sub_metering_2), col="red")
lines(householdChartData$Timestamp, as.numeric(householdChartData$Sub_metering_3), col="blue")



