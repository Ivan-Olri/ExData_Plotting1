fyle = 'household_power_consumption.txt'
dta = read.csv(fyle, sep = ';', na.strings = '?')
dta$Date = as.Date(dta$Date, '%d/%m/%Y')

#Subsetting dates we're interested in
dates = subset(dta, Date >= '2007-02-01' & Date <= '2007-02-02')
dates$datetime = strptime(paste(dates$Date, dates$Time, sep=" "), "%Y-%m-%d %X")

#Plotting PNG
png('plot4.png')
par(mfcol = c(2,2))
#plot1
with(dates, plot(datetime, Global_active_power, type = 'l', xlab = '', ylab = 'Global Active Power (kilowatts)'))
#plot2
with(dates, 
     {
             plot(datetime, Sub_metering_1, type = 'l', xlab = '', ylab = 'Energy sub metering');
             lines(datetime, Sub_metering_2, col = 'red');
             lines(datetime, Sub_metering_3, col = 'blue')
     }
)
legend('topright', legend = c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'), col = c('black', 'red', 'blue'), bty = 'n' ,lty = c(1,1,1))
#plot3
with(dates, plot(datetime, Voltage, type = 'l'))
#plot4
with(dates, plot(datetime, Global_reactive_power, type = 'l'))
dev.off()