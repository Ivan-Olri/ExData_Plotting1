fyle = 'household_power_consumption.txt'
dta = read.csv(fyle, sep = ';', na.strings = '?')
dta$Date = as.Date(dta$Date, '%d/%m/%Y')

#Subsetting dates we're interested in
dates = subset(dta, Date >= '2007-02-01' & Date <= '2007-02-02')
dates$datetime = strptime(paste(dates$Date, dates$Time, sep=" "), "%Y-%m-%d %X")

#Plotting PNG
png('plot2.png')
with(dates, plot(datetime, Global_active_power, type = 'l', xlab = '', ylab = 'Global Active Power (kilowatts)'))
dev.off()
