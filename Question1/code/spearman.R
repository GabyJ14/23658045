spearman_results <- list()

years <- sort(unique(girls_df$Year))
for (i in 1:(length(years) - 3)) {
    year <- years[i]
    next_years <- years[(i+1): (i+3)]

    top_25_current_year <- girls_df %>%
        filter(Year == year) %>%
        arrange(desc(Total_Count_year)) %>%
        head(25) %>%
        mutate(Rank_Current_Year = rank(-Total_Count_year, ties.method = "average"))



    correlations <- numeric(3)

    for (j in 1:length(next_years)) {
        next_year <- next_years[j]

        # Data for the next year
        next_year_data <- girls_df %>%
            filter(Year == next_year)

        # Join with top 25 of the current year to get the ranks
        comparison_data <- top_25_current_year %>%
            left_join(next_year_data, by = "Name", suffix = c("", "_Next_Year")) %>%
            arrange(desc(Total_Count_Next_Year)) %>%
            mutate(Rank_Next_Year = rank(-Total_Count_Next_Year, ties.method = "average"))

        # Calculate the Spearman correlation
        spearman_corr <- cor(
            comparison_data$Rank_Current_Year,
            comparison_data$Rank_Next_Year,
            method = "spearman",
            use = "complete.obs"
        )

        # Store the correlation
        correlations[j] <- spearman_corr
    }
    spearman_results[[as.character(year)]] <- correlations
}
spearman_df <- do.call(rbind, spearman_results)
rownames(spearman_df) <- names(spearman_results)
colnames(spearman_df) <- paste0("Year+", 1:3)
spearman_df <- as.data.frame(spearman_df)
spearman_df$Year <- as.integer(rownames(spearman_df))

return(spearman_df)

