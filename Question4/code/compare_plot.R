#comparison of India and emerging economies/south american countries/similar sozed economies
#question: should I do everuthing togther or seperate?
compare_plot <- function(merge_data, filter_countries) {
    pacman::p_load(patchwork)
    compare_df <- merge_data %>%
        filter(Code %in% filter_countries)

    a <-
        ggplot(compare_df, aes(x = reorder(Code, -team_medals), y = team_medals, fill = Code)) +
        geom_bar(stat = "identity") +
       # coord_flip() +
        theme_minimal() +
        theme(legend.position = "none")
        labs(title = "Total Medals",
             x = "Country", y = "Total Medals")
    b <- ggplot(compare_df, aes(x = reorder(Code, -medals_per_capita), y = medals_per_capita, fill = Code)) +
        geom_bar(stat = "identity") +
        coord_flip() +
        theme_minimal() +
        theme(legend.position = "bottom") +
        labs(title = "Medals per Capita",
             x = "Country", y = "Medals per Capita")
    c<- ggplot(compare_df, aes(x = reorder(Code, -medals_per_gdp), y = medals_per_gdp, fill = Code)) +
        geom_bar(stat = "identity") +
        coord_flip() +
        theme_minimal() +
        theme(legend.position = "none")+
        labs(title = "Medals per GDP",
             x = "Country", y = "Medals per GDP")


    a/ (b +c) +
        plot_annotation(
            title = 'Past performance in Summer Olympics',
            caption = 'Source: @littlemissdata'
        ) &
        theme(text = element_text('bold'))
}