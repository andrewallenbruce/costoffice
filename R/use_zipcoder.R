#' Add Geocoding Info to dataset via zipcodeR database
#'
#' ## Links
#' * [Physician Office Visit Costs (Data.CMS.gov)](https://data.cms.gov/provider-data/search?page-size=50&theme=Physician%20office%20visit%20costs)
#'
#' @param df `tidytable` from `download_dataset()`
#' @param drop_na Drop rows containing missing values; default is TRUE
#' @param full Add full zip code information (demographics, geocodes, zcta crosswalk); default is FALSE
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
use_zipcoder <- function(df, drop_na = TRUE, full = FALSE) {

  if (isTRUE(full)) {

  results <- df |>
    tidytable::left_join(costoffice::zip_db) |>
    tidytable::select(specialty,
                      city,
                      county,
                      state,
                      zip_code,
                      tidytable::everything())
  } else {

    zip_db <- costoffice::zip_db |>
      tidytable::select(zip_code:state_region)

    results <- df |>
      tidytable::left_join(zip_db) |>
      tidytable::select(specialty,
                        city,
                        county,
                        state,
                        zip_code,
                        tidytable::everything())

  }

  if (isTRUE(drop_na)) {
    results <- results |>
      tidytable::drop_na()
    }

  return(results)
}

.datatable.aware <- TRUE

