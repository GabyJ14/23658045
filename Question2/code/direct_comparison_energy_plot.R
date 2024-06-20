#direct comparison of temp/energy/ over time
direct_comparison_energy_plot <- function(combined_data){

    compare_plot <-
        ggplot(combined_data) +
        geom_smooth(aes(x = Year, y = energy, fill = band), alpha = 0.5) +
        #geom_jitter(aes(x = Year, y=energy, color=band), alpha = 0.5) +
        labs(title = "Energy Over Time",
             x = "Release Year",
             y = "Energy",
             color = "Band") +
        theme_bw() +
        theme(legend.position = "bottom") +
        guides(color = FALSE, fill = FALSE, alpha = FALSE) +
        theme(axis.text.x = element_text(angle = 90, vjust = 1, hjust=1))
    compare_plot
}