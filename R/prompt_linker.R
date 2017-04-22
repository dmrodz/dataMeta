#' Build a linker data frame: prompt option.
#' 
#' \code{prompt_linker} this function will prompt the user for a variable 
#' description and variable type to construct a data frame that will be an 
#' intermediary between the original dataset and the data dictionary. This is a 
#' variation of the first function used in this package. For the function to run, 
#' the following parameters are needed.
#'
#' @param my.data Data.frame. The dataset for which the user is creating the 
#' dictionary for.
#' @return If the original dataset supplied as my.data is of class data.frame;
#' the variable description items are in the same order as the orignal dataset's 
#' variable names; and the variable_type intgeer vector values are 0 or 1, 
#' then a small data frame is produced with variable_names, variable_description, 
#' variable_type columns. This dataframe will serve as a linker daata frame to 
#' be able to construct the data dictionary.
#' 
#' @export

prompt_linker <- function(my.data) { 
  error <- FALSE
  
  df <- data.frame(var_name = names(my.data),
                   var_desc = rep("blank", length(names(my.data))),
                   var_type = rep("blank", length(names(my.data))),
                   stringsAsFactors = FALSE)
  
  
  for(i in 1:nrow(df)) {
    
    varname <- df$var_name[i]
    
    desc <- paste0("Enter description for '", varname, sep = "': ")
    type <- paste0("Enter variable type for '", varname, sep = "': ")
    
    df$var_desc[i] <- readline(desc)
    df$var_type[i] <- readline(type)
    
  }
  
  # These values must be integers. Either 0 or 1
  df$var_type <- as.integer(df$var_type)
  df$var_type <- ifelse(df$var_type %in% c(0, 1), as.integer(df$var_type),
                        error <- TRUE)
  if(error) {
    print("Error in variable_type. Values must be either 0 or 1.")
    
    } else {
      
      df
      
    }
  
}
