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

# Lọc dữ liệu 2 ngày cần dùng
power$Date <- as.Date(power$Date, format = "%d/%m/%Y")
power2 <- subset(power, Date >= as.Date("2007-02-01") & Date <= as.Date("2007-02-02"))

# Tạo biến thời gian
power2$DateTime <- as.POSIXct(paste(power2$Date, power2$Time),
                              format = "%Y-%m-%d %H:%M:%S")

# Tạo file plot2.png
png("plot2.png", width = 480, height = 480)

plot(power2$DateTime,
     power2$Global_active_power,
     type = "l",
     xlab = "",
     ylab = "Global Active Power (kilowatts)")

dev.off()