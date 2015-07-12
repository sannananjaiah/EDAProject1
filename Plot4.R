# load the required libraries

library(dplyr)


# Read the text file from the Working directory
# Set the working directory

setwd("C:/Users/sachand/Desktop/EDA2/EDAProject1")

DT1<- read.csv("C:/Users/sachand/Desktop/EDAProject1/household_power_consumption.txt", header = T, sep= ';' )

# Create a Subset by filtering for dates in ('1/2/2007', '2/2/2007') which will be the dataset that will be used for the plots

DT<- filter(DT1, DT1$Date== '1/2/2007' | DT1$Date == '2/2/2007')

# Convert the Data Frame to get rid of Factor and convert all variables to Charecters

DT[] <- lapply(DT,as.character)

# Merge the Date and Time fields to get the timestamps
DT$Datetime = paste(as.character(DT[,1]) , DT[,2])

# Then Convert the required variables to their respective data types. Date, Global Active Power, Sub Metering 1,2,3 and Datetime 

DT$Date = as.Date(as.character(DT[,1]))
DT$Global_active_power = as.numeric(as.character(DT[,3]))
DT$Sub_metering_1 = as.numeric(as.character(DT$Sub_metering_1))
DT$Sub_metering_2 = as.numeric(as.character(DT$Sub_metering_2))
DT$Sub_metering_3 = as.numeric(as.character(DT$Sub_metering_3))
DT$Voltage = as.numeric(as.character(DT$Voltage))
DT$Global_reactive_power = as.numeric(as.character(DT$Global_reactive_power))
DT$Datetime = strptime(DT$Datetime, '%d/%m/%Y %H:%M')

#Plot 4
par(mfrow=c(2,2))
#png('Plot4.png',width=480,height=480)
plot(DT$Datetime, DT$Global_active_power, ylab = 'Global Active Power', xlab = '', type = 'line')
plot(DT$Datetime, DT$Voltage, ylab = 'Voltage', xlab = 'datetime', type = 'line')
plot(DT$Datetime, DT$Sub_metering_1, ylab = 'Energy Sub Metering', xlab = '', type = 'line')
lines(DT$Datetime, DT$Sub_metering_2, col= 'red')
lines(DT$Datetime, DT$Sub_metering_3, col = 'blue')
legend("topright", legend = c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'), col = c('black', 'red', 'blue'), bty="n",lty=1,lwd=1.5,xjust=1,y.intersp=0.6)
plot(DT$Datetime, DT$Global_reactive_power, xlab = 'datetime', ylab = 'Global_Reactive_Power', type = 'line')
dev.copy(png, 'Plot4.png', width= 480, height = 480)
dev.off()
