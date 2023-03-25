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
                                             most_utilized_procedure_code_for_established_patient = "character"))

  results <- results |>
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
#' search_datasets(specialty = "addiction medicine") |>
#' download_dataset_purr() |>
#' tidytable::slice_head(n = 10)
#' }
#' @autoglobal
#' @export

download_dataset_purrr <- function(df) {

  results <- tidytable::fread(df,
             colClasses = c(zip_code = "character",
  most_utilized_procedure_code_for_new_patient = "character",
  most_utilized_procedure_code_for_established_patient = "character"))

  results <- results |>
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
  est_copay_mode = mode_copay_for_established_patient)


  return(results)
}

.datatable.aware <- TRUE

#' Download A Physician Office Visit Costs Data set
#'
#' ## Links
#' * [Physician Office Visit Costs (Data.CMS.gov)](https://data.cms.gov/provider-data/search?page-size=50&theme=Physician%20office%20visit%20costs)
#'
#' @param specialty physician specialty
#' @return An `arrow` Table object
#'
#' @examples
#' \dontrun{
#' search_datasets(specialty = "addiction medicine") |>
#' download_dataset_arrow()
#' }
#' @autoglobal
#' @export
download_dataset_arrow <- function(specialty) {

  csv <- search_datasets_arrow(specialty = specialty) |>
    dplyr::select(csv_url) |> tibble::deframe()

  results <- arrow::read_csv_arrow(csv, skip = 1, schema = arrow::schema(
    zip_code = arrow::string(),
    min_medicare_pricing_for_new_patient = arrow::float64(),
    max_medicare_pricing_for_new_patient = arrow::float64(),
    mode_medicare_pricing_for_new_patient = arrow::float64(),
    min_copay_for_new_patient = arrow::float64(),
    max_copay_for_new_patient = arrow::float64(),
    mode_copay_for_new_patient = arrow::float64(),
    most_utilized_procedure_code_for_new_patient = arrow::utf8(),
    min_medicare_pricing_for_established_patient = arrow::float64(),
    max_medicare_pricing_for_established_patient = arrow::float64(),
    mode_medicare_pricing_for_established_patient = arrow::float64(),
    min_copay_for_established_patient = arrow::float64(),
    max_copay_for_established_patient = arrow::float64(),
    mode_copay_for_established_patient = arrow::float64(),
    most_utilized_procedure_code_for_established_patient = arrow::utf8()))

  results <- results |>
    dplyr::select(zip_code,
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
    dplyr::mutate(specialty = specialty)

  file_path <- tempfile()

  arrow::write_parquet(results, file_path)

  results <- arrow::read_parquet(file_path, as_data_frame = FALSE)

  unlink(file_path)

  return(results)
}

#' Download A Physician Office Visit Costs Data set
#'
#' ## Links
#' * [Physician Office Visit Costs (Data.CMS.gov)](https://data.cms.gov/provider-data/search?page-size=50&theme=Physician%20office%20visit%20costs)
#'
#' @param specialty search for exact medical specialty, e.g. 'cardiology'
#' @param keyword search for partial matches, e.g. 'medicine'
#' @param zipcoder if TRUE, adds geocoding information from `use_zipcoder()` function
#' @return A `tidytable` data.table
#'
#' @examples
#' \dontrun{
#' download_datasets(keyword = "medicine")
#' }
#' @autoglobal
#' @export
download_datasets <- function(specialty = NULL,
                              keyword   = NULL,
                              zipcoder  = TRUE) {

  results <- search_datasets(specialty = specialty,
                             keyword   = keyword) |>
    tidytable::select(csv_url) |>
    tibble::deframe() |>
    rlang::set_names(basename) |>
    purrr::map(download_dataset_purrr) |>
    purrr::list_rbind(names_to = "filename") |>
    tidytable::separate_wider_delim(filename,
                                    delim = ".",
                                    names = c("specialty", "ext")) |>
    tidytable::mutate(ext = NULL) |>
    tidytable::drop_na() |>
    tidytable::relocate(specialty)

  if (isTRUE(zipcoder)) {
    results <- results |>
      use_zipcoder() |>
      tidytable::drop_na() |>
      tidytable::relocate(specialty)
  }

  return(results)

}
