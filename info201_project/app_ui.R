library(httr)
library(jsonlite)
library(shiny)
library(eeptools)


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
  
  mainPanel(
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



