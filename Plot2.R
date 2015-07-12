# load the required libraries

library(dplyr)


# Read the text file from the Working directory
# Set the working directory

setwd("C:/Users/sachand/Desktop/EDAProject1")

DT1<- read.csv("household_power_consumption.txt", header = T, sep= ';' )

# Create a Subset by filtering for dates in ('1/2/2007', '2/2/2007') which will be the dataset that will be used for the plots

DT<- filter(DT1, DT1$Date== '1/2/2007' | DT1$Date == '2/2/2007')

# Convert the Data Frame to get rid of Factor and convert all variables to Charecters

DT[] <- lapply(DT,as.character)

# Merge the Date and Time fields to get the timestamps
DT$Datetime = paste(as.character(DT[,1]) , DT[,2])

# Then Convert the required variables to their respective data types. Date, Global Active Power, Datetime 

DT$Date = as.Date(as.character(DT[,1]))
DT$Global_active_power = as.numeric(as.character(DT[,3]))
DT$Datetime = strptime(DT$Datetime, '%d/%m/%Y %H:%M')

#Plot 2

png('Plot2.png',width=480,height=480)
plot(DT$Datetime, DT$Global_active_power, ylab = 'Global Active Power (kilowatts)', xlab = '', type = 'line')
dev.off()
