#' Search Physician Office Visit Costs Data sets
#'
#' @description A list of enrollment applications pending CMS contractor
#'    review for physicians & non-physicians.
#'
#' @details The Pending Initial Logging and Tracking (L & T) data set provides
#'    a list of pending applications that have not been processed by CMS
#'    contractors.
#'
#' ## Links
#' * [Physician Office Visit Costs (Data.CMS.gov)](https://data.cms.gov/provider-data/search?page-size=50&theme=Physician%20office%20visit%20costs)
#'
#' @source Centers for Medicare & Medicaid Services
#' @note Update Frequency: **Weekly**
#'
#' @param specialty Provider's medical specialty
#'
#' @return A [tibble][tibble::tibble-package] containing the search results.
#'
#' @examples
#' search_datasets()
#' @export

search_datasets <- function(specialty = NULL) {

  url <- "https://data.cms.gov/provider-data/api/1/metastore/schemas/dataset/items"

  request <- httr2::request(url)

  response <- request |> httr2::req_perform()

  results <- response |>
    httr2::resp_body_json(check_type = FALSE, simplifyVector = TRUE) |>
    tibble::tibble() |>
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
                  distribution.mediaType = NULL,
                  `distribution.@type` = NULL)

  if (!is.null(specialty)) {
    results <- results |> dplyr::filter(specialty == {{ specialty }})
  }
  return(results)
}
