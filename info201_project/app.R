library(shiny)
library(devtools)
library(tidyr)
library(ggplot2)
library(leaflet)
library(dplyr)
library(rsconnect)

source("app_server.R")
source("app_ui.R")

# Run the application
shinyApp(ui = ui, server = server)
