#Create an empty plot with labels
plot(project1data$Time, project1data$Global_active_power, type="n",
        ylab = "Global Active Power (kilowatts)", xlab = "")
#plot the lines to the graph
lines(project1data$Time,project1data$Global_active_power)
#Copy plot to a png file
dev.copy(png, file = "./plot2.png")
dev.off()