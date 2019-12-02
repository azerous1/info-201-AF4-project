library(dplyr)
library(httr)
library(jsonlite)
library(shiny)
library(DT)
library(eeptools)


# This is the server for our project shiny

# The dataset of terroism attack from 2000 to 2018
attack_data <- read.csv(
  file = "./post_2000_arranged_terriosm_data.csv",
  stringsAsFactors = F
)


server <- function(input, output) {
  
  # Visualization 1
  output$attack_map <- renderLeaflet({
    filtered_data <- attack_data %>%
      filter(year == input$year)
    
    leaflet(data = filtered_data) %>%
      addProviderTiles("CartoDB.Positron") %>%
      addCircleMarkers(
        lat = filtered_data$latitude,
        lng = filtered_data$longitude,
        color = "red",
        popup = paste(
          sep = "<br/>",
          paste("City: ", filtered_data$city),
          paste("Number Killed: ", filtered_data$number_killed),
          paste("Number Injured: ", filtered_data$number_injured)
        ),
        radius = sqrt(filtered_data$number_killed) * 2,
        stroke = FALSE
      )
  })
  
 
}
