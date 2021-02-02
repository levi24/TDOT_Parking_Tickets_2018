#Purpose: Use opendatatoronto to get data about Toronto Parking tickets
#Author: Rachit Srivastava
#Date: January 29, 2021


# Workplace setup
#install.packages("opendatatoronto")
#install.packages("tidyverse") 
#install.packages("dplyr")
#install.packages("janitor")

library(opendatatoronto)
library(tidyverse)
library(dplyr)
library(janitor)

# Get_data
#all_green_p_parking <-
  #opendatatoronto::search_packages("Green P Parking") %>% 
  #opendatatoronto::list_package_resources() %>%
  #filter(name == "green-p-parking-2019") %>%
  #group_split(name) %>%
  #select() %>%
  #opendatatoronto::get_resource()

all_neighbourhood_profiles <-
  opendatatoronto::search_packages("Neighbourhood Profiles") %>% 
  opendatatoronto::list_package_resources() %>%
  filter(name == "neighbourhood-profiles-2016-csv") %>%
  opendatatoronto::get_resource()

all_neighbourhood_profiles <-
  janitor::clean_names(all_neighbourhood_profiles)

clean_neighbourhood_profiles <- 
  all_neighbourhood_profiles %>%
  
  filter(category == "Population", 
         topic == "Age characteristics"
  ) %>%
  
  select(category, 
         topic, 
         characteristic, 
         city_of_toronto)

##Attempt at doing a pie chart

#organize_neighbourhood <-
#ggplot(clean_neighbourhood_profiles, aes(x="", y = characteristic, fill = characteristic)) +
#geom_bar(width = 1, stat = "identity")
#organize_neighbourhood
#neighbourhood_pie <- organize_neighbourhood + coord_polar("y")
#neighbourhood_pie



