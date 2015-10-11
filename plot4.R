#Make 4 plots on 1 page
par(mfrow = c(2,2))
#Create the Global Active Power plot in upper left corner
plot(project1data$Time, project1data$Global_active_power, 
     type="n",ylab = "Global Active Power", xlab = "")
lines(project1data$Time,project1data$Global_active_power)
#Create a plot of Voltage in upper right corner
plot(project1data$Time, project1data$Voltage, type="n",
        ylab = "Voltage", xlab = "datetime")
lines(project1data$Time,project1data$Voltage)
#Create plot of the 3 sub metering in lower left corner
plot(project1data$Time, project1data$Sub_metering_1, type="n",
     ylab = "Energy sub metering", xlab = "")
lines(project1data$Time,project1data$Sub_metering_1,col = "black")
par(new=T)
lines(project1data$Time,project1data$Sub_metering_2,col = "red")
par(new=T)
lines(project1data$Time,project1data$Sub_metering_3,col = "blue")
legend("topright", lty=c(1,1,1), col = c("black", "red", "blue"), 
       legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
#Create a plot of Global reactive power in lower right corner
plot(project1data$Time, project1data$Global_reactive_power, type="n",
     ylab = "Global_reactive_power", xlab = "datetime")
lines(project1data$Time,project1data$Global_reactive_power)
#Copy plot to a png file
dev.copy(png, file = "./plot4.png")
dev.off()