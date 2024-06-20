#plot for boxing
plot_sport <- function(sport_df, Title){

    df <- sport_df %>% arrange(desc(team_medals))

    plot_b <- ggplot(df, aes(x = Country, y = team_medals, fill = Country)) +
        geom_bar(stat = "identity") +
        labs(title = Title, x = "Country", y = "Total Medals") +
        theme_minimal() +
        theme(axis.text.x = element_text(angle = 90, vjust = 0.5, hjust = 1))
    plot_b


}