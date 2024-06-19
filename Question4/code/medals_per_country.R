#medals per country
medals_per_country <- function(adj_data) {
    medals <- adj_data %>%
        group_by(Country) %>%
        mutate(team_medals = n()) %>%
        distinct(Country, team_medals) %>%
        mutate(Code = Country) #for future use
    medals
}

