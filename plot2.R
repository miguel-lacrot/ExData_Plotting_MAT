##Download the file
FileUrl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(FileUrl, destfile = "./power.zip", method = "curl") 
Unzip("power.zip") ##Unzip
##read the txt file with header and setting the "?" as NAs
power <- read.table("household_power_consumption.txt", header = T, sep = ";"
                    , na.strings = "?")
##Subset the dates of our interest
powerSub <- subset(power, Date == "1/2/2007" | Date == "2/2/2007") 
##Convert Date and Time columns (characters) as a date-time format 
DateTime <- paste(powerSub$Date, powerSub$Time)
powerSub$Date <-  as.Date(powerSub$Date, format = "%d/%m/%Y")
powerSub$Time <- strptime(DateTime, format = "%d/%m/%Y %H:%M:%S")
##Create the plot 
plot(powerSub$Time, powerSub$Global_active_power, type = "l", 
     ylab = "Global Active Power (kilowatts)", xlab = "")
##Save as png
dev.copy(png, file = "plot2.png")
dev.off()