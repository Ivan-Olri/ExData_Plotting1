fyle = 'household_power_consumption.txt'
dta = read.csv(fyle, sep = ';', na.strings = '?')
dta$Date = as.Date(dta$Date, '%d/%m/%Y')

#Subsetting dates we're interested in
dates = subset(dta, Date >= '2007-02-01' & Date <= '2007-02-02')
dates$datetime = strptime(paste(dates$Date, dates$Time, sep=" "), "%Y-%m-%d %X")

#Plotting PNG
png('plot3.png')
with(dates, 
{
        plot(datetime, Sub_metering_1, type = 'l', xlab = '', ylab = 'Energy sub metering');
        lines(datetime, Sub_metering_2, col = 'red');
        lines(datetime, Sub_metering_3, col = 'blue')
}
)
legend('topright', legend = c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'), col = c('black', 'red', 'blue'), lty = c(1,1,1))
dev.off()

