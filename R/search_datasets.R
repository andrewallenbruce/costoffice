#' Search Physician Office Visit Costs Data sets by Specialty
#'
#' @description A list of enrollment applications pending CMS contractor
#'    review for physicians & non-physicians.
#'
#' ## Links
#' * [Physician Office Visit Costs (Data.CMS.gov)](https://data.cms.gov/provider-data/search?page-size=50&theme=Physician%20office%20visit%20costs)
#'
#' @param specialty Provider's medical specialty
#' @return A `tidytable`
#' @examples
#' search_datasets()
#' @autoglobal
#' @export

search_datasets <- function(specialty = NULL, keyword = NULL) {

  url <- "https://data.cms.gov/provider-data/api/1/metastore/schemas/dataset/items"

  request <- httr2::request(url)

  response <- request |> httr2::req_perform()

  results <- response |>
    httr2::resp_body_json(check_type = FALSE,
                          simplifyVector = TRUE) |>
    tidytable::as_tidytable() |>
    tidytable::mutate(issued = clock::date_parse(issued),
                      modified = clock::date_parse(modified),
                      released = clock::date_parse(released)) |>
    tidytable::select(theme,
                      specialty = keyword,
                      issued,
                      modified,
                      released,
                      distribution) |>
    tidytable::unnest(theme, .drop = FALSE) |>
    tidytable::filter(theme == "Physician office visit costs") |>
    tidytable::unnest(specialty, .drop = FALSE) |>
    tidytable::filter(specialty != "office visit cost") |>
    tidytable::filter(specialty != "costs") |>
    tidytable::unnest(distribution, names_sep = ".", .drop = FALSE) |>
    tidytable::mutate(csv_url = distribution.downloadURL,
                      theme = NULL,
                      distribution.downloadURL = NULL,
                      distribution.title = NULL,
                      distribution.mediaType = NULL,
                      `distribution.@type` = NULL) |>
    tidytable::relocate(specialty)

  if (!is.null(keyword)) {
    results <- results |> tidytable::filter(stringr::str_detect(specialty, {{ keyword }}))
  }

  if (!is.null(specialty)) {
    results <- results |> tidytable::filter(specialty == {{ specialty }})
  }
  return(results)
}

.datatable.aware <- TRUE


#' Search Physician Office Visit Costs Data sets by Specialty
#'
#' @description A list of enrollment applications pending CMS contractor
#'    review for physicians & non-physicians.
#'
#' ## Links
#' * [Physician Office Visit Costs (Data.CMS.gov)](https://data.cms.gov/provider-data/search?page-size=50&theme=Physician%20office%20visit%20costs)
#'
#' @param specialty Provider's medical specialty
#' @return A `tidytable`
#' @examples
#' search_datasets_arrow()
#' @autoglobal
#' @export
search_datasets_arrow <- function(specialty = NULL) {

  url <- "https://data.cms.gov/provider-data/api/1/metastore/schemas/dataset/items"

  request <- httr2::request(url)

  response <- request |> httr2::req_perform()

  results <- response |>
    httr2::resp_body_json(check_type = FALSE,
                          simplifyVector = TRUE) |>
    dplyr::tibble() |>
    dplyr::mutate(issued = clock::date_parse(issued),
                      modified = clock::date_parse(modified),
                      released = clock::date_parse(released)) |>
    dplyr::select(theme,
                      specialty = keyword,
                      issued,
                      modified,
                      released,
                      distribution) |>
    tidyr::unnest(theme) |>
    dplyr::filter(theme == "Physician office visit costs") |>
    tidyr::unnest(specialty) |>
    dplyr::filter(specialty != "office visit cost") |>
    dplyr::filter(specialty != "costs") |>
    tidyr::unnest(distribution, names_sep = ".") |>
    dplyr::mutate(csv_url = distribution.downloadURL,
                      theme = NULL,
                      distribution.downloadURL = NULL,
                      distribution.title = NULL,
                      distribution.mediaType = NULL,
                      `distribution.@type` = NULL) |>
    dplyr::relocate(specialty)

  if (!is.null(specialty)) {
    results <- results |> dplyr::filter(stringr::str_detect(specialty, {{ specialty }}))
  }
  return(results)
}
