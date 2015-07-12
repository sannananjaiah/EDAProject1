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

# Then Convert the required variables to their respective data types. Date and Global Active Power. 

DT[,1] = as.Date(as.character(DT[,1]))
DT[,3] = as.numeric(as.character(DT[,3]))

# Plot1

png('plot1.png',width=480,height=480)
hist(DT[,3],col='red',xlab='Global Active Power (kilowatts)', ylab='Frequency',main='Global Active Power')
dev.off()



