require(ggplot2)
require(scales)

mytz <- Sys.timezone(location = TRUE)

setwd("C:\\Users\\FamilyBeer\\Desktop")

cmdstr <- "pscp -pw mysecret dirk@192.168.1.44:/home/dirk/hotspot_latency2.txt ."
shell(cmdstr)

dat <- read.delim("hotspot_latency2.txt", header=FALSE, sep=" ")
dat$date <- paste(dat$V2, dat$V3, dat$V4, dat$V5, dat$V6)
dat$Date <- as.POSIXct(strptime(dat$date, format="%d %b %Y %I:%M:%S %p", tz=mytz), tz=mytz)
dat$V8 <- as.numeric(dat$V8)
dat$V9 <- as.numeric(dat$V9)
dat$V10 <- as.numeric(dat$V10)

ymax <- 10
label_interval = "4 hours"

gg <- ggplot(dat, aes(x = Date, y = V8)) + geom_point() + ylim(c(-1,ymax)) +
  scale_x_datetime(labels = date_format("%H\n%a", tz=mytz), date_breaks = label_interval) +
  xlab("Time") + ylab("Latency (s)") + ggtitle("Buffalo")
print(gg)

gg <- ggplot(dat, aes(x = Date, y = V9)) + geom_point() + ylim(c(-1,ymax))+
  scale_x_datetime(labels = date_format("%H\n%a", tz=mytz), date_breaks = label_interval) +
  xlab("Time") + ylab("Latency (s)") + ggtitle("Beaver")
print(gg)

gg <- ggplot(dat, aes(x = Date, y = V10)) + geom_point() + ylim(c(-1,ymax)) +
  scale_x_datetime(labels = date_format("%H\n%a", tz=mytz), date_breaks = label_interval) +
  xlab("Time") + ylab("Latency (s)") + ggtitle("Spider")
print(gg)
