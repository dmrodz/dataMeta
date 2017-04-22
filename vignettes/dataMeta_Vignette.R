## ----echo=F, message=F, warning=F---------------------------------------------------------------------------
library(dataMeta)
library(knitr)
options(width = 110)
opts_chunk$set(size = 'small', comment = NA, tidy = FALSE)

## ----echo = FALSE, out.width = "800px", fig.align = 'center'------------------------------------------------
knitr::include_graphics("dataMeta_diagram.jpeg")

## ----message = FALSE, warning = FALSE-----------------------------------------------------------------------
path = "http://raw.githubusercontent.com/cdcepi/zika/master/"
path2 = "USVI/USVI_Zika/data/USVI_Zika-2017-01-03.csv"
url <- paste0(path, path2, collapse="")

my.data <- read.csv(url, header = TRUE, stringsAsFactors = FALSE)

kable(head(my.data, 10), format = "html", caption = "Portion of dataset")

## ----warning = FALSE, message = FALSE-----------------------------------------------------------------------
var_desc <- c("Date when report was published", "Regional location", 
             "Description of regional location", "Type of case",
             "A specific code for each data field", "The time period of each week",
             "The type of time period", "The number of cases per data field type",
             "The unit in which cases are reported")

var_type <- c(0, 1, 0, 1, 0, 0, 0, 0, 1)
                          
linker <- build_linker(my.data, variable_description = var_desc, variable_type = var_type)

## ----warning = FALSE, message = FALSE, echo = FALSE---------------------------------------------------------
kable(linker, format = "html", caption = "Linker data frame")

## ----warning = FALSE, message = FALSE-----------------------------------------------------------------------
dict <- build_dict(my.data = my.data, linker = linker, option_description = NULL, 
                   prompt_varopts = FALSE)

## ----warning = FALSE, message = FALSE-----------------------------------------------------------------------
kable(dict, format = "html", caption = "Data dictionary for original dataset")

## ----warning = FALSE, message = FALSE-----------------------------------------------------------------------
data_desc = "This data set portrays Zika infection related cases as reported by USVI."

my.new.data <- incorporate_attr(my.data = my.data, data.dictionary = dict, main_string = data_desc)

attributes(my.new.data)

## ----warning=F, message=F, eval=F---------------------------------------------------------------------------
#  # Exporting dictionary only:
#  dict_only <- attributes(my.new.data)$dictionary
#  write.csv(dict_only, "dict_only.csv")
#  
#  # Saving as .rds (dataset with appended dictionary)
#  save_it(complete_dict = my.new.data, name_of_file = "My Complete Dataset")

