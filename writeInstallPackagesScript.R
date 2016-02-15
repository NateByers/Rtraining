rm(list = ls())
source("getPackageNames.R")

if(file.exists("install_packages.R")){
  unlink("install_packages.R")
}  

cat("install.packages(", file = "install_packages.R", sep = "\n")
cat("c(", file = "install_packages.R", append = TRUE)
cat("'", packages[1], "'", file = "install_packages.R", sep = "", append = TRUE)
for(i in 2:length(packages)){
  cat(", '", packages[i], "'", file = "install_packages.R", sep = "", append = TRUE)
}
cat("), repos = 'http://cran.us.r-project.org');", file = "install_packages.R", sep = "", append = TRUE)
cat("\nlibrary(devtools);", file = "install_packages.R", sep = "", append = TRUE)

install_raqdm <- "\ninstall_github('FluentData/raqdm@dev', auth_token = NULL);"
install_region5air <- "\ninstall_github('NateByers/region5air', auth_token = NULL)"

cat(install_raqdm, file = "install_packages.R", sep = "", append = TRUE)
cat(install_region5air, file = "install_packages.R", sep = "", append = TRUE)
