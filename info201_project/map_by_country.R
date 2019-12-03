
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

arranged_data <- attack_data %>%
  mutate(total_victim = number_killed + number_injured) %>%
  filter(year == 2018) %>%
  group_by(country) %>%
  summarise(total_death = sum(total_victim, na.rm = T)) 


ggplot(arranged_data, mapping = aes( x = long, y = lat, group = group )) +
  geom_polygon(aes(fill = total_death))

  