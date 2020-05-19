# Erase land (TJ's World_countries shapefile) from Blake's 5km equal area grid
# Uses:
#   1) As 5km base grid to overlay whale predictions onto
#   2) To calculate areas of grid cells with land erased


###############################################################################
library(dplyr)
library(sf)

source("User_script_local.R")
if (user == "JS") {
  
} else if (user == "SMW") {
  file.grid5km <- "../raimbow-local/Data/5x5 km grid shapefile/five_km_grid_polys_geo.shp"
  file.land <- "C:/SMW/eSDM/Ensemble Case Study/GIS_files_forJVR/Shapefiles/World_countries.shp"
  path.save1 <- "../raimbow-local/RDATA_files/Grid_5km_lint.RDATA"
  path.save2 <- "../raimbow-local/RDATA_files/Grid_5km_landerased.RDATA"
}


###############################################################################
# ### Determine which grid cells interesect with high resolution land file, 
# ###   and then erase the land from those grid cells
# ### Time-intensive; run once to save ...lint.RDATA file
# grid.5km.ea <- st_read(file.grid5km, stringsAsFactors = FALSE)
# 
# land.sfc <- st_read(file.land) %>%
#   st_geometry() %>%
#   st_crop(st_bbox(grid.5km.ea)) %>%
#   st_combine() %>%
#   st_union() %>%
#   lwgeom::st_make_valid()

# # Visualize if desired
# plot(st_geometry(grid.5km.ea), axes = TRUE, col = "blue", border = NA)
# plot(st_geometry(land.sfc), add = TRUE, col = NA, border = "tan")

# # For the cells that intersect with land, erase land
# system.time(int.idx <- st_intersects(grid.5km.ea, land.sfc)) #233s
# int.idx.which <- which(sapply(int.idx, length) > 0)
# system.time(grid.5km.lint <- st_difference(grid.5km.ea[int.idx.which, ], land.sfc)) #18min
# save(grid.5km.ea, int.idx.which, grid.5km.lint, file = path.save1)


###############################################################################
### Combine grid cells with land erased with grid cells that didn't overlap
###   with land
### Product: Grid cells with land erased

load(path.save1)

grid.5km.lno <- rbind(grid.5km.ea[-int.idx.which, ], grid.5km.lint) %>% 
  arrange(GRID5KM_ID) %>% 
  dplyr::mutate(area_km_lno = as.numeric(units::set_units(st_area(geometry), "km^2"))) %>% 
  select(GRID5KM_ID, area_km_lno)


# Visualize
plot(grid.5km.lno["area_km_lno"], axes = TRUE, border = NA)

save(grid.5km.lno, file = path.save2)
# st_write(grid.5km.lno, "Data/5x5 km grid shapefile/five_km_grid_landerased.shp")

###############################################################################