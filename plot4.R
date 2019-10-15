#creates fourth plot required in project

#load in data
init_data <- read.table("household_power_consumption.txt", sep = ";", header = TRUE, stringsAsFactors = FALSE) 

#subset data for 1/2/2007 and 2/2/2007    
sub_data <- subset(init_data, Date == "1/2/2007" | Date == "2/2/2007")

#convert to numerics
sub_data$Global_active_power <- as.numeric(sub_data$Global_active_power)
sub_data$Voltage <- as.numeric(sub_data$Voltage)
sub_data$Global_reactive_power <- as.numeric(sub_data$Global_reactive_power)

sub_data$Sub_metering_1 <- as.numeric(sub_data$Sub_metering_1)
sub_data$Sub_metering_2 <- as.numeric(sub_data$Sub_metering_2)
sub_data$Sub_metering_3 <- as.numeric(sub_data$Sub_metering_3)


#create graphics device as png image
png("plot4.png", width = 480, height = 480)

#sets up 2x2 grid
par(mfrow=c(2,2))

#points for x-axis
xrange <- seq(0, 2879, 1)

#plot 1
plot(sub_data$Global_active_power,
     type = "l",
     lty = 1,
     ylab = "Global Active Power (kilowatts)",
     xlab = "",
     xaxt = "n")

axis(side = 1,
     at = c(0, 1440, 2880),
     labels = c("Thu", "Fri", "Sat"),
     tck = -0.025)

#plot 2
plot(sub_data$Voltage,
     type = "l",
     lty = 1,
     ylab = "Voltage",
     xlab = "",
     xaxt = "n")

axis(side = 1,
     at = c(0, 1440, 2880),
     labels = c("Thu", "Fri", "Sat"),
     tck = -0.025)

#plot 3
plot(xrange, sub_data$Sub_metering_1,
     type = "l",
     lty = 1,
     ylab = "Energy sub metering",
     xlab = "",
     xaxt = "n")

lines(xrange, sub_data$Sub_metering_2,
      col = "red")

lines(xrange, sub_data$Sub_metering_3,
      col = "blue")

axis(side = 1,
     at = c(0, 1440, 2880),
     labels = c("Thu", "Fri", "Sat"),
     tck = -0.025)

legend("topright", 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       col = c("black", "red", "blue"),
       lty = 1)

#plot 4
plot(sub_data$Global_reactive_power,
     type = "l",
     lty = 1,
     ylab = "Global_reactive_power",
     xlab = "",
     xaxt = "n")

axis(side = 1,
     at = c(0, 1440, 2880),
     labels = c("Thu", "Fri", "Sat"),
     tck = -0.025)

#close graphics device
dev.off()