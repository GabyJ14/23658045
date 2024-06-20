#actors influence baby names: girls

actors_influence_g <- function(national_df, HBO_credits, HBO_titles) {

    HBO_top_90 <- HBO_titles %>%
        filter(release_year %in% (1990:1999)) %>%
        filter(grepl( "['US]", production_countries)) %>%
        arrange(desc(tmdb_popularity)) %>%
        select(id, title, release_year, production_countries, type, tmdb_popularity)

    HBO_top_show_90 <- HBO_top_90 %>%
        filter(type == "SHOW") %>%
        head(5)

    HBO_top_movie_90 <- HBO_top_90 %>%
        filter(type == "MOVIE") %>%
        head(5)

    HBO_top_90_actors_movie <- HBO_credits %>%
        filter(HBO_credits$id %in%  HBO_top_movie_90$id) %>%
        select(name, character)

    HBO_top_90_actors_show <- HBO_credits %>%
        filter(id %in%  HBO_top_show_90$id) %>%
        select(name, character)

    HBO_top_90_actors_movie_names <- HBO_top_90_actors_movie %>%
        separate(name, into = c("First_Name", "Last_Name"), sep = " ")

    HBO_top_90_actors_shows_names <- HBO_top_90_actors_show %>%
        separate(name, into = c("First_Name", "Last_Name"), sep = " ")

    g_influencal_names_shows <- national_df %>%
        filter(Name %in% HBO_top_90_actors_shows_names$First_Name) %>%
        filter(Year %in% (1990:2010)) %>%
        filter(Gender == "F") %>%
        filter(Total_Count_year > 500)

    b_influence_names_shows <- national_df %>%
        filter(Name %in% HBO_top_90_actors_shows_names$First_Name) %>%
        filter(Year %in% (1990:2010)) %>%
        filter(Gender == "M") %>%
        filter(Total_Count_year > 500)



    plot_g <- ggplot(g_influencal_names_shows, aes(x = Year, y = Total_Count_year, color = Name)) +
        geom_line(size = 1) +  # Line plot
        geom_point(size = 2) +  # Add points on the line
        labs(
            title = "Influence of Top Actors' Names on Baby Girl Naming Trends",
            x = "Year",
            y = "Total Count",
            color = "Name"
        ) +
        theme_minimal() +
        theme(
            plot.title = element_text(hjust = 0.5, size = 14, face = "bold"),
            axis.title = element_text(size = 12)
        )

plot_g

}