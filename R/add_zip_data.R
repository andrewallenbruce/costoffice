#' Add ZIP Code related Info to data frame
#'
#' @param df `tibble` returned from `download_dataset()`
#' @return A `tibble`
#' @examples
#' search_datasets(specialty = "vascular surgery") |>
#' download_dataset() |>
#' dplyr::slice_sample(n = 5) |>
#' add_zip_data()
#' @autoglobal
#' @export
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

