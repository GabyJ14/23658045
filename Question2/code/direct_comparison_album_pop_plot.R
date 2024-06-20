#popularity of album plot
direct_comparison_album_pop_plot <- function(combined_data) {
  plot_df <- combined_data %>%
      filter(!grepl("Remastered", album_name)) %>% filter(!grepl("Deluxe", album_name))


    compare_plot <-
        ggplot(plot_df) +
        geom_boxplot(aes(x = album_name, y = popularity, fill = band), alpha = 0.5) +
        geom_jitter(aes(x = album_name, y=popularity, color=band), alpha = 0.5) +
        labs(title = "Comparison of Song Popularity by Album",
             x = "Album",
             y = "Popularity",
             fill = "Album") +
        theme_bw() +
        theme(legend.position = "top")+
        guides(color = FALSE, fill = FALSE, alpha = FALSE) +
        scale_x_discrete(label = function(x) stringr::str_trunc(x, 12)) +
        theme(axis.text.x = element_text(angle = 90, vjust = 1, hjust=1))
    compare_plot

}