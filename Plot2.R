##Import dataset 
household_power_consumption <- read.csv("household_power_consumption.txt", sep = ";", stringsAsFactors = FALSE)

##Convert date and time variables to date/time classes 
#Change classes of Date and Time variables
household_power_consumption$Date <- as.Date(household_power_consumption$Date, format = "%d/%m/%Y")
household_power_consumption$DateTime <- strptime(paste(household_power_consumption$Date,household_power_consumption$Time),
                                                 format = "%Y-%m-%d %H:%M:%S")
##subset to specified time frame
SubsetHPC <- household_power_consumption[household_power_consumption$Date >= "2007-2-1" & household_power_consumption$Date <= "2007-2-2",]

##Change class to numeric 
SubsetHPC[,3] <- as.numeric(SubsetHPC[,3])
SubsetHPC[,4] <- as.numeric(SubsetHPC[,4])
SubsetHPC[,5] <- as.numeric(SubsetHPC[,5])
SubsetHPC[,6] <- as.numeric(SubsetHPC[,6])
SubsetHPC[,7] <- as.numeric(SubsetHPC[,7])
SubsetHPC[,8] <- as.numeric(SubsetHPC[,8])

##Logic for plot 2
png("plot2.png", width=480, height=480)
with(SubsetHPC, plot(DateTime, Global_active_power, type = "l", xlab = "",
                       ylab = "Global Active Power (kilowatts)", xaxt = "n"))
axis(side = 1, at = c(as.numeric(SubsetHPC$DateTime[1]),
                      as.numeric(SubsetHPC$DateTime[1441]),
                      as.numeric(SubsetHPC$DateTime[2880])),labels = c("Thu","Fri","Sat"))
dev.off()
