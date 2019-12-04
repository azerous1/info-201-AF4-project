
#==============
# LOAD PACKAGES
#==============

library(tidyverse)
library(sf)
library(rvest)
library(stringr)
library(scales)
library(dplyr)
library(tidyr)
library(ggplot2)
#library(viridis)

# install.packages("scales")

# The dataset of terroism attack from 2000 to 2018
attack_data <- read.csv(
  file = "./post_2000_arranged_terriosm_data.csv",
  stringsAsFactors = F
)

# recode conflict country names 
country_attack_data <- attack_data 

uniques <- unique(attack_data$country)

m1 <- matrix(uniques, ncol=1, byrow=TRUE)
d1 <- as.data.frame(m1, stringsAsFactors=FALSE)

names(d1) <- c("country")

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
  filter(year == 2018) %>%
  group_by(country) %>%
  summarise(total_death = sum(total_victim, na.rm = T)) 

map.world <- map_data('world')


write.csv(map.world, "./world_data.csv", row.names = FALSE)

view(map.world)




new_data <- anti_join(arranged_data, map.world, by = c('country' = 'region'))

view(arranged_data)


map.attack <- left_join(map.world, arranged_data, by = c('region' = 'country')) 

message <- paste0("")

ggplot(map.attack, mapping = aes( x = long, y = lat, group = group )) +
  geom_polygon(aes(fill = total_death)) +
  scale_fill_gradientn(colours = c('#461863','#404E88','#2A8A8C','#7FD157','#F9E53F')
                       ,values = scales::rescale(c(10,50,100,1000,10000))
                       ,labels = comma
                       ,breaks = c(10,50,100,1000,10000)
  ) +
  guides(fill = guide_legend(reverse = T)) +
  labs(fill = 'Total Casuality'
       ,title = 'Terroist attack casuality by Country'
       ,subtitle = 'Person per country'
       ,x = NULL
       ,y = NULL) +
  theme(text = element_text(family = 'Gill Sans', color = '#EEEEEE')
        ,plot.title = element_text(size = 28)
        ,plot.subtitle = element_text(size = 14)
        ,axis.ticks = element_blank()
        ,axis.text = element_blank()
        ,panel.grid = element_blank()
        ,panel.background = element_rect(fill = '#333333')
        ,plot.background = element_rect(fill = '#333333')
        ,legend.position = c(.18,.36)
        ,legend.background = element_blank()
        ,legend.key = element_blank()
  ) 


+
  scale_fill_gradientn(colours = c('#461863','#404E88','#2A8A8C','#7FD157','#F9E53F')
                       ,values = scales::rescale(c(10,50,100,1000,10000))
                       ,labels = comma
                       ,breaks = c(10,50,100,1000,10000)
  ) +
  guides(fill = guide_legend(reverse = T)) +
  labs(fill = 'Total Casuality'
       ,title = 'Terroist attack casuality by Country'
       ,subtitle = 'Person per country'
       ,x = NULL
       ,y = NULL) +
  theme(text = element_text(family = 'Gill Sans', color = '#EEEEEE')
        ,plot.title = element_text(size = 28)
        ,plot.subtitle = element_text(size = 14)
        ,axis.ticks = element_blank()
        ,axis.text = element_blank()
        ,panel.grid = element_blank()
        ,panel.background = element_rect(fill = '#333333')
        ,plot.background = element_rect(fill = '#333333')
        ,legend.position = c(.18,.36)
        ,legend.background = element_blank()
        ,legend.key = element_blank()
  ) 

ggplot(map.attack, mapping = aes( x = long, y = lat, group = group )) +
  geom_polygon(aes(fill = total_death)) 



View(attack_data)
  