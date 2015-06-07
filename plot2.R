# Plot a line graph Global Active Power and output the results
# to a png file. Ths exact format of the output can be found on https://github.com/rdpeng/ExData_Plotting1
# We will only be using data from the dates 2007-02-01 and 2007-02-02. 

source_data <- "./data/household_power_consumption.txt"

##read raw data into data table
raw_data <- read.table(source_data, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")

##creating a subset of data from raw data
sub_data <- raw_data[raw_data$Date %in% c("1/2/2007","2/2/2007") ,]

##reformat date using strptime() function
date_time <- strptime(paste(sub_data$Date, sub_data$Time, sep =""),"%d/%m/%Y %H:%M:%S")

##assign Global active power metric to variable
global_active_plot <- as.numeric(sub_data$Global_active_power)

##Plot and save a PNG file with a width of 480 pixels and a height of 480 pixels.
png("plot2.png", width=480, height=480)
plot(date_time, global_active_plot, type="l", xlab="", ylab="Global Active Power (kilowatts)")

dev.off()