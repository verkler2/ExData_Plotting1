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


##Logic for Plot 4
png("plot4.png", width=480, height=480)
par(mfrow=c(2,2))

#Logic for Top Left
with(SubsetHPC, plot(DateTime, Global_active_power, type = "l", xlab = "",
                       ylab = "Global Active Power", xaxt = "n"))
axis(side = 1, at = c(as.numeric(SubsetHPC$DateTime[1]),
                      as.numeric(SubsetHPC$DateTime[1441]),
                      as.numeric(SubsetHPC$DateTime[2880])),labels = c("Thu","Fri","Sat"))
#logic for top right 
with(SubsetHPC, plot(DateTime, Voltage, type = "l", xlab = "datetime", ylab = "Voltage",
                       xaxt = "n"))
axis(side = 1, at = c(as.numeric(SubsetHPC$DateTime[1]),
                      as.numeric(SubsetHPC$DateTime[1441]),
                      as.numeric(SubsetHPC$DateTime[2880])),labels = c("Thu","Fri","Sat"))
#Logic for bottom left
with(SubsetHPC, plot(DateTime, Sub_metering_1, type = "n", xaxt = "n",
                       xlab = "", ylab = "Energy sub metering"))
axis(side = 1, at = c(as.numeric(SubsetHPC$DateTime[1]),
                      as.numeric(SubsetHPC$DateTime[1441]),
                      as.numeric(SubsetHPC$DateTime[2880])),labels = c("Thu","Fri","Sat"))
with(SubsetHPC, lines(DateTime, Sub_metering_1))
with(SubsetHPC, lines(DateTime, Sub_metering_2, col = "red"))
with(SubsetHPC, lines(DateTime, Sub_metering_3, col = "blue"))
legend("topright",lty = 1, col=c("black","red","blue"),
       legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
#Logic for bottom right 
with(SubsetHPC, plot(DateTime, Global_reactive_power, type= "l", xlab = "datetime", 
                       ylab = "Global_reactive_power", xaxt = "n"))
axis(side = 1, at = c(as.numeric(SubsetHPC$DateTime[1]),
                      as.numeric(SubsetHPC$DateTime[1441]),
                      as.numeric(SubsetHPC$DateTime[2880])),labels = c("Thu","Fri","Sat"))
dev.off()

