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

  data <- tidytable::fread(file = df$csv_url,
                           nThread = 4,
                           keepLeadingZeros = TRUE,
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

  new <- data |> tidytable::select(zip_code,
                                   hcpcs = new_code,
                                   tidytable::starts_with("new")) |>
    tidytable::pivot_longer(tidytable::starts_with("new_"),
                            names_to = c("patient", "cost", "stat"),
                            values_to = "amount", names_sep = "_") |>
    tidytable::pivot_wider(names_from = stat, values_from = amount)

  est <- data |> tidytable::select(zip_code,
                                   hcpcs = est_code,
                                   tidytable::starts_with("est")) |>
    tidytable::pivot_longer(tidytable::starts_with("est_"),
                            names_to = c("patient", "cost", "stat"),
                            values_to = "amount", names_sep = "_") |>
    tidytable::pivot_wider(names_from = stat, values_from = amount)

  results <- tidytable::bind_rows(new, est) |>
    tidytable::mutate(range = max - min) |>
    tidytable::mutate(specialty = df$specialty, .before = zip_code)

  df_size(results)

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
#' @param zipcoder Adds information from `use_zipcoder()`; default is TRUE
#' @param drop_na Drop rows containing missing values; default is TRUE
#' @param full Add full zip code information (demographics, geocodes, zcta crosswalk); default is FALSE
#' @return A `tidytable`
#' @autoglobal
#' @noRd
download_dataset_purrr <- function(df,
                                   x,
                                   zipcoder = TRUE,
                                   drop_na  = TRUE,
                                   full     = FALSE) {

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

  if (isTRUE(zipcoder)) {
    results <- use_zipcoder(results, drop_na = drop_na, full = full)
  }

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
#' @param zipcoder Adds information from `use_zipcoder()`; default is TRUE
#' @param drop_na Drop rows containing missing values; default is TRUE
#' @param full Add full zip code information (demographics, geocodes, zcta crosswalk); default is FALSE
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
                              keyword   = NULL,
                              zipcoder  = TRUE,
                              drop_na   = TRUE,
                              full      = FALSE) {

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

  if (isTRUE(zipcoder)) {
    results <- results |> use_zipcoder(drop_na = drop_na, full = full)
  }

  df_size(results)
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
#' @param dir Directory to save to
#' @param ext File extension, default is ".csv"
#' @return A `tidytable` data.table
#' @examples
#' \dontrun{
#' write_datasets(keyword = "medicine")
#' }
#' @family download
#' @autoglobal
#' @export
write_datasets <- function(specialty = NULL,
                           keyword   = NULL,
                           dir = "D:/cost_office_csvs/",
                           ext = ".csv") {

  res <- search_datasets(specialty = specialty,
                         keyword   = keyword)

  paths <- gsub(" ", "_", res$specialty)
  paths <- gsub("/", "", res$specialty)
  paths <- paste0(dir, paths, ext)

  dflst  <- purrr::map2(res$csv_url, res$specialty, download_dataset_purrr)

  tidytable::inv_gc()

  purrr::walk2(dflst, paths, tidytable::fwrite)

  tidytable::inv_gc()

}

.datatable.aware <- TRUE
