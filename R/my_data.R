# get my.data from github repository

path = "http://raw.githubusercontent.com/cdcepi/zika/master/"
path2 = "USVI/USVI_Zika/data/USVI_Zika-2017-01-03.csv"
url <- paste0(path, path2, collapse = "")

my.data <- read.csv(url, header = TRUE, stringsAsFactors = FALSE)
