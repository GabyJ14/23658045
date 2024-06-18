#bar plot for total contributions by country
Contribution_by_country_plot <- function(alloc) {

    ggplot(alloc, aes(x = reorder(Country, - tot_bil_alloc), y = tot_bil_alloc)) +
        geom_bar(stat = "identity", fill = "steelblue") +
        labs(title = "Total Bilateral Allocations by Country", x = "Country", y = "Total Bilateral Allocations ($ billion)") +
        theme_minimal() +
        theme(axis.text.x = element_text(angle = 90, vjust = 0.5, hjust = 1))

}
