require(rmarkdown)
require(knitr)
require(tidyverse)

args <- commandArgs(trailingOnly = TRUE)

render("surveys-report.Rmd",
       output_dir = "reports",
       params = list(file = args))
