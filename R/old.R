#' Add ZIP Code related Info to data frame
#'
#' @param df `tibble` returned from `download_dataset()`
#' @return A `tibble`
#' @examples
#' \dontrun{
#' search_datasets(specialty = "vascular surgery") |>
#' download_dataset() |>
#' dplyr::slice_sample(n = 5) |>
#' add_zip_data()
#' }
#' @autoglobal
#' @noRd
add_zip_data <- function(df) {

  dplyr::left_join(df,
                   costoffice::zip_db,
                   by = c("zip_code" = "zip_code")) |>
    dplyr::select(specialty,
                  zip_code,
                  city,
                  county,
                  state,
                  dplyr::everything()) |>
    dplyr::mutate(county = dplyr::na_if(county, ""))
}

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
#' @noRd
use_zipcoder <- function(df, drop_na = TRUE) {

  results <- tidytable::left_join(df, costoffice::zip_db) |>
    tidytable::select(specialty, city, county, state,
                      zip_code, tidytable::everything())

  if (isTRUE(drop_na)) {results <- tidytable::drop_na(results)}

  return(results)
}

.datatable.aware <- TRUE


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
#' dplyr::slice_head(n = 5)
#' }
#' @autoglobal
#' @noRd
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

  data <- dplyr::anti_join(data, remove, by = c(
    "zip_code", "city", "county", "state"))

  # pivot - new patient ----------------------------------------------
  new <- data |> tidytable::select(zip_code,
                                   city, county, state, region, division,
                                   hcpcs = new_code,
                                   tidytable::starts_with("new")) |>
    tidytable::pivot_longer(tidytable::starts_with("new_"),
                            names_to = c("patient", "cost", "stat"),
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
                            names_to = c("patient", "cost", "stat"),
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
#' @autoglobal
#' @noRd
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
#' @noRd
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

#' Write Physician Office Visit Costs Data sets to a DuckDB database
#'
#' @param dir directory containing csvs to load into DuckDB
#' @param db_dir directory where database will be created
#' @param db_name name of database ending with .duckdb extension
#' @return invisible; directory & database created
#' @examples
#' \dontrun{
#' write_duckdb(dir = "D:/cost_office_csvs/",
#'          db_dir = "D:/cost_office_duckdb/",
#'          db_name = "cost_office.duckdb")
#' }
#' @autoglobal
#' @noRd
write_duckdb <- function(dir = "D:/cost_office_csvs/",
                         db_dir = "D:/cost_office_duckdb/",
                         db_name = "cost_office.duckdb") {

  files <- list.files(dir)

  files <- paste0(dir, files)

  name <- basename(files)

  name <- gsub(".csv", "", name)

  name <- gsub(" ", "-", name)

  con <- duckdb::dbConnect(drv = duckdb::duckdb(),
                           dbdir = paste0(dir, files))

  purrr::pwalk(list(name = name, files = files),
               duckdb::duckdb_read_csv, conn = con)

  duckdb::dbDisconnect(con)

}


# -------------------------------------------------------------------------

## Create database with `duckdb`

# https://r4ds.hadley.nz/iteration.html#sec-save-database

# template <- search_datasets(specialty = "addiction_medicine") |>
#   download_dataset() |>
#   head()
#
# con <- DBI::dbConnect(duckdb::duckdb(), "D:/duckdb/costoffice.duckdb")
#
# DBI::dbCreateTable(con, "costoffice", template)
#
# con |> dplyr::tbl("costoffice")


# cert <- search_datasets(keyword = "certified")[1, ] |>
#   download_dataset()
#
# DBI::dbAppendTable(con, "costoffice", cert)
#
# con |> dplyr::tbl("costoffice")


# cert2 <- search_datasets(keyword = "certified")[2, ] |>
#   download_dataset()
#
# DBI::dbAppendTable(con, "costoffice", cert2)
#
# con |> dplyr::tbl("costoffice")

# duckdb::dbDisconnect(con, shutdown = TRUE)
