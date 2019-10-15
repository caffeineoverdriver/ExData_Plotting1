#creates third plot required in project

#load in data
init_data <- read.table("household_power_consumption.txt", sep = ";", header = TRUE, stringsAsFactors = FALSE) 

#subset data for 1/2/2007 and 2/2/2007    
sub_data <- subset(init_data, Date == "1/2/2007" | Date == "2/2/2007")

#convert appropriate column to numeric for plotting
sub_data$Sub_metering_1 <- as.numeric(sub_data$Sub_metering_1)
sub_data$Sub_metering_2 <- as.numeric(sub_data$Sub_metering_2)
sub_data$Sub_metering_3 <- as.numeric(sub_data$Sub_metering_3)

#create graphics device
png("plot3.png", width = 480, height = 480)

#points for x-axis
xrange <- seq(0, 2879, 1)

#first plot
plot(xrange, sub_data$Sub_metering_1,
     type = "l",
     lty = 1,
     ylab = "Energy sub metering",
     xlab = "",
     xaxt = "n")

#second part of plot
lines(xrange, sub_data$Sub_metering_2,
      col = "red")

#third part of plot
lines(xrange, sub_data$Sub_metering_3,
      col = "blue")

axis(side = 1,
     at = c(0, 1440, 2880),
     labels = c("Thu", "Fri", "Sat"),
     tck = -0.025)

#legend
legend("topright", 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       col = c("black", "red", "blue"),
       lty = 1)

#close graphics device
dev.off()