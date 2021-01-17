library(dplyr)
library(readr)

zip_dim <- 5
layer <- paste0("plz-", zip_dim, "stellig")
folder <- paste0(layer, ".shp")
path <- here::here("inst", "extdata", folder)
data <- rgdal::readOGR(path, layer = layer)

population_zip <- data@data %>%
  as_tibble() %>%
  select(community_zip = plz, sqkm = qkm, population = einwohner)

usethis::use_data(population_zip, overwrite = TRUE)
write_csv(population_zip, here::here("data", "population_zip.csv"))
