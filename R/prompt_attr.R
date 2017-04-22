#' Incorporate attributes as metadata to an original dataset as prompted by the 
#' function.
#' 
#' \code{prompt_attr} adds attributes to an original dataset as metadata, 
#' including a data dictionary, among other attributes as prompted by the function.
#' 
#' This is a variation of the third function used in this package. For the function 
#' to run, the following parameters are needed.
#'
#' @param my.data Data.frame. The data set to add attributes as metadata.
#' @param data.dictionary Data frame. The data dictionary has all variable names, 
#' and variable descriptions that will explain an original dataset.
#' @return This function will return an R dataset containing metadata stored in its 
#' attributes. The function will prompt the user for a main description. Attributes 
#' added will include: a data dictionary, the name of the author or user who 
#' created the dictionary and added it, the time when it was last edited and a
#' brief description of the original dataset.
#' 
#' @export

prompt_attr <- function(my.data, data.dictionary) {
  
  main_string <- paste0("Enter dataset main description: ")
  
  attr(my.data, 'main') <- readline(main_string)
  attr(my.data, 'dict') <- data.dictionary
  attr(my.data, 'last_edit_date') <- Sys.time()
  attr(my.data, 'author') <- Sys.info()[['user']]
  
  my.data
  
}