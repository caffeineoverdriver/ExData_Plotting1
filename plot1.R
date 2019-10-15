#creates first plot required in project

#load in data
init_data <- read.table("household_power_consumption.txt", sep = ";", header = TRUE, stringsAsFactors = FALSE) 

#subset data for 1/2/2007 and 2/2/2007    
sub_data <- subset(init_data, Date == "1/2/2007" | Date == "2/2/2007")

#convert appropriate column to numeric for plotting
sub_data$Global_active_power <- as.numeric(sub_data$Global_active_power)

#open png graphing device
png(file = "./plot1.png", width = 480, height = 480)

#create histogram
hist(sub_data$Global_active_power,
     main = "Global Active Power",
     ylim = c(0, 1200),
     xlim = c(0, 6),
     xlab = "Global Active Power (kilowatts)",
     col = "red",
     xaxt = "n")

#new x-axis
axis(side = 1,
     at = c(0, 2, 4 ,6),
     labels = c("0", "2", "4", "6"),
     tck = -.025)

#close device
dev.off()

