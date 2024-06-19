#top names in history for boys
b_top_names_history <- function(names_df) {

    b_top <- names_df %>%
        group_by(Name) %>%
        mutate(Total_count = sum(Total_Count_year)) %>%
        arrange(desc(Total_count)) %>%
        distinct(Name, Total_count)

    b_top

}