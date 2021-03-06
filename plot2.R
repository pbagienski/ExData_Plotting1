##If data is already read and subsetted, skip to the PNG file stage.
##Otherwise, with data text file in working directory, first read the data.

data <- read.table("household_power_consumption.txt", header=T, sep=";", stringsAsFactors=FALSE, dec=".", na.strings="?")

##Make date column into a date type object to subsect the specified date range.
##We will overwrite our original data file to avoid having the bulky original
##file in the working directory.

data$Date <-as.Date(data$Date, format="%d/%m/%Y")
data <- subset(data, (Date >= "2007-02-01" & Date <= "2007-02-02"))

##Combine date and time values

data$datetime <- strptime(paste(data$Date, data$Time, sep=" "), "%Y-%m-%d %H:%M:%S")

##Open a .png file

png("plot2.png", width=480, height=480)

##Create the plot with appropriate labels.

with(data, plot(datetime, Global_active_power, type="l", ylab="Global Active Power (kilowatts)", xlab=""))
##Don't forget to turn off device!

dev.off()