## code to prepare `zip_db` dataset goes here
data("zcta_crosswalk", package = "zipcodeR")
data("zip_code_db", package = "zipcodeR")

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
  tidytable::nest(demographics = c(pop, pop_density, med_income)) |>
  tidytable::mutate(is_zcta = zipcodeR::is_zcta(zip_code)) |>
  tidytable::nest_join(zcta_crosswalk, by = c("zip_code" = "ZCTA5"))

usethis::use_data(zip_db, overwrite = TRUE)
