require(ggplot2)
require(scales)

dat <- read.delim("C:\\Users\\FamilyBeer\\Desktop\\hotspot_latency2.txt", header=FALSE, sep=" ")
dat$date <- paste(dat$V2, dat$V3, dat$V4, dat$V5, dat$V6)
dat$Date <- as.POSIXct(strptime(dat$date, format="%d %b %Y %I:%M:%S %p"))

ymax <- 10

gg <- ggplot(dat, aes(x = Date, y = V8)) + geom_point() + ylim(c(-1,ymax)) +
  scale_x_datetime(labels = date_format("%H"), date_breaks = "1 hours") +
  xlab("Time") + ylab("Latency (s)") + ggtitle("Buffalo")
print(gg)

gg <- ggplot(dat, aes(x = Date, y = V9)) + geom_point() + ylim(c(-1,ymax))+
  scale_x_datetime(labels = date_format("%H"), date_breaks = "1 hours") +
  xlab("Time") + ylab("Latency (s)") + ggtitle("Beaver")
print(gg)

gg <- ggplot(dat, aes(x = Date, y = V10)) + geom_point() + ylim(c(-1,ymax)) +
  scale_x_datetime(labels = date_format("%H"), date_breaks = "1 hours") +
  xlab("Time") + ylab("Latency (s)") + ggtitle("Spider")
print(gg)
