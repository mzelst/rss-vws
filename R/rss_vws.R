library(tidyRSS)

dat <- tidyfeed("https://feeds.rijksoverheid.nl/ministeries/ministerie-van-volksgezondheid-welzijn-en-sport/kamerstukken.rss")

dat <- dat %>%
  select(-c("feed_last_build_date"))

filename.raw.data <- paste0("raw-data/rss-vws_",Sys.Date(),"-",format(Sys.time(), "%H"),"-",format(Sys.time(), "%M"),".csv")

fwrite(dat, file = filename.raw.data)


