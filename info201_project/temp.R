library(dplyr)

# This file wranges relevant data and will be sourced into app.R
attack_data <- read.csv("./data/post_2000_arranged_terriosm_data.csv",
                        stringsAsFactors = FALSE)
View(attack_data)

# Replace NA values with 0 and mutate to add casualty column
attack_data[is.na(attack_data)] <- 0
attack_data <- attack_data %>%
  mutate(casualty = number_killed + number_injured)
View(attack_data)

filtered_df <- attack_data %>% select(year, weapon_type, casualty)
View(filtered_df)

selected_year <- filtered_df %>% filter(year == "2000")
View(selected_year)


# Visualization 2
output$weapon <- renderPlot({
  
  selected_year <- filtered_df %>% 
    filter(year == input$time)
  ggplot(data = selected_year) +
    coord_flip() +
    geom_bar(mapping = aes(x = weapon_type, y = casualty), 
             stat = "identity", fill = "gold", alpha = "0.75") +
    labs(title = "Casualty vs. Weapon Types from 2000 to 2018",
         x = "Weapon Types",
         y = "Casualty")
})


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