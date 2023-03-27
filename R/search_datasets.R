#' Search Physician Office Visit Costs Data sets by Specialty
#'
#' @description Returns information pertaining to 83 datasets separated by medical specialty, describing physician office visit costs per zip code for new and established patients.
#' @source [Physician Office Visit Costs (Data.CMS.gov)](https://data.cms.gov/provider-data/search?page-size=50&theme=Physician%20office%20visit%20costs)
#' @param specialty search for exact medical specialty, e.g. 'cardiology'
#' @param keyword search for partial matches, e.g. 'medicine'
#' @return A `tidytable` containing the specialty of the provider, the title of the dataset, the dates that the dataset was issued, modified, and released, and the link to download the csv file
#' @section Medical Specialties Available:
#' \foldstart{[Click to View]}
#'
#' ```{r}
#' search_datasets()$specialty
#' ````
#'
#' \foldend
#'
#' @examples
#' # The `specialty` argument will only return _exact_ matches
#' search_datasets(specialty = "cardiac surgery")
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
    tidytable::as_tidytable() |>
    tidytable::mutate(issued = clock::date_parse(issued),
                      modified = clock::date_parse(modified),
                      released = clock::date_parse(released)) |>
    tidytable::select(theme,
                      title,
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
    results <- results |>
      tidytable::filter(stringr::str_detect(specialty, {{ keyword }}))
  }

  if (!is.null(specialty)) {
    results <- results |>
      tidytable::filter(specialty == {{ specialty }})
  }
  return(results)
}

.datatable.aware <- TRUE
