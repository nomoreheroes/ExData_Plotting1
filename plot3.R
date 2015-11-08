library(dplyr)
f = "household_power_consumption.txt"
mydata = read.table(f, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".") %>%
  tbl_df %>%
  filter(Date %in% c("1/2/2007","2/2/2007")) %>%
  mutate(DT = paste(Date,Time,sep=" "))

#power = as.numeric(mydata$Global_active_power)
datetime=strptime(mydata$DT,"%d/%m/%Y %H:%M:%S")
sub1 <- as.numeric(mydata$Sub_metering_1)
sub2 <- as.numeric(mydata$Sub_metering_2)
sub3 <- as.numeric(mydata$Sub_metering_3)
png("plot3.png", width=480, height=480)
plot(datetime, sub1, type="l", ylab="Energy Submetering", xlab="")
lines(datetime, sub2, type="l", col="red")
lines(datetime, sub3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))
dev.off()