#' Save dataset with attributes.
#' 
#' \code{save_it} saves datset with attributes stored as metadata as an R 
#' dataset (.rds) into the current working directory. This is the final function 
#' used in this package. For the function to run, the following parameters are needed.
#'
#' @param x Data.frame. Dataset that has attributes added, including a data dictionary.
#' @param name_of_file Text string to name the file.
#' @return This function will save the dataset along with its attributes as an R
#' dataset (.rds) to the current working directory.
#' @examples
#' # example original data set for which a dictionary will be made
#' data("esoph")
#' my.data <- esoph
#' 
#' # Linker: Add description for each variable names and variable type
#' variable_description <- c("age group in years", "alcohol consumption in gm/day", 
#' "tobacco consumption in gm/day", "number of cases (showing a range)", 
#' "number of controls (showing range)")
#' 
#' variable_type <- c(0, 0, 0, 0, 0)
#' 
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
#' # Save it
#' # Name of file
#' name_of_file <- "my new data set"
#' save_it(x = complete_dataset, name_of_file = name_of_file)
#' 
#' @export

save_it <- function(x, name_of_file) {
  
  saveRDS(x, paste0(name_of_file, sep = ".rds"))
  
}