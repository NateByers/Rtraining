library(shiny)
library(leaflet)

# Define UI for application that plots time series
shinyUI(fluidPage(
  
  # Application title
  titlePanel("Chicago Air"),
  
  # Sidebar with a dropdown for selecting parameter
  sidebarLayout(
    sidebarPanel(
      leafletOutput("mymap"),
      selectInput("parameter",
                  "Select Parameter:",
                  c("Ozone" = "ozone",
                    "Temperature" = "temp",
                    "Solar Radiation" = "solar"))
    ),
    
    # Show a plot of the time series
    mainPanel(
      plotOutput("timePlot"),
      dataTableOutput("dataTable")
    )
  )
))