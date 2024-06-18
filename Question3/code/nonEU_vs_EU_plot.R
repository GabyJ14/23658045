#pie chart
nonEU_vs_EU_plot <- function(alloc) {
    comparison_df <- alloc %>%
        group_by(EU)


comparison_df <- comparison_df %>%
   pivot_longer(cols = starts_with("Total"), names_to = "Type", values_to = "Amount")

comparison_df$EU <- as.factor(comparison_df$EU)
comparison_df$Type <- as.factor(comparison_df$Type)

pie_chart <- ggplot(comparison_df, aes(x = "", y = Amount, fill = EU)) +
    geom_bar(stat = "identity", width = 1) +
    coord_polar("y", start = 0) +
    scale_fill_manual() +
    labs(title = "EU vs. Non-EU Contributions", fill = "EU Member") +
    theme_void()

 pie_chart

}

