#trend of name over history
name_trend <- function(name_df, name, Title) {

    plot_name <- name_df %>%
        filter(Name == name)

    t <-  ggplot(plot_name, aes(x = Year, y = Total_Count_year)) +
        geom_line(color = "blue", size = 1) +  # Line plot
        geom_point(color = "red", size = 2) +  # Add points on the line
        labs(
            title = Title,
            x = "Year",
            y = "Total Count"
        ) +
        theme_minimal() +
        theme(
            plot.title = element_text(hjust = 0.5, size = 14, face = "bold"),
            axis.title = element_text(size = 12)
        )
    t

}