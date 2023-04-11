#' Add Geocoding Info to dataset via zipcodeR database
#'
#' ## Links
#' * [Physician Office Visit Costs (Data.CMS.gov)](https://data.cms.gov/provider-data/search?page-size=50&theme=Physician%20office%20visit%20costs)
#'
#' @param df `tidytable` from `download_dataset()`
#' @param drop_na Drop rows containing missing values; default is TRUE
#' @return A `tidytable`
#' @examples
#' \dontrun{
#' search_datasets(specialty = "vascular surgery") |>
#' download_dataset() |>
#' tidytable::slice_sample(n = 5) |>
#' use_zipcoder()
#' }
#' @autoglobal
#' @export
use_zipcoder <- function(df, drop_na = TRUE) {

  results <- tidytable::left_join(df, costoffice::zip_db) |>
             tidytable::select(specialty, city, county, state,
                      zip_code, tidytable::everything())

  if (isTRUE(drop_na)) {results <- tidytable::drop_na(results)}

  return(results)
}

.datatable.aware <- TRUE

