library(httr)
library(jsonlite)
library(shiny)
library(eeptools)
library(leaflet)

source("text.R")

attack_data <- read.csv(
  file = "./post_2000_arranged_terriosm_data.csv",
  stringsAsFactors = F
)

years <- c(
  "2000", "2001", "2002", "2003", "2004", "2005", "2006", "2007", "2008", "2009",
  "2010", "2011", "2012", "2013", "2014", "2015", "2016", "2017", "2018"
)

# the list of tab panel on our main page of shiny
page_one <- tabPanel(
  titlePanel("Introduction"),
  mainPanel(
    h1("Project Introduction"),
    p(introduction)
  )
)

page_two <- tabPanel(
  titlePanel("Background"),
  mainPanel(
    h1("Problem situation"),
    p(background),
    h1("Research question"),
    p(research_questions)
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
            selectInput("year_select_1",
              label = h3("Select year", style = "color: black"),
              choices = years,
              selected = "2018"
            )
          ),
          mainPanel(
            leafletOutput("attack_map")
          )
        ),
        sidebarLayout(
          sidebarPanel(
            selectInput("year_select_2",
              label = h3("Select year", style = "color: black"),
              choices = years,
              selected = "2018"
            )
          ),
          mainPanel(
            h1("Country map"),
            plotOutput("country_map")
          )
        )
      ),
      tabPanel(
        "Visualization 2",
        sidebarLayout(
          sidebarPanel(
            selectInput("year_select_3",
              label = h3("Select year", style = "color: black"),
              choices = years,
              selected = "2018"
            ),
          ),
          mainPanel(
            plotOutput("weapon"),
            h1("Analysis"),
            p(Vis_2_analysis)
          )
        )
      ),
      tabPanel(
        "Visualization 3",
        sidebarLayout(
          sidebarPanel(
            selectInput(
              inputId = "attack_type", # key this value will be assigned to
              label = "Attack type", # label to display alongside the slider
              choices = attack_data$attack_type,
              selected = "Armed Assault"
            )
          ),
          mainPanel(
            plotOutput("attack_casualty"),
            h1("Analysis"),
            p(Vis_3_analysis)
          )
        )
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
    h1("Technical Report"),
    includeMarkdown("info_201_tech_report.md")
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
