library(tidyRSS)

#setwd(dirname(rstudioapi::getActiveDocumentContext()$path)) # set to source file location
#setwd("../")

dat <- tidyfeed("https://feeds.rijksoverheid.nl/ministeries/ministerie-van-volksgezondheid-welzijn-en-sport/kamerstukken.rss", list = T)
dat <- dat$entries[,1:5]

filename.raw.data <- paste0("raw-data/rss-vws_",Sys.Date(),"-",format(Sys.time(), "%H"),"-",format(Sys.time(), "%M"),".csv")

#setwd("../")

write.csv(dat, file = filename.raw.data)



