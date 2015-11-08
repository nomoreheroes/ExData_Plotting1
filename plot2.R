library(dplyr)
f = "household_power_consumption.txt"
mydata = read.table(f, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".") %>%
  tbl_df %>%
  filter(Date %in% c("1/2/2007","2/2/2007")) %>%
  mutate(DT = paste(Date,Time,sep=" "))

power = as.numeric(mydata$Global_active_power)
datetime=strptime(mydata$DT,"%d/%m/%Y %H:%M:%S")
png("plot2.png", width=480, height=480)
plot(datetime, power, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()