#maps
allocation_map <-function(data, alloc_var, Title){

    world <- map_data("world")
    europe <- subset(world, region %in% c("Albania", "Andorra", "Armenia", "Austria", "Azerbaijan",
                                          "Belarus", "Belgium", "Bosnia and Herzegovina", "Bulgaria",
                                          "Croatia", "Cyprus", "Czechia","Denmark","Estonia","Finland",
                                          "France","Georgia", "Germany", "Greece","Hungary","Iceland",
                                          "Ireland", "Italy","Kazakhstan", "Kosovo", "Latvia","Liechtenstein",
                                          "Lithuania", "Luxembourg","Malta","Moldova","Monaco","Montenegro",
                                          "Macedonia", "Netherlands","Norway","Poland","Portugal","Romania",
                                          "Russia","San Marino","Serbia","Slovakia","Slovenia","Spain",
                                          "Sweden","Switzerland","Turkey","Ukraine","UK","Vatican"))

    EU <- data %>% filter(data$EU==1)  #for just looking at EU map
    EU_members <- subset(world, region %in% EU$Country)

    europe_map_data <- europe %>%
        left_join(EU, by = join_by(region == Country))

    europe_map_data <- europe_map_data %>%
        filter(!is.na(alloc_var))

    ggplot(europe_map_data) +
        geom_polygon(aes(x = long, y = lat, group = group, fill = alloc_var), color = "grey80") +
        scale_fill_gradient(low = "white", high = "darkgreen", limits = c(min(alloc_var), max(alloc_var)), na.value = "grey99") +
        coord_sf() +
        # coord_fixed(ratio=1.6, xlim = c(-50, 80))+
        coord_sf(xlim = c(-25, 45), ylim = c(34, 72), expand = FALSE) +
        theme_bw() +
        labs(title = title,
             fill = alloc_var)


}
