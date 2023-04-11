#' Download A Physician Office Visit Costs Data set
#'
#' ## Links
#' * [Physician Office Visit Costs (Data.CMS.gov)](https://data.cms.gov/provider-data/search?page-size=50&theme=Physician%20office%20visit%20costs)
#'
#' @param df A returned `tidytable` from `search_datasets()`
#' @return A `tidytable` of available datasets and related information
#' @examples
#' \dontrun{
#' search_datasets(specialty = "vascular surgery") |>
#' download_dataset() |>
#' tidytable::slice_head(n = 10)
#' }
#' @autoglobal
#' @family downloads
#' @export
download_dataset <- function(df) {

  csv <- df |>
    dplyr::select(csv_url) |>
    tibble::deframe()

  specialty <- df |>
    dplyr::select(specialty) |>
    tibble::deframe()

  data <- tidytable::fread(input = csv,
                           nThread = 4,
                           keepLeadingZeros = TRUE,
                           colClasses = c(
      zip_code = "character",
      most_utilized_procedure_code_for_new_patient = "character",
      most_utilized_procedure_code_for_established_patient = "character"))

  # rename cols -------------------------------------------------------------
  data <- data |>
    tidytable::select(
      zip_code,
      new_code       = most_utilized_procedure_code_for_new_patient,
      new_price_min  = min_medicare_pricing_for_new_patient,
      new_price_max  = max_medicare_pricing_for_new_patient,
      new_price_mode = mode_medicare_pricing_for_new_patient,
      new_copay_min  = min_copay_for_new_patient,
      new_copay_max  = max_copay_for_new_patient,
      new_copay_mode = mode_copay_for_new_patient,
      est_code       = most_utilized_procedure_code_for_established_patient,
      est_price_min  = min_medicare_pricing_for_established_patient,
      est_price_max  = max_medicare_pricing_for_established_patient,
      est_price_mode = mode_medicare_pricing_for_established_patient,
      est_copay_min  = min_copay_for_established_patient,
      est_copay_max  = max_copay_for_established_patient,
      est_copay_mode = mode_copay_for_established_patient)

  # add zip data ----------------------------------------------------------
  data <- dplyr::left_join(data,
                           costoffice::zip_db,
                           by = c("zip_code")) |>
    dplyr::select(zip_code,
                  city,
                  county,
                  state,
                  dplyr::everything()) |>
    dplyr::mutate(county = dplyr::na_if(county, ""))

  # create anti join --------------------------------------------------------
  remove <- data |>
    campfin::flag_na(county) |>
    campfin::flag_dupes(zip_code) |>
    dplyr::select(zip_code:state, na_flag:dupe_flag) |>
    dplyr::filter(dupe_flag == TRUE) |>
    dplyr::filter(is.na(county))

  data <- dplyr::anti_join(data,
                           remove,
                           by = c(
                             "zip_code",
                             "city",
                             "county",
                             "state"))

  # pivot - new patient ----------------------------------------------
  new <- data |> tidytable::select(zip_code,
                                   city, county, state, region, division,
                                   hcpcs = new_code,
                                   tidytable::starts_with("new")) |>
    tidytable::pivot_longer(tidytable::starts_with("new_"),
                            names_to = c("patient",
                                         "cost",
                                         "stat"),
                            values_to = "amount",
                            names_sep = "_") |>
    tidytable::pivot_wider(names_from = stat,
                           values_from = amount)

  # pivot - established patient --------------------------------------
  est <- data |> tidytable::select(zip_code,
                                   city, county, state, region, division,
                                   hcpcs = est_code,
                                   tidytable::starts_with("est")) |>
    tidytable::pivot_longer(tidytable::starts_with("est_"),
                            names_to = c("patient",
                                         "cost",
                                         "stat"),
                            values_to = "amount",
                            names_sep = "_") |>
    tidytable::pivot_wider(names_from = stat,
                           values_from = amount)

  # bind new & established --------------------------------------------------
  results <- tidytable::bind_rows(new, est)

  results <- results |>
    tidytable::mutate(range = max - min) |>
    tidytable::mutate(specialty = specialty,
                      .before = zip_code)

  return(results)
}

.datatable.aware <- TRUE

