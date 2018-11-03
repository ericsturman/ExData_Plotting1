library(lubridate)

# read in data and add datetime field
householdPower<-read.csv("household_power_consumption.txt", sep=";", stringsAsFactors=FALSE)
householdChartData<-householdPower[as.Date(householdPower$Date, "%d/%m/%Y") >= as.Date(ymd("20070201")) & as.Date(householdPower$Date, "%d/%m/%Y") <= as.Date(ymd("20070202")),]
# Create datetime column for plots 2-4
householdChartData$datetime=strptime(paste(householdChartData[,1], householdChartData[,2]), format="%d/%m/%Y %H:%M:%S")

png(filename = "plot1.png",height=480, width=480)
hist(as.numeric(householdChartData$Global_active_power), xlab="Global Active Power (killowatts)", col="red", main="Global Active Power")
dev.off()
