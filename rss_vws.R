library(tidyRSS)

dat <- tidyfeed("https://feeds.rijksoverheid.nl/ministeries/ministerie-van-volksgezondheid-welzijn-en-sport/kamerstukken.rss", list = T)
dat <- dat$entries[,1:5]

filename.raw.data <- paste0("raw-data/rss-vws_",Sys.Date(),"-",format(Sys.time(), "%H"),"-",format(Sys.time(), "%M"),".csv")

write.csv(dat, file = filename.raw.data, row.names = F)

temp = list.files(path = "raw-data/",pattern="*.csv", full.names = T) ## Fetch all day files
myfiles = lapply(temp, read.csv) ## Load all day files

dat.full <- do.call(rbind,myfiles)
dat.full <- rbind(dat,dat.full)

dat.full <- unique(dat.full)

write.csv(dat.full, file = "output/kamerstukken_vws.csv")
