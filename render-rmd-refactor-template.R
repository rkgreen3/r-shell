library(rmarkdown)
library(stringr)


parse_arguments <- function(files){
  
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
  return(files)
  ## Input: a vector with terminal input
  ## output: a vector of files to render
 
}

render_doc <- function(file){
  out_name <- str_split_fixed(string = file,
                              pattern = "[/|.]",
                              n = 3)
  out_name <- str_c(out_name[2], '.html')
  render("surveys-report.Rmd",
         output_file = out_name,
         output_dir = "reports",
         params = list(file = file))
  #input: a csv file to run the Rmd on
  #output: an .html file written to the reports folder.

}

render_docs <- function(files){
  for (file in files) {
    render_doc(file)
  }
  #input: a vector of file names
  #output: calls the render_doc function for each file

}

main<-function(){ 
  files <- commandArgs(trailingOnly = TRUE)
  render_docs(files)
  #call functions from above to render the documents
}

main() # calls the main function
