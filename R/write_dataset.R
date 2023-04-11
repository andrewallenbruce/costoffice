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
write_dataset_purrr <- function(df,
                                x,
                                dir = "D:/cost_office_csvs/",
                                ext = ".csv") {

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

  path <- gsub("/", "", results$specialty)
  path <- paste0(dir, path, ext)
  path <- gsub(" ", "_", path)

  tidytable::fwrite(x = results, file = path, nThread = 4)
}

.datatable.aware <- TRUE

#' Download A Physician Office Visit Costs Data set
#'
#' ## Links
#' * [Physician Office Visit Costs (Data.CMS.gov)](https://data.cms.gov/provider-data/search?page-size=50&theme=Physician%20office%20visit%20costs)
#'
#' @param df A returned `tidytable` from `search_datasets()`
#' @param dir Directory to save to
#' @param ext File extension, default is ".csv"
#' @return A `tidytable` data.table
#' @examples
#' \dontrun{
#' write_datasets(specialty = "vascular surgery",
#'                dir = "D:/cost_office_csvs/",
#'                ext = ".csv")
#' }
#' @family download
#' @autoglobal
#' @export
write_datasets <- function(df,
                           dir = "D:/cost_office_csvs/",
                           ext = ".csv") {

  purrr::pwalk(list(df = df$csv_url, x = df$specialty),
               write_dataset_purrr, dir = dir, ext = ext)

  tidytable::inv_gc()

}

.datatable.aware <- TRUE


#' @noRd
rd_trns_wrt_csv <- function(df) {

  # name <- df |>
  #   dplyr::select(specialty) |>
  #   tibble::deframe()


  set <- df |>
    dplyr::pull(csv_url) |>
    readr::read_csv(col_types = c(
      zip_code = "character",
      most_utilized_procedure_code_for_new_patient = "character",
      most_utilized_procedure_code_for_established_patient = "character")) |>
    dplyr::select(zip_code,
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

  new <- set |>
    dplyr::select(zip_code,
                  hcpcs = new_code,
                  dplyr::starts_with("new")) |>
    tidyr::pivot_longer(dplyr::starts_with("new_"),
                        names_to = c("patient", "cost", "stat"),
                        values_to = "amount", names_sep = "_") |>
    tidyr::pivot_wider(names_from = stat, values_from = amount)

  est <- set |>
    dplyr::select(zip_code,
                  hcpcs = est_code,
                  dplyr::starts_with("est")) |>
    tidyr::pivot_longer(dplyr::starts_with("est_"),
                        names_to = c("patient", "cost", "stat"),
                        values_to = "amount", names_sep = "_") |>
    tidyr::pivot_wider(names_from = stat, values_from = amount)

  set <- dplyr::bind_rows(new, est) |>
    dplyr::mutate(range = max - min)
  # |>
  #   dplyr::mutate(specialty = df$specialty[[1]], .before = dplyr::everything())

  set <- dplyr::left_join(set, costoffice::zip_db,
                          by = c("zip_code" = "zip_code"))

  readr::write_csv(set, file = stringr::str_glue("{dir}/{name}.{ext}"),
                   dir = "D:/cost_office_csvs",
                   ext = "csv.gz")

}
