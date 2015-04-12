data <- read.csv("household_power_consumption.txt", sep = ";")

data$Date <- as.Date(strptime(data$Date, format = "%d/%m/%Y"))

dates <- c(as.Date("2007-02-01"), as.Date("2007-02-02"))

udata <- data[data$Date %in% dates, ]

udata$DateTime <- 
      as.POSIXct(strptime(
            paste(
                  strftime(udata$Date), 
                  udata$Time
            )
            , format = "%Y-%m-%d %H:%M:%S"
      )
      )


udata[,3:9] <- lapply(udata[,3:9], function(x) as.numeric(as.character(x)))


png(filename="plot3.png")

plot(udata$DateTime, 
     udata$Sub_metering_1,
     type = "l",
     xlab = "",
     ylab="Energy sub metering"
     )
points(x = udata$DateTime,
       udata$Sub_metering_2,
       type = "l",
       col = "red")
points(x = udata$DateTime,
       udata$Sub_metering_3,
       type = "l",
       col = "blue")
legend("topright", legend = names(udata[7:9]), lty = 1, col = c("black","red","blue"))

dev.off()