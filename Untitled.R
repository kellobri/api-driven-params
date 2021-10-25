

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



library(tibble)
outcomes <- tribble(
  ~hospital, ~deaths, ~recoveries, ~no_outcome,
  "Central Hospital", 45, 450, 200,
  "Military Hospital", 50, 230, 100,
  "Port Hospital", 12, 345, 90,
  "St. Mark's Maternity Hospital (SMMH)", 6, 290, 80
)

library(pins)
board_rsconnect(server = "rsc.radixu.com") %>%
  pin_write(outcomes, access_type = "all")
