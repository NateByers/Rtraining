rm(list = ls())
source("getPackageNames.R")

if(file.exists("install_packages.R")){
  unlink("install_packages.R")
}  

cat("library(", file = "install_pacakges.R", sep = "\n")
cat("c(", file = "install_pacakges.R", append = TRUE)
cat("'", packages[1], "'", file = "install_pacakges.R", sep = "", append = TRUE)
for(i in 2:length(packages)){
  cat(", '", packages[i], "'", file = "install_pacakges.R", sep = "", append = TRUE)
}
cat("))", file = "install_pacakges.R", sep = "", append = TRUE)

install_raqdm <- "\ndevtools::install_github('FluentData/raqdm@dev')"
install_region5air <- "\ndevtools::install_github('NateByers/region5air')"

cat(install_raqdm, file = "install_pacakges.R", sep = "", append = TRUE)
cat(install_region5air, file = "install_pacakges.R", sep = "", append = TRUE)
