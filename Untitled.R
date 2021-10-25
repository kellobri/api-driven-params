

hospitals <- c("Central Hospital",
               "Military Hospital",
               "Port Hospital",
               "St. Mark's Maternity Hospital (SMMH)")

# type <- c("Weekly", "Monthly", "Annual")

for(i in 1:length(hospitals)){
  rmarkdown::render(
    input = "surveillance_report.Rmd",
    output_file = str_glue("output/Report_{hospitals[i]}_{Sys.Date()}.docx"),
    params = list(hospital  = hospitals[i]))
}



