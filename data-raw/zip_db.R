## code to prepare `zip_db` dataset goes here

data("zipcodes", package = "usa")
data("counties", package = "usa")
data("states", package = "usa")
data("zip_code_db", package = "zipcodeR")

usazip <- usa::zipcodes |>
  dplyr::select(zip_code = zip,
                city,
                state)

#dplyr::filter(zip_code == "00303") Fulton County GA

usacounty <- usa::counties |>
  dplyr::select(county = name,
                state)

usastate <- usa::states |>
  dplyr::select(state = abb,
                region,
                division)


zip_code_db <- zip_code_db |>
  dplyr::tibble() |>
  dplyr::select(zip_code = zipcode,
                city = major_city,
                county,
                state) |>
  dplyr::mutate(county = stringr::str_remove_all(county,
                                                 " County")) |>
  dplyr::mutate(county = stringr::str_replace_all(county,
                                                  " city",
                                                  " City"))

zip_db <- zip_code_db |>
  dplyr::left_join(usacounty,
                   by = c("county" = "county",
                          "state" = "state"),
                   relationship = "many-to-many") |>
  dplyr::full_join(usazip, by = c("zip_code" = "zip_code",
                                  "city" = "city",
                                  "state" = "state")) |>
  dplyr::left_join(usastate,
                   by = c("state" = "state"))

zip_db <- dplyr::left_join(
  x = zip_db,
  y = usazip,
  by = c("zip_code", "state"),
  suffix = c("_raw", "_match")) |>
  dplyr::mutate(
    match_dist = campfin::str_dist(city_raw, city_match),
    match_abb = campfin::is_abbrev(city_raw, city_match),
    city = ifelse(match_abb | match_dist == 1, city_match, city_raw)) |>
  dplyr::select(-city_raw, -city_match, -match_dist, -match_abb) |>
  dplyr::mutate(city = stringr::str_to_title(city))

usethis::use_data(zip_db, overwrite = TRUE)


#   specialty          zip_code city                  county     state
#   <chr>              <chr>    <chr>                 <chr>      <chr>
#   1 vascular_surgery 93250    Mc Farland            Kern       CA
#   2 vascular_surgery 93250    McFarland             NA         CA
