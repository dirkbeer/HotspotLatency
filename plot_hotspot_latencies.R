require(ggplot2)
require(scales)

#start_time <- '2022-03-03 00:00:00'
label_interval = "1 hours"

mytz <- Sys.timezone(location = TRUE)

setwd("C:\\Users\\FamilyBeer\\Desktop")

cmdstr <- "pscp -pw mysecret dirk@66.175.220.90:/home/dirk/hotspot_latency.txt ."
shell(cmdstr)

dat <- read.delim("hotspot_latency.txt", header=FALSE, sep="\t")
dat$Date <- as.POSIXct(strptime(dat$V1, format="%a %d %b %Y %I:%M:%S %p", tz="UTC"), tz=mytz)
dat$Hotspot <- dat$V2
dat$Latency <- as.numeric(dat$V11)
dat$Service <- as.factor(dat$V8)

#dat <- subset(dat, Date>as.POSIXct(start_time,tz=mytz))

gg <- ggplot(dat, aes(x = Date, y = Latency, color=Service)) + geom_point() +
  scale_x_datetime(labels = date_format("%H\n%a", tz=mytz), date_breaks = label_interval) +
  xlab("Time") + ylab("Latency (s)") + ggtitle("Hotspot p2p Response Latency") +
  facet_wrap(~ Hotspot) +
  ylim(min(dat$Latency), max(dat$Latency))

print(gg)
