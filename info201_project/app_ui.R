
library(shiny)
library(eeptools)

ui <- fluidPage(
  titlePanel("Info 201 project"),
  
  tabsetPanel(
    type = "tabs", id = "nav_bar",
    
    tabPanel(
      "Introduction",
      h1("Project Introduction"),
      h1("Reference")
      
    ),
    
    tabPanel(
      "Background",
      h1("History of Terroism attack"),
      h1("Why analysis of terroism data matter?")
    ),
    
    tabPanel(
      "Visualization 1",
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
  
    ),
    tabPanel(
      "Visualization 2",
      mainPanel(
        
      )
    ),
    tabPanel(
      "Visualization 3",
      mainPanel(
        
      )
      
    ),
    tabPanel(
      "Conclusion",
      h1("Conclusion"),
      h1("Project implication"),
      mainPanel(
        
      )
      
    ),
    tabPanel(
      "Technical Report",
      mainPanel(
        
      )
      
    ),
    tabPanel(
      "About Team",
      mainPanel(
        
      )
      
    )
  )
)
