# install.packages("rsconnect")
library(shiny)
library(leaflet)
library(dplyr)
library(rsconnect)
source("temp.R")

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
  titlePanel("Visualization 1"),
  h1("Global Terrorist attack from 2000 to 2018"),
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
  titlePanel("Visualization 2"),
  sidebarPanel(
    sliderInput(
      inputId = "time", # key this value will be assigned to
      label = "Year", # label to display alongside the slider
      min = 2000, # minimum slider value
      max = 2018, # maximum slider value
      value = 2000 # starting value for the slider
    )
  ),
  mainPanel(
    plotOutput("weapon")
  )
)

page_five <- tabPanel(
  titlePanel("Visualization 3"),
  mainPanel(
    tabsetPanel(
      tabPanel("Project Conclusion", ""),
      tabPanel("Project implication", "")
    )
  )
)

page_six <- tabPanel(
  titlePanel("Conclusion"),
  mainPanel(
    tabsetPanel(
      tabPanel("Project Conclusion", ""),
      tabPanel("Project implication", "")
    )
  )
)

page_seven <- tabPanel(
  titlePanel("Tech-Report"),
  mainPanel(
    tabsetPanel(
      tabPanel("Technical Report", "")
    )
  )
)

page_eight <- tabPanel(
  titlePanel("About Team"),
  mainPanel(
    tabsetPanel(
      #tabPanel("Technical Report", "")
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
  page_five,
  page_six,
  page_seven,
  page_eight
)

# Server 
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
  
  # Visualization 2
  output$weapon <- renderPlot({

    selected_year <- filtered_df %>% filter(year == input$time)
    ggplot(data = selected_year) +
      coord_flip() +
      geom_bar(mapping = aes(x = weapon_type, y = casualty), 
               stat = "identity", fill = "gold", alpha = "0.75") +
      labs(title = "Casualty vs. Weapon Types from 2000 to 2018",
           x = "Weapon Types",
           y = "Casualty")
  })
}

# Run the application
shinyApp(ui = ui, server = server)
