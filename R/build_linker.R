#' Build a linker data frame.
#' 
#' \code{build_linker} constructs a data frame that will be an intermediary 
#' between the original dataset and the data dictionary. This is the first function 
#' used in this package. For the function to run, the following parameters are needed.
#'
#' @param my.data Data.frame. The data set for which the user is creating the 
#' dictionary for.
#' @param variable_description A string vector representing the different descriptions 
#' that the user will give to each variable name from the original dataset. These 
#' need to be in the same order as the original dataset's variable names.
#' @param variable_type A vector of integers with values 0 or 1, only. Use 0 for
#' variable names for which a range of values will be presented and 1 to show unique 
#' cases of each variable name option. See examples, below.
#' @return If the original dataset supplied as my.data is of class data.frame; 
#' the variable description items are in the same order as the orignal dataset's 
#' variable names; and the variable_type intgeer vector values are 0 or 1, then 
#' a small data frame is produced with variable_names, variable_description, 
#' variable_type columns. This dataframe will serve as a linker data frame to be 
#' able to construct the data dictionary.
#' @examples
#' # example original data set for which a dictionary will be made
#' data("esoph")
#' my.data <- esoph
#' 
#' # Add description for each variable names and variable type
#' variable_description <- c("age group", "alcohol consumption", "tobacco consumption", 
#' "number of cases", "number of controls")
#' 
#' variable_type <- c(0, 0, 0, 0, 0)
#' 
#' linker <- build_linker(my.data = my.data, variable_description = variable_description, 
#' variable_type = variable_type)
#' linker
#' 
#' \dontrun{
#' variable_description <- c("age group", "alcohol consumption", "tobacco consumption", 
#' "number of cases", "number of controls")
#' variable_type <- c(0, 2, 0, 0, 0)
#' linker <- build_linker(my.data = my.data, variable_description = variable_description, 
#' variable_type = variable_type)
#' linker
#' }
#' 
#' @export

build_linker <- function(my.data, variable_description, variable_type) { 
  
  error <- FALSE
  
  df <- data.frame(
            var_name = names(my.data),
            var_desc = variable_description,
            var_type = ifelse(!variable_type %in% c(0, 1), error <- TRUE,
                          as.integer(variable_type)),
            stringsAsFactors = FALSE)
  
  if(error) {
    print("Error in variable_type. Values must be either 0 or 1 (integer values only).")
    
    } else {
      
      df
      
    }
  
}