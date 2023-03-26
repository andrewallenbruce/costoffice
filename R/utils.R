#' Returns a tibble describing the structure of a data frame
#' @source https://r4ds.hadley.nz/iteration.html#reading-multiple-files
#' @param df data frame
#' @examples
#' search_datasets() |>
#' df_types()
#' @noRd
df_types <- function(df) {
  dplyr::tibble(
    col_name = names(df),
    col_type = purrr::map_chr(df, vctrs::vec_ptype_full),
    n_miss = purrr::map_int(df, \(x) sum(is.na(x)))
  )
}

#' @param df data frame
#' @noRd
df_size <- function(df) {

  size <- lobstr::obj_size(df) |> unclass()

  cli::cli_alert_info("Object size: {prettyunits::pretty_bytes(size)}")
}
