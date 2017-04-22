#' Incorporate attributes as metadata to an original dataset.
#' 
#' \code{incorporate_attr} adds attributes to an original dataset as metadata, 
#' including a data dictionary, among other attributes. This is the third function 
#' used in this package. For the function to run, the following parameters are needed.
#'
#' @param my.data Data.frame. The data set to add attributes as metadata.
#' @param data.dictionary Data frame. The data dictionary has all variable names, 
#' and variable descriptions that will explain an original dataset.
#' @param main_string A character string describing the original dataset.
#' @return This function will return an R dataset containing metadata stored in 
#' its attributes. Attributes added will include: a data dictionary, number of columns, 
#' number of rows, the name of the author or user who created the dictionary and added it,
#' the time when it was last edited and a brief description of the original dataset.
#' @examples
#' # example original data set for which a dictionary will be made
#' data("esoph")
#' my.data <- esoph
#' 
#' # Linker: Add description for each variable names and variable type
#' variable_description <- c("age group in years", "alcohol consumption in gm/day", 
#' "tobacco consumption in gm/day", "number of cases (showing range)", 
#' "number of controls (showing range)")
#' variable_type <- c(0, 0, 0, 0, 0)
#' linker <- build_linker(my.data = my.data, variable_description = variable_description, 
#' variable_type = variable_type)
#' linker
#' 
#' # Data dictionary
#' # For this data set, no further option description is needed.
#' dictionary <- build_dict(my.data = my.data, linker = linker, option_description = NULL, 
#' prompt_varopts = FALSE)
#' dictionary
#' 
#' # Create main_string for attributes
#' main_string <- "This dataset describes tobacco and alcohol consumption at different age groups."
#' complete_dataset <- incorporate_attr(my.data = my.data, data.dictionary = dictionary, 
#' main_string = main_string)
#' complete_dataset
#' attributes(complete_dataset)
#' 
#' @export

incorporate_attr <- function(my.data, data.dictionary, main_string) {
  
  attr(my.data, 'main') <- main_string
  attr(my.data, 'dictionary') <- data.dictionary
  attr(my.data, 'last_edit_date') <- Sys.time()
  attr(my.data, 'author') <- Sys.info()[['user']]
  
  my.data  

  
}

