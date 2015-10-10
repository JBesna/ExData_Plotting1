# Project 1 - Data Exploration, Plot 2

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

# plot 2
# line graph
png("plot2.png",width=480,height=480)
plot(pows$Global_active_power,ylab="Global Active Power (kilowatts)",type="n",xaxt="n",xlab="")
lines(pows$Global_active_power)
axis(1,at=c(0,1500,2900),labels=c("Thu","Fri","Sat"))
dev.off()