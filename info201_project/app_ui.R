library(httr)
library(jsonlite)
library(shiny)
library(eeptools)


# the list of tab panel on our main page of shiny
page_one <- tabPanel(
  titlePanel("Introduction"),
  mainPanel(
    h1("Project Introduction")
  )
)

page_two <- tabPanel(
  titlePanel("Background"),
  mainPanel(
    h1("History of Terroism attack"),
    h1("Why analysis of terroism data matter?"),
    h1("Research question")
  )
)

page_three <- tabPanel(
  titlePanel("Visualizations"),
  mainPanel(
    tabsetPanel(
      tabPanel(
        "Visualization 1",
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
        "Visualization 2"
        
        
        
        
        ),
      tabPanel(
        "Visualization 3"
        
        
        
        )
    )
  )
)



page_four <- tabPanel(
  titlePanel("Conclusion"),
  mainPanel(
    h1("Project Conclusion"),
    h1("Project implication")
  )
)

page_five <- tabPanel(
  titlePanel("Tech-Report"),
  mainPanel(
    h1("Technical Report")
  )
)

page_six <- tabPanel(
  titlePanel("About Team"),
  mainPanel()
)

# ui page
ui <- navbarPage(
  "Info 201 Project",
  page_one,
  page_two,
  page_three,
  page_four,
  page_five,
  page_six
)
