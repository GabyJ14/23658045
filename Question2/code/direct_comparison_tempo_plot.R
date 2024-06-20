#direct comparison of temp/energy/ over time
direct_comparison_tempo_plot <- function(combined_data){
avg_df <- combined_data %>%
    group_by(Year, band) %>%
    mutate(avg_temp = mean(tempo))

    compare_plot <-
        ggplot(avg_df) +
        geom_smooth(aes(x = Year, y = avg_temp, fill = band), alpha = 0.5) +
        labs(title = "Tempo Over Time",
             x = "Release Year",
            y = "Tempo (BPM)",
            color = "Band") +
        theme_bw() +
        theme(legend.position = "bottom") +
        guides(color = FALSE, fill = FALSE, alpha = FALSE) +
        theme(axis.text.x = element_text(angle = 90, vjust = 1, hjust=1))
    compare_plot
}