#song duration over time for coldplay, metallica, and broader music
song_duration_compare <- function(avg_data) {

   duration_plot <-
       ggplot(avg_data) +
        geom_density(aes(x = minutes, fill = artist), alpha = 0.3) +
       geom_density(aes(x = minutes, fill = artist), alpha = 0.5) +
       geom_density(aes(x = minutes, fill = artist), alpha = 0.5) +
        labs(
            title = "Distribution of Song Durations",
            x = "Duration (Minutes)",
            y = "Density",
            fill = "Legend"
        ) +
       theme_minimal()
duration_plot

}





#{duration_plot<-
#       ggplot(avg_data, aes(x = Year, y = minutes, color = artist, group = artist)) +
 #       geom_line(size = 1.2) +
  #      geom_point(size = 2) +
   #     labs(
    #        title = "Average Song Duration Over Time",
     #       x = "Year",
      #      y = "Average Duration (Minutes)",
       #     color = "Legend"
#    ) +
#   theme_minimal()
#duration_plot}
