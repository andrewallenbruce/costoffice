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
