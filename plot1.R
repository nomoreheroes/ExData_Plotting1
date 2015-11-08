library(dplyr)
f = "household_power_consumption.txt"
mydata = read.table(f, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".") %>%
     tbl_df %>%
     filter(Date %in% c("1/2/2007","2/2/2007")) %>%
     select(Global_active_power)
mydata = as.numeric(mydata[[1]])
png("plot1.png", width=480, height=480)
hist(mydata, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()