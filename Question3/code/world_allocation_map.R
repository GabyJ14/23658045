



world <- map_data("world")

world_map_data <- world %>%
    left_join(data, by = join_by(region==Country))


ggplot(world_map_data) +
    geom_polygon(aes(x = long, y = lat, group = group, fill = alloc_var), color = "grey80") +
    scale_fill_gradient(low = "white", high = "darkgreen", limits = c(min(alloc_var), max(alloc_var)), na.value = "grey99") +
    coord_sf() +
    # coord_fixed(ratio=1.6, xlim = c(-50, 80))+
    coord_sf(xlim = c(-25, 45), ylim = c(34, 72), expand = FALSE) +
    theme_bw() +
    labs(title = title,
         fill = alloc_var)