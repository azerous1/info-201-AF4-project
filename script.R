library(dplyr)
library(knitr)
library(plotly)
library(leaflet)
library(ggplot2)

df <- read.csv(
  file = "./globalterrorismdb_0919dist.csv",
  stringsAsFactors = FALSE
)

ui <- fluidPage(
  sliderInput(
    inputId = "year", # key this value will be assigned to
    label = "Year", # label to display alongside the slider
    min = 1998, # minimum slider value
    max = 2018, # maximum slider value
    value = 1998 # starting value for the slider
  )
)

server <- function(input, output) {
  content <- paste(paste(df$city, ", ", df$country),
    paste(df$number_killed, " killed, ", df$number_injured, " injured"),
    paste("Weapon type:", df$weapon_type),
    paste("Targeted at ", df$targtype1_txt),
    sep = "<br/>"
  )
  map <- df %>%
    filter(year = input$year)
  leaflet() %>%
    addTiles() %>%
    addMarkers(
      lat = ~latitude,
      lng = ~longitude,
      popup = content
    )

  output$my_map <- renderLeaflet(map)
}
