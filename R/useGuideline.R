#' Get the correct document template for your analysis.
#'
#' @param type character vector of length 1 providing the desired research output.
#' @param specific character vector of length 1 providing the specific guideline - if this is not provided a default guideline will be used.
#' @param location character vector with the proper relative path where the files should be put. without the trailling slash
#' @param rename This is the name of a resulting file. Defaults to "paper.Rmd"
#' @return The function puts the desired template in the desired location.
#' @export

useGuideline <- function(type = NA,
                         specific = NA,
                         location = "analysis/paper",# without the trailling slash
                         rename = "paper.Rmd"){

  whichFile <- read.csv(system.file("extdata",
                                    "masterlist.csv",
                                    package ="reportingGuidelines"),
                        colClasses = "character")
  # Determine the file first - the main task of this function
  if(is.na(type)&is.na(specific)){
    stop("You need to provide the 'type' of your report (e.g. case, original, review)
         or a 'specific' guideline (e.g. CARE). See the help page.")
  } else if(type=="case") {
    fn <- whichFile$filename[whichFile$value=="case"] # the filename
    fromF <- system.file("templates",
                         fn,
                         package="reportingGuidelines")
  }
  #determine location to where should it be copied
  toF <- paste0(location,"/",rename)
  # now use these vars to copy the files
  fc <- file.copy(from = fromF,
                to = location,
                overwrite = T)
  #ifelse(fc==T,
  #       message("Copying success!"),
  #       stop("Copying went wrong..."))
  # And rename accordingly
  fr <- file.rename(from = paste0(location,"/",fn),
              to = paste0(location,"/",rename))
  #ifelse(fr==T,
  #       message("Renaming success!"),
  #       stop("Renaming went wrong..."))
  #from <- if(type = "")
  #file.copy()

}
#useGuideline(type = "case")

