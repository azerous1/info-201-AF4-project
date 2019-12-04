library(httr)
library(jsonlite)
library(shiny)
library(eeptools)
library(leaflet)
library(shinythemes)

source("text.R")

attack_data <- read.csv(
  file = "./post_2000_arranged_terriosm_data.csv",
  stringsAsFactors = F
)

years <- c(
  "2000", "2001", "2002", "2003", "2004", "2005", "2006", "2007", "2008", "2009",
  "2010", "2011", "2012", "2013", "2014", "2015", "2016", "2017", "2018"
)

attack_type_choice <- attack_data$attack_type 



# the list of tab panel on our main page of shiny
page_one <- tabPanel(
  titlePanel("Introduction"),
  mainPanel(
    h1("Project Introduction"),
    p(introduction1),
    br(),
    p(introduction2)
  )
)

page_two <- tabPanel(
  titlePanel("Background"),
  mainPanel(
    h1("Problem situation"),
    p(background),
    h1("Research question"),
    p(
      strong("What are the potential correlations among weapons types, attack types,
       and casualty numbers in the global scope by regions over the last twenty years?")
      )
  )
)

page_three <- tabPanel(
  titlePanel("Visualizations"),
  mainPanel(
    tabsetPanel(
      tabPanel(
        "Global Terrorism incident by years",
        sidebarLayout(
          sidebarPanel(
            selectInput("year_select_1",
              label = h3("Select year", style = "color: white"),
              choices = years,
              selected = "2018"
            )
          ),
          mainPanel(
            h1("Terrorism incident for selected year"),
            leafletOutput("attack_map"),
            h1("Analysis"),
            p(Vis_1_analysis)
          )
        ),
        
      ),
      
      tabPanel(
        "Casualties within Countries by years",
        sidebarLayout(
          sidebarPanel(
            selectInput("year_select_2",
                        label = h3("Select year", style = "color: white"),
                        choices = years,
                        selected = "2018"
            )
          ),
          mainPanel(
            h1("Country map"),
            plotOutput("country_map"),
            h1("Analysis"),
            p(Vis_2_analysis)
          )
        )
      ),
      tabPanel(
        "Weapeon Types",
        sidebarLayout(
          sidebarPanel(
            selectInput("year_select_3",
              label = h3("Select year", style = "color: white"),
              choices = years,
              selected = "2018"
            ),
          ),
          mainPanel(
            
            h1("Casualty vs Weapeon type for selected year"),
            plotOutput("weapon"),
            h1("Analysis"),
            p(Vis_3_analysis)
          )
        )
      ),
      tabPanel(
        "Attack Types",
        sidebarLayout(
          sidebarPanel(
            selectInput(
              inputId = "attack_type", 
              label =  h3("Attack Type", style = "color: white"), 
              choices = attack_type_choice,
              selected = "Armed Assault"
            )
          ),
          mainPanel(
            h1("Casualties by Attack Types from 2000 to 2018"),
            plotOutput("attack_casualty"),
            h1("Analysis"),
            p(Vis_4_analysis)
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
    p("Through this project, we found that global terrorism is truly a complex, widely impacted,
        and terrifying threat in the 21st century. ", strong("Globally speaking, terrorism is the most severe 
        in terms of incident number and casualty number in the Middle East, Central America, and East
        and North Africa. Also, other areas like South Asia, South East Asia, Central Africa, 
        and the Northern part of South America suffer from terrorism frequently as well, 
        yet varied in different time over the last twenty years.")),
    br(),
    p(conclusion2),
    br(),
    p(
      strong("Because explosives and firearms are way more powerful in terms of lethality than other
      weapons do, attacks with these two types of weapons caused much more casualties than 
      the sum of other weapons. Attack type is a decisive element for casualty numbers since 
      facility attacks and hijacking normally do not intend to have a big impact on people, 
      and unarmed assault and assassination normally do not have a massive impact either. 
      After all, bomb/explosion and armed assault are the main reasons for large casualties 
      with a similar reason for weapon types. "), "In terms of geography and casualty numbers, 
      the highly dangerous areas that terrorist attacks would potentially take place also
      have more complexity pertaining to politics, religion, race, and other backgrounds.
      We suggest further potential research on global terrorism could work on the correlation
      among the above-mentioned element and weapon types by regions."),
    br(),
    p("Overall, we discovered a positive correlation between explosion 
      and armed attack and casualties numbers in the three region we mentioned"),
    br(),
    h1("Project implication"),
    p(implication)
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
  mainPanel(
    h1("About Team"),
    br(),
    h4("Yichi Zhang"),
    h4("Sophomore"),
    h4("Intended major: Informatics"),
    p(arthur),
    br(),
    h4("Clover Li"),
    h4("Sophomore"),
    h4("Intended major: Informatics"),
    p(clover),
    br(),
    h4("Xinye Li "),
    h4("Senior"),
    h4("Majors: Communication & International Studies "),
    h4("Minor: Informatics"),
    p(sarah),
    br(),
    h4("Jerry Wang"),
    h4("Sophomore"),
    h4("Intended major: Informatics"),
    p(jerry)
    
  )
)

# ui page
ui <- navbarPage(
  theme = shinytheme("superhero"),
  "Anti-Terrorisom",
  page_one,
  page_two,
  page_three,
  page_four,
  page_five,
  page_six
)
