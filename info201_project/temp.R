library(dplyr)

# This file wranges relevant data and will be sourced into app.R
attack_data <- read.csv("post_2000_arranged_terriosm_data.csv",
                        stringsAsFactors = FALSE)
View(attack_data)

# Replace NA values with 0 and mutate to add casualty column
attack_data[is.na(attack_data)] <- 0
attack_data <- attack_data %>% mutate(casualty = number_killed + number_injured)
View(attack_data)

filtered_df <- attack_data %>% select(year, weapon_type, casualty)
View(filtered_df)

selected_year <- filtered_df %>% filter(year == "2000")
View(selected_year)
