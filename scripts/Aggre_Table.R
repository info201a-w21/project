library(tidyverse)
library(dplyr)

suicide_rate <- read.csv("https://raw.githubusercontent.com/info201a-w21/project_AF/main/data/suicide%20rate.csv?token=ASMKXP6DHKSYGYDADA7KGKDAGTXAU")
WHR_2016 <- read.csv("https://raw.githubusercontent.com/info201a-w21/project_AF/main/data/WHR2020/2016.csv?token=ASMKXP4TURU76S7WXIB7363AGTWZS")
Alcohol_Consumption <- read_csv("https://raw.githubusercontent.com/info201a-w21/project_AF/main/data/HappinessAlcoholConsumption.csv?token=ASMKXPZIFESXAGIONVNMDYDAGT43Y")

happiness_by_country <- WHR_2016 %>%
  group_by(Country) %>%
  select(Happiness.Score, Happiness.Rank) 

beer_consumption <- Alcohol_Consumption %>%
  group_by(Country) %>%
  select(Beer_PerCapita) %>%
  left_join(happiness_by_country, by = "Country")

suicide_2016 <- suicide_rate %>%
  filter (X.1  == "2016") %>%
  group_by(X) %>%
  select(Crude.suicide.rates..per.100.000.population.) %>%
  rename(Country = "X") %>%
  rename(suicide_rate_per_100000_population = "Crude.suicide.rates..per.100.000.population.") %>%
  left_join(beer_consumption, by = "Country")
  
  



