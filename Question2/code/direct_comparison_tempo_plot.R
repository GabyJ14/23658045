#direct comparison of temp/energy/ over time
direct_comparison_tempo_plot <- function(combined_data){

    compare_plot <-
        ggplot(combined_data) +
        geom_boxplot(aes(x = Year, y = tempo, fill = band), alpha = 0.5) +
        geom_jitter(aes(x = Year, y=tempo, color=band), alpha = 0.5) +
        labs(title = "Tempo Over Time",
             x = "Release Year",
            y = "Tempo (BPM)",
            color = "Band") +
        theme_bw() +
        guides(color = FALSE, fill = FALSE, alpha = FALSE) +
        theme(axis.text.x = element_text(angle = 90, vjust = 1, hjust=1))
    compare_plot
}