library(dplyr)
library(shiny)
library(scales)
library(ggplot2)
library(shinythemes)
# This is the server for our project shiny

# The dataset of terroism attack from 2000 to 2018
attack_data <- read.csv(
  file = "./post_2000_arranged_terriosm_data.csv",
  stringsAsFactors = F
)

map.world <- read.csv(
  file = "./world_data.csv",
  stringsAsFactors = F
)

# Replace NA values with 0 and mutate to add "casualty" column
attack_data[is.na(attack_data)] <- 0
attack_data <- attack_data %>%
  mutate(casualty = number_killed + number_injured)

server <- function(input, output) {
  
  # Visualization 1
  output$attack_map <- renderLeaflet({
    filtered_data <- attack_data %>%
      filter(year == input$year_select_1)
    
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
  
  # Visualizaiton # 1a 
  output$country_map <- renderPlot({
    years <- input$year_select_2
    
    # match & filter certain country 
    re_named_data <- attack_data %>%
      mutate(country = recode(country,
                              `United Kingdom` = "UK", `United States` = "USA", `Bosnia-Herzegovina` = "Bosnia and Herzegovina",
                              `Republic of the Congo` = "Democratic Republic of the Congo",
                              `Serbia-Montenegro` = "Serbia", `Slovak Republic` = "Slovakia"
      )) %>%
      filter(country != "Yugoslavia" &
               country != "East Timor" &
               country != "West Bank and Gaza Strip" &
               country != "St. Lucia" &
               country != "International" 
      )
    
    # arranged data
    arranged_data <- re_named_data %>%
      mutate(total_victim = number_killed + number_injured) %>%
      filter(year == years) %>%
      group_by(country) %>%
      summarise(total_death = sum(total_victim, na.rm = T)) 
    
    map.attack <- left_join(map.world, arranged_data, by = c('region' = 'country')) 
    
    # plotting
    
    map.attack[is.na(map.attack)] <- 0
    
    ggplot(map.attack, mapping = aes( x = long, y = lat, group = group )) +
      geom_polygon(aes(fill = total_death)) 
    
  })
  
  # Visualization 2 
  output$weapon <- renderPlot({
    
    attack_data[is.na(attack_data)] <- 0
    attack_data <- attack_data %>%
      mutate(casualty = number_killed + number_injured)
    
    filtered_df <- attack_data %>%
      select(year, weapon_type, casualty)
    
    
    selected_year <- filtered_df %>% 
      filter(year == input$year_select_3)
    ggplot(data = selected_year) +
      coord_flip() +
      geom_bar(mapping = aes(x = weapon_type, y = casualty), 
               stat = "identity", fill = "gold", alpha = "0.75") +
      labs(title = "Casualty vs. Weapon Types from 2000 to 2018",
           x = "Weapon Types",
           y = "Casualty")
  })
  
  #Vis #3
  output$attack_casualty <- renderPlot({
    attack_data[is.na(attack_data)] <- 0
    attack_data <- attack_data %>%
      mutate(casualty = number_killed + number_injured)
    
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
