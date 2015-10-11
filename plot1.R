#Create a histogram of Global active power 
hist(project1data$Global_active_power, col = "orangered", 
        main = "Global Active Power", xlab = "Global Active Power (kilowatts)")
#Copy plot to a png file
dev.copy(png, file = "./plot1.png")
dev.off()