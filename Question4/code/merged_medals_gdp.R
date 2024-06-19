#merged dataset with country medals and GDP per capita
merged_medals_gdp <- function(medals, gdp){
    merged <- medals %>%
        left_join(gdp, by = "Code")
    merged

}