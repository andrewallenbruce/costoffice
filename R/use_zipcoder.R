#' Add Geocoding Info to dataset via zipcodeR database
#'
#' @description A list of enrollment applications pending CMS contractor
#'    review for physicians & non-physicians.
#'
#' ## Links
#' * [Physician Office Visit Costs (Data.CMS.gov)](https://data.cms.gov/provider-data/search?page-size=50&theme=Physician%20office%20visit%20costs)
#'
#' @param df tidytable from `download_dataset()`
#' @return A `tidytable`
#'
#' @examples
#' search_datasets(specialty = "vascular surgery") |>
#' download_dataset() |>
#' tidytable::slice_tail(n = 5) |>
#' use_zipcoder()
#' @autoglobal
#' @export
use_zipcoder <- function(df) {

  .datatable.aware <- TRUE

  results <- df |>
    tidytable::left_join(costoffice::zipcode_db) |>
    #tidytable::nest(geo = c(lat, lng, tidytable::starts_with("bounds"))) |>
    tidytable::select(city, county, state, zip_code, tidytable::everything())

  return(results)
}

#' Download A Physician Office Visit Costs Data set
#'
#' @description A list of enrollment applications pending CMS contractor
#'    review for physicians & non-physicians.
#'
#' ## Links
#' * [Physician Office Visit Costs (Data.CMS.gov)](https://data.cms.gov/provider-data/search?page-size=50&theme=Physician%20office%20visit%20costs)
#'
#' @param df `tidytable` from `download_dataset()`
#' @return A `tidytable`
#' @examples
#' \dontrun{
#' search_datasets(specialty = "vascular surgery") |>
#' download_dataset() |>
#' use_zipcoder() |>
#' tidytable::slice_head(n = 10)
#' }
#' @autoglobal
#' @noRd

use_zipcoder_tidytable <- function(df) {

  zipcodeR::zip_code_db

  results <- df |>
    tidytable::mutate(
      zip_code = tidytable::map_chr(.data$zip_code,
                 zipcodeR::normalize_zip)) |>
    tidytable::mutate(
      zip_info = tidytable::map_df(.data$zip_code,
                 zipcodeR::reverse_zipcode),
                      .after = zip_code) |>
    tidytable::unnest_wider(zip_info) |>
    tidytable::select(city = major_city,
                  county,
                  state,
                  zip_code,
                  lat,
                  lng,
                  bounds_west,
                  bounds_east,
                  bounds_north,
                  bounds_south,
                  tidytable::contains("new"),
                  tidytable::contains("est"))


  return(results)
}

.datatable.aware <- TRUE


