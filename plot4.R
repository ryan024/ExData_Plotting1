#Read in the first 4 rows to get the class type of each column
temptab <- read.table("./household_power_consumption.txt",header = TRUE, sep = ";", nrows = 4)
classes <- sapply(temptab, class)
#Make a header based on the temporary table
header <- colnames(temptab)
#Read in file, just the rows with 2007-2-1 and 2007-2-2, remove missing as ?
project1data <- read.table("./household_power_consumption.txt",sep=";", colClasses = classes, skip = 66637, nrows = 2880, na.strings = c("?",""))
#Add header
colnames(project1data) <- header
#Update Date column as datae
project1data$Date <- as.Date(project1data$Date, "%d/%m/%Y")
#Create a new column that combines data and time
project1data$timetemp <- paste(project1data$Date, project1data$Time)
#Update Time column based on new column
project1data$Time <- strptime(project1data$timetemp, format = "%Y-%m-%d %T")

png(file="./plot4.png")
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

dev.off()