## code to prepare `zip_db` dataset goes here
data("zcta_crosswalk", package = "zipcodeR")
data("zip_code_db", package = "zipcodeR")

state_db <- tidytable::tidytable(
  state_abb = state.abb,
  state_name = state.name,
  state_region = state.region)

dc_pr <- tidytable::tidytable(
  state_abb = c("PR", "DC"),
  state_name = c("Puerto Rico", "District of Columbia"),
  state_region = c("Southeast", "South"))

state_db <- tidytable::bind_rows(state_db, dc_pr)

zip_db <- zip_code_db |>
  tidytable::select(zip_code = zipcode,
                    city = major_city,
                    county,
                    state,
                    pop = population,
                    pop_density = population_density,
                    med_income = median_household_income,
                    lat,
                    lng,
                    tidytable::starts_with("bounds")) |>
  tidytable::nest(demo = c("pop",
                           "pop_density",
                           "med_income")) |>
  tidyr::nest(geo = c("lat",
                      "lng",
                      "bounds_west",
                      "bounds_east",
                      "bounds_north",
                      "bounds_south")) |>
  tidytable::mutate(is_zcta = zipcodeR::is_zcta(zip_code)) |>
  tidytable::nest_join(zcta_crosswalk,
                       by = c("zip_code" = "ZCTA5")) |>
  tidytable::left_join(state_db,
                       by = c("state" = "state_abb")) |>
  tidytable::relocate(state_name,
                      state_region,
                      .after = state)

usethis::use_data(zip_db, overwrite = TRUE)
