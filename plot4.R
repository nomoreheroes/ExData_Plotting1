library(dplyr)
f = "household_power_consumption.txt"
mydata = read.table(f, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".") %>%
  tbl_df %>%
  filter(Date %in% c("1/2/2007","2/2/2007")) %>%
  mutate(DT = paste(Date,Time,sep=" "))

power = as.numeric(mydata$Global_active_power)
datetime=strptime(mydata$DT,"%d/%m/%Y %H:%M:%S")
sub1 <- as.numeric(mydata$Sub_metering_1)
sub2 <- as.numeric(mydata$Sub_metering_2)
sub3 <- as.numeric(mydata$Sub_metering_3)
rePower <- as.numeric(mydata$Global_reactive_power)
voltage <- as.numeric(mydata$Voltage)

png("plot4.png", width=480, height=480)
par(mfrow = c(2, 2)) 

plot(datetime, power, type="l", xlab="", ylab="Global Active Power", cex=0.2)
plot(datetime, voltage, type="l", xlab="datetime", ylab="Voltage")
plot(datetime, sub1, type="l", ylab="Energy Submetering", xlab="")
lines(datetime, sub2, type="l", col="red")
lines(datetime, sub3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))
plot(datetime, rePower, type="l", xlab="datetime", ylab="Global_reactive_power")
dev.off()