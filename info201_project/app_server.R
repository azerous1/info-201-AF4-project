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

# Replace NA values with 0 and mutate to add “casualty” column
attack_data[is.na(attack_data)] <- 0
attack_data <- attack_data %>%
  mutate(casualty = number_killed + number_injured)
View(attack_data)

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
  
  output$attack_casualty <- renderPlot({
    vis3_data <- attack_data %>% 
      filter(attack_type == input$attack_type) %>% 
      group_by(year) %>% 
      summarise(total_casualty = sum(casualty)) %>% 
      select("year", "total_casualty")
    
    ggplot(data = vis3_data) +
      coord_flip() +
      geom_bar(mapping = aes(x = year, y = total_casualty), 
               stat = "identity", fill = "steelblue", alpha = "0.75") +
      labs(title = "Casualties by Attack Types from 2000 to 2018",
           x = "Year", y = "Total Casualty") +
      theme(text = element_text(size=15)) +
      scale_x_continuous(breaks = 2000:2018)
  })
}

