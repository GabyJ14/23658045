#football map
football_map_world <- function(sport_df, Title) {
    football_df <- sport_df %>%
        filter(Sport == "Football") %>%
        filter(Gender == "Men") %>%
        group_by(Country) %>%
        mutate(team_medals = n()) %>%
        distinct(Country, team_medals)



    world <- map_data("world")
    winners <- subset(world, region %in% c("Belgium", "France", "UK", "Canada", "USA", "Denmark", "Netherlands", "Spain", "Switzerland", "Sweden", "Uruguay", "Argentina", "Italy", "Austria", "Norway", "Yugoslavia", "Hungary", "Bulgaria", "Russia", "Czechoslovakia", "Japan", "Poland", "Brazil", "Germany", "Ghana", "Nigeria", "China", "Cameroon", "Paraguay", "Korea") )
    #winners are the countries that are in the football_df dataframe
    #east germany left out, russia as ussr
    football_plot <- ggplot(data = world, aes(x = long, y = lat, group = group)) +
        geom_polygon(data = world, fill = "white", color = "black") +
        geom_polygon(data = winners, fill = "lightblue", color = "black") +
        coord_fixed() +
        labs(title = Title) +
        theme_void()
    football_plot







}