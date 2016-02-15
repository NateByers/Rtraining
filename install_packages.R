install.packages(
                 c('dplyr', 'devtools', 'RSQLite', 'shiny', 'leaflet', 'plotly',
                   'ggplot2', 'maps', 'choroplethr', 'sp', 'openair', 'tidyr', 
                   'spacetime', 'rmarkdown'), 
                 repos = 'http://cran.us.r-project.org', dependencies = TRUE
                 )
library(devtools)
install_github('FluentData/raqdm@dev', auth_token = NULL)
install_github('NateByers/region5air', auth_token = NULL)