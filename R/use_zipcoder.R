#' Add Geocoding Info to dataset via zipcodeR database
#'
#' @description A list of enrollment applications pending CMS contractor
#'    review for physicians & non-physicians.
#'
#' ## Links
#' * [Physician Office Visit Costs (Data.CMS.gov)](https://data.cms.gov/provider-data/search?page-size=50&theme=Physician%20office%20visit%20costs)
#'
#' @param df `tidytable` from `download_dataset()`
#' @return A `tidytable`
#'
#' @examples
#' \dontrun{
#' search_datasets(specialty = "vascular surgery") |>
#' download_dataset() |>
#' tidytable::slice_sample(n = 10) |>
#' use_zipcoder()
#' }
#' @autoglobal
#' @export
use_zipcoder <- function(df) {

  results <- df |>
    tidytable::left_join(costoffice::zipcode_db) |>
    tidytable::select(city,
                      county,
                      state,
                      zip_code,
                      tidytable::everything())

  return(results)
}

.datatable.aware <- TRUE

#' Add Geocoding Info to dataset via zipcodeR database
#'
#' ## Links
#' * [Physician Office Visit Costs (Data.CMS.gov)](https://data.cms.gov/provider-data/search?page-size=50&theme=Physician%20office%20visit%20costs)
#'
#' @param df An `arrow` Table object from `download_dataset_arrow()`
#' @return An `arrow` Table object
#' @examples
#' \dontrun{
#' search_datasets_arrow(specialty = "vascular surgery") |>
#' download_dataset_arrow() |>
#' use_zipcoder_arrow()
#' }
#' @autoglobal
#' @export

use_zipcoder_arrow <- function(df) {

  results <- df |>
    dplyr::left_join(costoffice::zipcode_db) |>
    dplyr::select(city,
                  county,
                  state,
                  zip_code,
                  dplyr::everything())

  return(results)
}

