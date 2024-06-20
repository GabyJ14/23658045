#top countries
top_countries_plot <- function(top_countries, Title)
{
   test_plot<-


    ggplot(top_countries, aes(x = factor(Year), y = team_medals, fill = Country)) +
        geom_bar(stat = "identity") +
        labs(title = Title,
             x = "Year", y = "Total Team Medals") +
        theme_minimal() +
        theme(legend.position = "bottom") +
       theme(axis.text.x = element_text(angle = 90, vjust = 0.5, hjust=1))
   test_plot

}


