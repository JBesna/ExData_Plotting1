# Project 1 - Data Exploration, Plot 1

# estimate size of table
sizer <- 2075279 * 9 * 8 + 4*2075279
sizer <- sizer / (1024^2)
sizer

# read data
power <- read.table("power.txt", header = TRUE, sep=";",nrow=20,stringsAsFactors = FALSE)
classes <- sapply(power, class)
powerall <- read.table("power.txt", header = TRUE, sep=";",nrow=2075259,colClasses = classes,na.strings="?")
# convert dates and times
powerall$Date <- as.Date(powerall$Date,"%d/%m/%Y")
powerall$Time <- strptime(powerall$Time,"%H:%M:%S")
library(dplyr)
# filter dates for 2007-02-01 or 2007-02-02
pows <- filter(powerall,Date=='2007-02-01' | Date=='2007-02-02')

# plot 1
# histogram
png("plot1.png",width=480,height=480)
hist(pows$Global_active_power, col = "red", main = "Global Active Power",xlab="Global Active Power (kilowatts)")
dev.off()
