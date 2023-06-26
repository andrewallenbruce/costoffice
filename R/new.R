#' Search Physician Office Visit Costs Data sets by Specialty
#'
#' @description Returns information pertaining to 83 datasets separated by medical specialty, describing physician office visit costs per zip code for new and established patients.
#' @source [Physician Office Visit Costs (Data.CMS.gov)](https://data.cms.gov/provider-data/search?page-size=50&theme=Physician%20office%20visit%20costs)
#' @param specialty search for exact medical specialty, any spaces replaced by an underscore, e.g. 'cardiac_surgery'.
#' @param keyword search for partial matches, e.g. 'medicine'
#' @return A `tibble` containing the specialty of the provider, the title of the dataset, the dates that the dataset was issued, modified, and released, and the link to download the csv file
#' @examples
#' # The `specialty` argument will only return _exact_ matches
#' search_datasets(specialty = "cardiac_surgery")
#'
#' # The `keyword` argument will return _partial_ matches
#' search_datasets(keyword = "medicine")
#'
#' # Calling the function with no arguments will return the entire dataset
#' search_datasets()
#' @autoglobal
#' @export
search_datasets <- function(specialty = NULL,
                            keyword   = NULL) {

  url <- "https://data.cms.gov/provider-data/api/1/metastore/schemas/dataset/items"

  request <- httr2::request(url)

  response <- request |> httr2::req_perform()

  results <- response |>
    httr2::resp_body_json(check_type = FALSE,
                          simplifyVector = TRUE) |>
    dplyr::tibble() |>
    dplyr::mutate(released = clock::date_parse(released)) |>
    dplyr::select(theme,
                  specialty = keyword,
                  released,
                  distribution) |>
    tidyr::unnest(theme) |>
    dplyr::filter(theme == "Physician office visit costs") |>
    tidyr::unnest(specialty) |>
    dplyr::filter(specialty != "office visit cost",
                  specialty != "costs") |>
    tidyr::unnest(distribution, names_sep = ".") |>
    dplyr::mutate(csv_url = distribution.downloadURL,
                  theme = NULL,
                  distribution.downloadURL = NULL,
                  distribution.title = NULL,
                  distribution.mediaType = NULL,
                  `distribution.@type` = NULL) |>
    dplyr::mutate(specialty = stringr::str_remove_all(specialty, "/")) |>
    dplyr::mutate(specialty = stringr::str_remove_all(specialty, stringr::fixed("("))) |>
    dplyr::mutate(specialty = stringr::str_remove_all(specialty, stringr::fixed(")"))) |>
    dplyr::mutate(specialty = stringr::str_remove_all(specialty, stringr::fixed(","))) |>
    dplyr::mutate(specialty = stringr::str_remove_all(specialty, stringr::fixed("&amp;"))) |>
    dplyr::mutate(specialty = stringr::str_replace_all(specialty, "-", "_")) |>
    dplyr::mutate(specialty = stringr::str_replace_all(specialty, " ", "_")) |>
    dplyr::mutate(specialty = stringr::str_replace_all(specialty, "__", "_")) |>
    dplyr::relocate(specialty)

  if (!is.null(keyword)) {
    results <- results |>
      dplyr::filter(stringr::str_detect(specialty, {{ keyword }}))
  }

  if (!is.null(specialty)) {
    results <- results |>
      dplyr::filter(specialty == {{ specialty }})
  }
  return(results)
}

# -------------------------------------------------------------------------

download <- function(dir) {

  csvs <- search_datasets()$csv_url

  curl::multi_download(urls = csvs,
    destfiles = stringr::str_c(dir, basename(csvs)))

  files <- paste0("C:/Users/andyb/Desktop/costoffice/",
                  list.files("test/csv", full.names = T)) |>
    purrr::set_names(basename)

  names <- names(files)

  names <- gsub("(.csv)", "", names)

  names <- gsub("(_)", " ", names)

  names(files) <- NULL

  }

# -------------------------------------------------------------------------

files <- paste0("C:/Users/andyb/Desktop/costoffice/",
       list.files("test/csv", full.names = T)) |>
  purrr::set_names(basename)

names <- names(files)

names <- gsub("(.csv)", "", names)

names <- gsub("(_)", " ", names)

names(files) <- NULL

# -------------------------------------------------------------------------

tidyup <- function(file, name) {

  csv <- tidytable::fread(input = file,
                           nThread = 4,
                           keepLeadingZeros = TRUE,
          colClasses = c(
          zip_code = "character",
          most_utilized_procedure_code_for_new_patient = "character",
          most_utilized_procedure_code_for_established_patient = "character"))

  csv <- tidytable::select(csv,
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


  new <- tidytable::select(csv,
                           zip_code,
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

  est <- tidytable::select(csv,
                           zip_code,
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

  csv <- tidytable::bind_rows(new, est) |>
    tidytable::left_join(costoffice::zip_db,
                         by = c("zip_code")) |>
    tidytable::mutate(county = tidytable::na_if(county, ""),
                      range = max - min) |>
    tidytable::select(zip_code,
                      city,
                      county,
                      state,
                      region,
                      division,
                      tidytable::everything())

  csv$specialty <- name

  results <- csv |>
    tidytable::relocate(specialty) |>
    tidytable::mutate(patient = tidytable::case_when(
      patient == "new" ~ "New",
      patient == "est" ~ "Established",
      TRUE ~ patient),
      cost = stringr::str_to_sentence(cost))

  return(results)

}

# -------------------------------------------------------------------------

run_workflow <- function(files, names, label, out) {

  purrr::walk2(files = files, names = names, tidyup, out = out)

}

# -------------------------------------------------------------------------

# co_arrow <- arrow::open_csv_dataset(
#   "C:/Users/andyb/Desktop/costoffice/test/arrow/csv/part-0.csv",
#   col_types = arrow::schema(zip_code = arrow::utf8(),
#     city = arrow::utf8(),
#     county = arrow::utf8(),
#     state = arrow::utf8(),
#     region = arrow::utf8(),
#     division = arrow::utf8(),
#     hcpcs = arrow::utf8(),
#     patient = arrow::utf8(),
#     cost = arrow::utf8(),
#     min = arrow::float64(),
#     max = arrow::float64(),
#     mode = arrow::float64(),
#     range = arrow::float64(),
#     specialty = arrow::utf8()))

# 14,451,960 rows x 14 cols
# 202,327,440 cells

# 14,451,960 - 14,262,388 (total rows - distinct rows [by zip_code, specialty, patient, cost])
# 189,572 potential rows need to go

# arrow::write_dataset(co_arrow,
#                      "C:/Users/andyb/Desktop/costoffice/test/arrow",
#                      max_open_files = 10L,
#                      format = "feather")


# -------------------------------------------------------------------------

# co_v1 <- co_arrow |> dplyr::collect()
#
# qs::qread("C:/Users/andyb/Desktop/costoffice/test/arrow/csv/part-")
# qs::qsave(co_v1, "C:/Users/andyb/Desktop/costoffice/data-raw/co_v1")

# -------------------------------------------------------------------------

retrieve_pin <- function() {
  board <- pins::board_folder("C:/Users/andyb/Desktop/costoffice/pkgdown/assets/pins_board/")
  full <- co_board |> pins::pin_read("co_v1")
  gc()
  return(full)
}


