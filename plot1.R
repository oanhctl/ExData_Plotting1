# Tải dữ liệu nếu chưa có
if (!file.exists("household_power_consumption.txt")) {
  url <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
  download.file(url, "household_power_consumption.zip", mode = "wb")
  unzip("household_power_consumption.zip")
}

# Đọc dữ liệu
power <- read.table("household_power_consumption.txt",
                    header = TRUE,
                    sep = ";",
                    na.strings = "?",
                    stringsAsFactors = FALSE)

# Lọc dữ liệu ngày 01/02/2007 và 02/02/2007
power$Date <- as.Date(power$Date, format = "%d/%m/%Y")
power2 <- subset(power, Date >= as.Date("2007-02-01") & Date <= as.Date("2007-02-02"))

# Tạo file plot1.png
png("plot1.png", width = 480, height = 480)

hist(power2$Global_active_power,
     col = "red",
     main = "Global Active Power",
     xlab = "Global Active Power (kilowatts)")

dev.off()