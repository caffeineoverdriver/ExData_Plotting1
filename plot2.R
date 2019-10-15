#creates second plot required in project

#load in data
init_data <- read.table("household_power_consumption.txt", sep = ";", header = TRUE, stringsAsFactors = FALSE) 

#subset data for 1/2/2007 and 2/2/2007    
sub_data <- subset(init_data, Date == "1/2/2007" | Date == "2/2/2007")

#convert appropriate column to numeric for plotting
sub_data$Global_active_power <- as.numeric(sub_data$Global_active_power)

#create graphics device
png("plot2.png", width = 480, height = 480)

#generate line plot
plot(sub_data$Global_active_power,
     type = "l",
     lty = 1,
     ylab = "Global Active Power (kilowatts)",
     xlab = "",
     xaxt = "n")

#add new x-axis
axis(side = 1,
     at = c(0, 1440, 2880),
     labels = c("Thu", "Fri", "Sat"),
     tck = -0.025)

#close graphics device
dev.off()