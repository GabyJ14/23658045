#top 10 names per gender
g_top_names_history <- function(names_df) {

    g_top <- names_df %>%
        group_by(Name) %>%
        mutate(Total_count = sum(Total_Count_year)) %>%
        arrange(desc(Total_count)) %>%
        distinct(Name, Total_count)

    g_top

}