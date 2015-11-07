The code and plots for the 4 graphs required for project 1.

The code for importing the data file and updating the date/time columns is below:

###Read in the first 4 rows to get the class type of each column
temptab <- read.table("./household_power_consumption.txt",header = TRUE, sep = ";", nrows = 4)
classes <- sapply(temptab, class)
###Make a header based on the temporary table
header <- colnames(temptab)
###Read in file, just the rows with 2007-2-1 and 2007-2-2, remove missing as ?
project1data <- read.table("./household_power_consumption.txt",sep=";", colClasses = classes, skip = 66637, nrows = 2880, na.strings = c("?",""))
###Add header
colnames(project1data) <- header
###Update Date column as datae
project1data$Date <- as.Date(project1data$Date, "%d/%m/%Y")
###Create a new column that combines data and time
project1data$timetemp <- paste(project1data$Date, project1data$Time)
###Update Time column based on new column
project1data$Time <- strptime(project1data$timetemp, format = "%Y-%m-%d %T")