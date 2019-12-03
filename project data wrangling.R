
library(dplyr)
library(plotly)
library(ggplot2)
library(shiny)


homeless_by_county <- read.csv(file = "./data/arranged_data.csv")

data <- homeless_by_county %>%
  filter(grepl("City",CoC.Name))


# terriosm data jijuku~Untitled document

terriosm_data <- read.csv(file = "./data/GlobalTerrorismDb.csv", stringsAsFactors = F)


arranged_terriosm_data <- terriosm_data %>%
  select(year, country, region_txt, city, latitude, longitude, number_killed, number_injured, targtype1_txt, attack_type, weapon_type, success)

write.csv(arranged_terriosm_data, "./data/arranged_terriosm_data.csv", row.names = FALSE)

# filter
# - to 2018 0nly
# - U.S.only
# - select: country, location(long, lat), killed, time(yeah, month, date), city, weaptype, #of fatalities(nkill), # of injuries n(wound)

data_2018 <- arranged_terriosm_data %>%
 filter(number_killed > 0 & year >= 2000 & success == 1) %>%
 select(year, country, region_txt, city, latitude, longitude, number_killed, number_injured, targtype1_txt, attack_type, weapon_type)
  
names(data_2018) <- c("year", "country", "region", "city", "latitude", "longitude", "number_killed", "number_injured", "target_type", "attack_type", "weapon_type")


write.csv(data_2018, "./data/post_2000_arranged_terriosm_data.csv", row.names = FALSE)

# grouped by - country, v



  






