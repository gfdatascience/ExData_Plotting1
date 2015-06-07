# Plot four graphs combined within the same plot and output the results
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

##assign Global reactive power metric to variable
global_reactive_plot <- as.numeric(sub_data$Global_reactive_power)

##assign voltage metric to variable
voltage_plot <- as.numeric(sub_data$Voltage)

##assign submetering metrics 1:3 to variables
submeter_plot_line1 <- as.numeric(sub_data$Sub_metering_1)
submeter_line2 <- as.numeric(sub_data$Sub_metering_2)
submeter_line3 <- as.numeric(sub_data$Sub_metering_3)

##Plot and save a PNG file with a width of 480 pixels and a height of 480 pixels.
png("plot4.png", width=480, height=480)

##create a multiplot scheme
par(mfrow=c(2,2))

##Upper left graph - Global Active Power
plot(date_time, global_active_plot, type="l", xlab="", ylab="Global Active Power")

##Upper right graph - Voltage
plot(date_time, voltage_plot, type="l", xlab="datetime", ylab="Voltage")

##Lower left graph - Submetering 1:3 - (remove border from legend)
plot(date_time, submeter_plot_line1, type="l", xlab="", ylab="Energy sub metering")
lines(date_time, submeter_line2, type="l", col="red")
lines(date_time, submeter_line3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), bty="n", lwd=2, col=c("black", "red", "blue"))

##Lower right graph - Global Reactive Power
plot(date_time, global_reactive_plot, type="l", xlab="datetime", ylab="Global_reactive_power")

dev.off()