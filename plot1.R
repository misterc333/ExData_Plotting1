### Project 1 for EDA course: plot 1
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
png(filename = "plot1.png")
# create histogram in red with title and x-axis label
hist(df_day$Global_active_power,
     xlab = "Global Active Power (kilowatts)",
     main = "Global Active Power", 
     col = "red")
dev.off()

