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

png(file="./plot3.png")
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

dev.off()