#adjusting the summer and winter olympics for team sports, so that the medal is only counted once for the country.
adj_data_team <- function(data) {

    library(tidyverse)

    adjusted <-
        data %>%
        group_by(Year, City, Sport, Discipline, Country, Gender, Event, Medal) %>%
        summarise(medal_count = n(), .groups = 'drop') %>%
        mutate(team_sport = ifelse(medal_count>1, TRUE, FALSE)) %>%
        mutate(new_medal_cnt = ifelse(team_sport, 1, medal_count)) %>%
        ungroup()

    adjusted


}