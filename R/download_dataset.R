#' Download A Physician Office Visit Costs Data set
#'
#' @description A list of enrollment applications pending CMS contractor
#'    review for physicians & non-physicians.
#'
#' ## Links
#' * [Physician Office Visit Costs (Data.CMS.gov)](https://data.cms.gov/provider-data/search?page-size=50&theme=Physician%20office%20visit%20costs)
#'
#' @param df tidytable from `search_datasets()`
#' @return A `tidytable`
#'
#' @examples
#' \dontrun{
#' search_datasets(specialty = "vascular surgery") |>
#' download_dataset() |>
#' tidytable::slice_head(n = 10)
#' }
#' @autoglobal
#' @export

download_dataset <- function(df) {

  .datatable.aware <- TRUE

  results <- tidytable::fread(df$csv_url,
             colClasses = c(zip_code = "character",
  most_utilized_procedure_code_for_new_patient = "character",
  most_utilized_procedure_code_for_established_patient = "character")) |>
  tidytable::select(zip_code,
  new_code = most_utilized_procedure_code_for_new_patient,
  new_price_min = min_medicare_pricing_for_new_patient,
  new_price_max = max_medicare_pricing_for_new_patient,
  new_price_mode = mode_medicare_pricing_for_new_patient,
  new_copay_min = min_copay_for_new_patient,
  new_copay_max = max_copay_for_new_patient,
  new_copay_mode = mode_copay_for_new_patient,
  est_code = most_utilized_procedure_code_for_established_patient,
  est_price_min = min_medicare_pricing_for_established_patient,
  est_price_max = max_medicare_pricing_for_established_patient,
  est_price_mode = mode_medicare_pricing_for_established_patient,
  est_copay_min = min_copay_for_established_patient,
  est_copay_max = max_copay_for_established_patient,
  est_copay_mode = mode_copay_for_established_patient) |>
    tidytable::mutate(specialty = df$specialty, .before = zip_code)


  return(results)
}

.datatable.aware <- TRUE
