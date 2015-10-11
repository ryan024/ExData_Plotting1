#Create an empty plot with labels
plot(project1data$Time,project1data$Sub_metering_1,type="n",
        ylab="Energy sub metering",xlab="")
#Create line plot for 1st plot
lines(project1data$Time,project1data$Sub_metering_1,col = "black")
#New line on same plot
par(new=T)
#Create line plot for 2nd plot
lines(project1data$Time,project1data$Sub_metering_2,col = "red")
#New line on same plot
par(new=T)
#Create line plot for 3rd plot
lines(project1data$Time,project1data$Sub_metering_3,col = "blue")
#Create a legend
legend("topright", lty=c(1,1,1), col = c("black", "red", "blue"), 
        legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
#Copy plot to a png file
dev.copy(png, file = "./plot3.png")
dev.off()