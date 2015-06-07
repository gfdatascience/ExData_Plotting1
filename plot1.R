# Plot a frequency histogram for Global Active Power and ouputt the results
# to a png file. Ths exact format of the out can be found on  https://github.com/rdpeng/ExData_Plotting1
# We will only be using data from the dates 2007-02-01 and 2007-02-02. 

source_data <- "./data/household_power_consumption.txt"

##read raw data into data table
raw_data <- read.table(source_data, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")

##creating a subset of data from raw data
sub_data <- raw_data[raw_data$Date %in% c("1/2/2007","2/2/2007") ,]

##assign Global active power metric to variable
global_active_hist <- as.numeric(sub_data$Global_active_power)

## Plot and save a PNG file with a width of 480 pixels and a height of 480 pixels.
png("plot1.png", width=480, height=480)
hist(global_active_hist, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()