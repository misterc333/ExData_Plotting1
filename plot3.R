### Project 1 for EDA course: plot 3
### generate graphs in base R

# read in data set 
df <- read.table("./data/household_power_consumption.txt", 
                 sep = ";", header = TRUE, stringsAsFactors = FALSE,
                 colClasses = c(rep("character", 2), 
                                rep("double", 7)),
                 na.strings = "?")
str(df)

# create datetime variable 
df_day <- df
df_day$datetime <- strptime(paste(df_day$Date, df_day$Time), format="%d/%m/%Y %H:%M:%S")
df_day$Date <- as.Date(df_day$Date, format="%d/%m/%Y")
str(df_day)  

# select relevant observations: 2007-02-01 - 2007-02-02
df_day <- df_day[(df_day$Date >= "2007-02-01" & df_day$Date <= "2007-02-02"), ]

# open png device with options
png(filename = "plot3.png")
# create line plot with y-axis label, days on x-axis, 3 separate coloured lines
with(subset(df_day, datetime$wday >= 4),
    plot(datetime, Sub_metering_1,
          type = "n",
          ylab = "Energy sub metering",
          xlab = ""))    
with(subset(df_day, datetime$wday >= 4),
    lines(datetime, Sub_metering_1,
          col = "black"))
with(subset(df_day, datetime$wday >= 4),
     lines(datetime, Sub_metering_2,
           col = "red"))
with(subset(df_day, datetime$wday >= 4),
     lines(datetime, Sub_metering_3,
           col = "blue"))
legend("topright", lty = 1, cex = 0.8, col = c("black", "red", "blue"),
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
       )
dev.off()