#' Download A Physician Office Visit Costs Data set
#'
#' ## Links
#' * [Physician Office Visit Costs (Data.CMS.gov)](https://data.cms.gov/provider-data/search?page-size=50&theme=Physician%20office%20visit%20costs)
#'
#' @param df A returned `tidytable` from `search_datasets()`
#' @return A `tidytable`
#' @autoglobal
#' @noRd
download_dataset_purrr <- function(df) {

  data <- tidytable::fread(df, nThread = 4, keepLeadingZeros = TRUE,
                           colClasses = c(zip_code = "character",
          most_utilized_procedure_code_for_new_patient = "character",
          most_utilized_procedure_code_for_established_patient = "character"))

  data <- data |>
    tidytable::select(
      zip_code,
      new_code       = most_utilized_procedure_code_for_new_patient,
      new_price_min  = min_medicare_pricing_for_new_patient,
      new_price_max  = max_medicare_pricing_for_new_patient,
      new_price_mode = mode_medicare_pricing_for_new_patient,
      new_copay_min  = min_copay_for_new_patient,
      new_copay_max  = max_copay_for_new_patient,
      new_copay_mode = mode_copay_for_new_patient,
      est_code       = most_utilized_procedure_code_for_established_patient,
      est_price_min  = min_medicare_pricing_for_established_patient,
      est_price_max  = max_medicare_pricing_for_established_patient,
      est_price_mode = mode_medicare_pricing_for_established_patient,
      est_copay_min  = min_copay_for_established_patient,
      est_copay_max  = max_copay_for_established_patient,
      est_copay_mode = mode_copay_for_established_patient)

  new <- tidytable::select(data, zip_code,
                                   hcpcs = new_code,
                                   tidytable::starts_with("new")) |>
    tidytable::pivot_longer(tidytable::starts_with("new_"),
                            names_to = c("patient", "cost", "stat"),
                            values_to = "amount",
                            names_sep = "_") |>
    tidytable::pivot_wider(names_from = stat,
                           values_from = amount)

  est <- tidytable::select(data, zip_code,
                                   hcpcs = est_code,
                                   tidytable::starts_with("est")) |>
    tidytable::pivot_longer(tidytable::starts_with("est_"),
                            names_to = c("patient", "cost", "stat"),
                            values_to = "amount",
                            names_sep = "_") |>
    tidytable::pivot_wider(names_from = stat,
                           values_from = amount)

  results <- tidytable::bind_rows(new, est) |>
    tidytable::mutate(range = max - min)

  return(results)
}

.datatable.aware <- TRUE

#' Download A Physician Office Visit Costs Data set
#'
#' ## Links
#' * [Physician Office Visit Costs (Data.CMS.gov)](https://data.cms.gov/provider-data/search?page-size=50&theme=Physician%20office%20visit%20costs)
#'
#' @param df A returned `tidytable` from `search_datasets()`
#' @param x specialty column
#' @return A `tidytable`
#' @autoglobal
#' @noRd
download_dataset_purrr2 <- function(df, x) {

  data <- tidytable::fread(df, nThread = 4, keepLeadingZeros = TRUE,
          colClasses = c(zip_code = "character",
          most_utilized_procedure_code_for_new_patient = "character",
          most_utilized_procedure_code_for_established_patient = "character"))

  data <- data |>
    tidytable::select(
      zip_code,
      new_code       = most_utilized_procedure_code_for_new_patient,
      new_price_min  = min_medicare_pricing_for_new_patient,
      new_price_max  = max_medicare_pricing_for_new_patient,
      new_price_mode = mode_medicare_pricing_for_new_patient,
      new_copay_min  = min_copay_for_new_patient,
      new_copay_max  = max_copay_for_new_patient,
      new_copay_mode = mode_copay_for_new_patient,
      est_code       = most_utilized_procedure_code_for_established_patient,
      est_price_min  = min_medicare_pricing_for_established_patient,
      est_price_max  = max_medicare_pricing_for_established_patient,
      est_price_mode = mode_medicare_pricing_for_established_patient,
      est_copay_min  = min_copay_for_established_patient,
      est_copay_max  = max_copay_for_established_patient,
      est_copay_mode = mode_copay_for_established_patient)

  new <- tidytable::select(data, zip_code,
                           hcpcs = new_code,
                           tidytable::starts_with("new")) |>
    tidytable::pivot_longer(tidytable::starts_with("new_"),
                            names_to = c("patient", "cost", "stat"),
                            values_to = "amount",
                            names_sep = "_") |>
    tidytable::pivot_wider(names_from = stat,
                           values_from = amount)

  est <- tidytable::select(data, zip_code,
                           hcpcs = est_code,
                           tidytable::starts_with("est")) |>
    tidytable::pivot_longer(tidytable::starts_with("est_"),
                            names_to = c("patient", "cost", "stat"),
                            values_to = "amount",
                            names_sep = "_") |>
    tidytable::pivot_wider(names_from = stat,
                           values_from = amount)

  results <- tidytable::bind_rows(new, est) |>
    tidytable::mutate(range = max - min) |>
    tidytable::mutate(specialty = x, .before = zip_code)

  return(results)
}

.datatable.aware <- TRUE

#' Download A Physician Office Visit Costs Data set
#'
#' ## Links
#' * [Physician Office Visit Costs (Data.CMS.gov)](https://data.cms.gov/provider-data/search?page-size=50&theme=Physician%20office%20visit%20costs)
#'
#' @param specialty Search for exact medical specialty, e.g. 'cardiology'
#' @param keyword Search for partial matches, e.g. 'medicine'
#' @return A `tidytable` data.table
#'
#' @examples
#' \dontrun{
#' download_datasets(keyword = "medicine")
#' }
#' @family download
#' @autoglobal
#' @export
download_datasets <- function(specialty = NULL,
                              keyword   = NULL) {

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
    tidytable::mutate(ext = NULL,
                      specialty = stringr::str_replace_all(specialty, "_", " "),
                      specialty = stringr::str_to_lower(specialty)) |>
    tidytable::relocate(specialty)

  df_size(results)
  return(results)

}

.datatable.aware <- TRUE
