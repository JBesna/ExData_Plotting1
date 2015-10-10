# Project 1 - Data Exploration, Plot 4

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

# plot 4
# multiple plots

png("plot4.png",width=480,height=480)
par(mfrow = c(2,2))
with(pows, {
        # plot 1
        plot(Global_active_power,ylab="Global Active Power (kilowatts)",type="n",xaxt="n",xlab="")
        lines(Global_active_power)
        axis(1,at=c(0,1500,2900),labels=c("Thu","Fri","Sat"))
        # plot 2
        plot(Voltage,ylab="Voltage",type="n",xaxt="n",xlab="datetime")
        lines(Voltage)
        axis(1,at=c(0,1500,2900),labels=c("Thu","Fri","Sat"))
        # plot 3
        plot(pows$Sub_metering_1,ylab="Energy Sub Metering",type="n",xaxt="n",xlab="")
        lines(pows$Sub_metering_1,col="black")
        lines(pows$Sub_metering_2,col="red")
        lines(pows$Sub_metering_3,col="blue")
        axis(1,at=c(0,1500,2900),labels=c("Thu","Fri","Sat"))
        legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=c(1,1),col=c("black","red","blue"))
        # plot 4
        plot(pows$Global_reactive_power,ylab="Global_reactive_power",type="n",xaxt="n",xlab="datetime")
        lines(pows$Global_reactive_power)
        axis(1,at=c(0,1500,2900),labels=c("Thu","Fri","Sat"))
})
dev.off()