library(stringr)

getPackageNames <- function(folder){
  # folder <- "LADCO/IntermediateR/DataManipulation1"
  files <- list.files(folder)
  files <- files[grepl("\\.Rmd$", files)]
  packages <- lapply(files, function(rmd_file){
    # rmd_file <- "DataManipulation1.Rmd"
    lines <- readLines(paste(folder, rmd_file, sep = "/"))
    libraries <- str_extract(lines, "library\\(.+\\)")
    libraries <- libraries[!is.na(libraries)]
    libraries <- sub("library\\(", "", libraries)
    libraries <- sub("\\)", "", libraries)
    libraries
  })
  unique(unlist(packages))
}

folders <- list.dirs("LADCO/IntermediateR")
folders <- folders[!grepl("rsconnect", folders)]

packages <- lapply(folders, getPackageNames)
packages <- unique(unlist(packages))
packages <- packages[!grepl("region5air", packages)]
packages <- packages[!grepl("raqdm", packages)]


