fyle = 'household_power_consumption.txt'
dta = read.csv(fyle, sep = ';', na.strings = '?')
dta$Date = as.Date(dta$Date, '%d/%m/%Y')

#Subsetting dates we're interested in
dates = subset(dta, Date >= '2007-02-01' & Date <= '2007-02-02')

#Plotting png
png('plot1.png')
hist(dates$Global_active_power, main = 'Global Active Power', xlab = 'Global Active Power (kilowatts)', col = 'red')
dev.off()