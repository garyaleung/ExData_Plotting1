install.packages("readr")
library(readr)
housepowerconsump <- read_delim("household_power_consumption.txt", delim = ";")
housepowerconsumpdate <- housepowerconsump[66637:69516,]
DateTime <- paste(housepowerconsumpdate$Date, housepowerconsumpdate$Time, sep="-")
strpDateTime <- strptime(DateTime, "%d/%m/%Y-%H:%M:%S")
housepowerconsumpdate <- cbind(housepowerconsumpdate, strpDateTime)
png("plot3.png", width=480, height=480)
with(housepowerconsumpdate, plot(strpDateTime, Sub_metering_1, ylab="Energy sub metering", type="l", xlab=""))
lines(x=(housepowerconsumpdate$strpDateTime),y=housepowerconsumpdate$Sub_metering_2,col="red")
lines(x=(housepowerconsumpdate$strpDateTime),y=housepowerconsumpdate$Sub_metering_3,col="blue")
legend("topright", lty=1, col = c("black", "blue", "red"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()