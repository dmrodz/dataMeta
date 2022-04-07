#' Build a data dictionary for a dataset.
#' 
#' \code{build_dict} constructs a data dictionary for a dataset with the aid of 
#' a data linker. This is the second function used in this package. For the function 
#' to run, the following parameters are needed.
#'
#' @param my.data Data.frame. The data set for which the user is creating the 
#' dictionary for.
#' @param linker Data.frame. A data frame that has the variable names from the 
#' original dataset, and also a variable type that will tell the dictionary whether 
#' to list unique item options or--if possible--a range of values for each variable name.
#' @param option_description A vector that has the description of each variable 
#' option in the order in which these appear and depending on how the variable type 
#' was set while building the linker data frame. If using the prompt_varopts option, 
#' this value must be NULL.
#' @param prompt_varopts Logical. Whether to add the option_description manually 
#' as prompted by R. Default is set to TRUE. If FALSE, an option_description vector 
#' must be provided.
#' @param na.rm Logical. Whether to remove \code{NA} when determining the range 
#' for variables with \code{variable_type == 0} in \code{linker}
#' @return A data frame that will serve as a data dictionary for an original dataset. 
#' The user will have the option to add this dictionary as an attribute to the original 
#' dataset with the other package functions.
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
#' @export

build_dict <- function(my.data, linker, option_description = NULL, prompt_varopts = TRUE,
                       na.rm = FALSE) {
  
  error1 <- FALSE
  error2 <- FALSE
  
  variable_name <- NULL
  variable_description <- NULL
  variable_options <- NULL
  
  data_list = list()

  classes = unname(sapply(my.data, function(x) {
    class(x)[1]
  }))
  
  for(i in 1:length(names(my.data))) {
    
    var.options <-
      ifelse(linker$var_type[i] == 1 & linker$var_name[i] == names(my.data[i]),
        unique(my.data[i]),
        # create ranges where possible
        ifelse(classes[i] %in% c("numeric", "integer"),
          paste(range(my.data[, i], na.rm = na.rm),
            sep = "", collapse = " to "
          ),
          ""
        )
      )
    
    d <- data.frame(
          variable_name = names(my.data[i]),
          variable_options = var.options,
          stringsAsFactors = FALSE
    )
    
    d$i <- i
    data_list[[i]] <- d
    colnames(data_list[[i]]) <- c("variable_name", "variable_options", "i")
    
    dict = do.call(rbind, data_list)
    
    dict <- as.data.frame(dict)
    dict <- dplyr::select(dict, -i)
    
  }
  
   # dict
   colnames(linker) <- c("variable_name", "variable_description", "var_type")
   
   dict_df <- Reduce(function(...) merge(..., all = TRUE), list(dict, linker))
   dict_df <- dplyr::select(dict_df, variable_name, variable_description,
                            variable_options)
   
   dictdf <- dplyr::mutate(
     dict_df,
     variable_name = ifelse(duplicated(variable_name), " ", as.character(variable_name)),
     
     variable_description = ifelse(duplicated(variable_description), " ",
                                   as.character(variable_description))
   )
   
   dictdf <- as.data.frame(dictdf)
   
   
   # Add option description (optional) 
   if(prompt_varopts && !is.null(option_description)) {
     
     error1 <- TRUE
     
   } else if(prompt_varopts == FALSE && is.null(option_description)) {
     
     data.dictionary <- dictdf
     
   } else if(prompt_varopts == FALSE && length(option_description) != nrow(dictdf) && 
             !is.null(option_description)) {
     
     error2 <- TRUE
     
   } else if(!is.null(option_description) && prompt_varopts == FALSE) {
     
     df <- cbind(dictdf, option_description)
     
     data.dictionary <- df
     
     colnames(data.dictionary) <- c("variable name", 
                                    "variable description", 
                                    "variable options", 
                                    "notes")
     data.dictionary
     
   } else if(prompt_varopts && is.null(option_description)) {
     
     for(i in 1:nrow(dict_df)) {
       
       varopt <- dict_df$variable_options[i]
       varname <- dict_df$variable_name[i]
       opts <- paste0("Enter description for variable '", 
                      varname, sep="' and option '", varopt, sep="': ")
       
       dictdf$option_desc[i] <- readline(opts)
       
       }
     
     data.dictionary <- dictdf
     
     colnames(data.dictionary) <- c("variable name", 
                                    "variable description", 
                                    "variable options", 
                                    "notes")
     
     data.dictionary
     
   } 
   
   if(error1) {
     stop("When prompt_varopts is TRUE, option_description must be NULL.")
     
   }
   
   if(error2) {
     stop("If prompt_varopts == FALSE, the length of option_description must match the number of variable options OR option_description should be NULL. Please, consider the var_type used in the linker.")
     
   }
   
   data.dictionary
}
