#bar plot for top 10 names
top_10_plot <- function(top_df, Title) {

    plot_df <- top_df %>% head(10)

    plot <- ggplot(plot_df, aes(x = Name, y = Total_count, fill = Name)) +
        geom_bar(stat = "identity") +
        theme_minimal() +
        theme(legend.position = "none") +
     scale_y_continuous( labels = scales::label_number()) +
        labs(title = Title,
             x = "", y = "Total")

    plot

}