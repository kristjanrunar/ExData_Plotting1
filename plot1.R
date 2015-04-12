data <- read.csv("household_power_consumption.txt", sep = ";")

data$Date <- as.Date(strptime(data$Date, format = "%d/%m/%Y"))

dates <- c(as.Date("2007-02-01"), as.Date("2007-02-02"))

udata <- data[data$Date %in% dates, ]

udata$Time <- as.Date(strptime(udata$Time, format = "%H:%M:%S"))
udata[,3:9] <- lapply(udata[,3:9], function(x) as.numeric(as.character(x)))


png(filename="plot1.png")

hist(udata$Global_active_power, 
     col="red",
     main = "Global Active Power",
     xlab="Global Active Power (kilowatts)"
     )

dev.off()