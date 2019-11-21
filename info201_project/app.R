library(shiny)
library(leaflet)
library(dplyr)
library(rsconnect)

# The dataset of terroism attack from 2000 to 2018
attack_data <- read.csv(
  file = "./data/post_2000_arranged_terriosm_data.csv",
  stringsAsFactors = F
)

# the list of tab panel on our main page of shiny
page_one <- tabPanel(
  titlePanel("Introduction"),
  mainPanel(
    tabsetPanel(
      tabPanel("Project Introduction", ""),
      tabPanel("Reference", "")
    )
  )
)

page_two <- tabPanel(
  titlePanel("Background"),
  mainPanel(
    tabsetPanel(
      tabPanel("History of Terroism attack", ""),
      tabPanel("Why analysis of terroism data matter?", ""),
      tabPanel("Research question", "")
    )
  )
)

page_three <- tabPanel(
  titlePanel("Data Visualization"),
  h1("Global Terroist attack from 2000 to 2018"),
  sidebarLayout(
    sidebarPanel(
      sliderInput(
        inputId = "year", # key this value will be assigned to
        label = "Year", # label to display alongside the slider
        min = 2000, # minimum slider value
        max = 2018, # maximum slider value
        value = 2000 # starting value for the slider
      )
    ),
    mainPanel(
      leafletOutput("attack_map")
    )
  )
)

page_four <- tabPanel(
  titlePanel("Conclusion"),
  mainPanel(
    tabsetPanel(
      tabPanel("Project Conclusion", ""),
      tabPanel("Prjoject implication", "")
    )
  )
)

page_five <- tabPanel(
  titlePanel("Tech-Report"),
  mainPanel(
    tabsetPanel(
      tabPanel("Technical Report", "")
    )
  )
)

# ui page
ui <- navbarPage(
  "Info 201 Project",
  page_one,
  page_two,
  page_three,
  page_four,
  page_five
)

# Server 
server <- function(input, output) {
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

# Run the application
shinyApp(ui = ui, server = server)
