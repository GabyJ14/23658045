#medals per year and country
medals_per_year_country <- function(adj_data) {
    medals <- adj_data %>%
        group_by(Year, Country) %>%
        mutate(team_medals = n()) %>%
        distinct(Year, Country, team_medals ) %>%
        mutate(Code = Country)   #for future use
    medals
}
