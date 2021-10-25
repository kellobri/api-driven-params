#
# This is a Plumber API. You can run the API by clicking
# the 'Run API' button above.
#
# Find out more about building APIs with Plumber here:
#
#    https://www.rplumber.io/
#

library(plumber)
library(dplyr)

hospitals <- c("Central Hospital",
               "Military Hospital",
               "Port Hospital",
               "St. Mark's Maternity Hospital (SMMH)")

#* Protect against an invalid hospital
#* @filter checkHospital
function(req, res) {
  if (!is.null(req$args$hospital) && !req$args$hospital %in% hospitals) {
    res$status <- 400
    return(
      list(
        error = paste(
          "The hospital requested is not in our system. Please use one of",
          paste(
            "'", hospitals, "'",
            sep = "", collapse = ", "
          )
        )
      )
    )
  } else {
    plumber::forward()
  }
}

#* Generate a hospital administration report for distribution
#* @param hospital Should be the hospital name
#* @param report Should be the report type
#* @serializer html
#* @get /report
function(hospital, report) {

  outfile <- paste0(hospital, '-', report, '.html') # name the outfile

  rmarkdown::render(
    'hospital-report.Rmd',
    output_file = outfile, # save it during rendering
    params = list(
      hospital = hospital,
      report = report
    )
  )

  #read the outfile and return it
  readBin(outfile, "raw", n = file.info(outfile)$size)
}
