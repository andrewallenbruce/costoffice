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

#' @noRd
flush_memory <- function (n = 1) {

  for (i in seq(n)) {

    suppressMessages(gc(reset = TRUE, full = TRUE))

  }

}

#' @noRd
flag_dupes <- function (data,
                        ...,
                        .check = TRUE,
                        .both = TRUE) {

  sub_data <- dplyr::select(data, ...)

  dupe <- duplicated(sub_data, fromLast = FALSE)

  if (.both && any(dupe)) {

    d2 <- duplicated(sub_data, fromLast = TRUE)

    dupe <- dupe | d2

    rm(d2)
  }

  rm(sub_data)

  flush_memory(1)

  if (.check & !any(dupe)) {

    warning("no duplicate rows, column not created")
  }

  else {

    data$dupe_flag <- dupe
  }

  data

}


#' @noRd
flag_nas <- function (data, ...) {

  sub_data <- dplyr::select(data, ...)

  nas <- !stats::complete.cases(sub_data)

  data$na_flag <- nas

  data

}
