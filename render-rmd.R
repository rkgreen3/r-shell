require(rmarkdown)
require(knitr)
require(tidyverse)
require(stringr)

args <- commandArgs(trailingOnly = TRUE)

if("-a" %in% args) {
  folder <- args[2]
  args <- Sys.glob(str_c(folder, "/*.csv"))
  
  if(length(args) == 0){
    print("No files found in your folder dummy.")
  }
} else {args <- args}

if(length(args) == 0) {
  print("You must give me a file list! To give me all the files use -a.")
}

for (file in args) {
  out_name <- str_split_fixed(string = file,
                              pattern = "[/|.]",
                              n = 3)
  out_name <- str_c(out_name[2], '.html')
  render("surveys-report.Rmd",
         output_file = out_name,
         output_dir = "reports",
         params = list(file = file))
}

