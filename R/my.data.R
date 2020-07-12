#' @title my.data
#'
#' @description Data containing Zika cases as reported by the United States Virgin Islands
#' department of Health and scraped into CDC's public Zika data github repository. 
#'
#' @docType data
#'
#' @usage data(my.data)
#'
#' @format A data frame of 32 observations and 9 variables.
#' \describe{
#'   \item{report_date}{Date when report was published by USVI Department of Health, YYYY-mm-dd}
#'   \item{location}{Regional location by name}
#'   \item{location_type}{The type of location}
#'   \item{data_field}{The type of case presented}
#'   \item{data_field_code}{A code to identify the data_field}
#'   \item{time_period}{The time period of the cases}
#'   \item{time_period_type}{The units of the time period}
#'   \item{value}{The number of observations under a specific data_field}
#'   \item{unit}{The unit of the number of observations, cases, municipalities...}
#'   }
#'
#' @references Dania M. Rodriguez, Michael A Johansson, Luis Mier-y-Teran-Romero, 
#' moiradillon2, eyq9, YoJimboDurant, … Daniel Mietchen. (2017). cdcepi/zika: 
#' March 31, 2017 [Data set]. Zenodo.
#' (\href{http://doi.org/10.5281/zenodo.439543}{zenodo})
#'
#' @source \url{https://github.com/cdcepi/zika/blob/master/USVI/USVI_Zika/data/USVI_Zika-2017-01-03.csv}
"my.data"
