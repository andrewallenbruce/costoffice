#' Returns a tidytable of summary stats
#' @description Returns a tidy table of summary stats
#' @param df data frame
#' @param condition filter condition, i.e. `patient == "new"`
#' @param group_vars variables to group by, i.e. `c(specialty, state, hcpcs, cost)`
#' @param summary_vars variables to summarise, i.e. `c(min, max, mode, range)`
#' @param arr column to arrange data by, i.e. `cost`
#' @return A `tidytable` containing the summary stats
#' @examples
#' \dontrun{
#' download_datasets(specialty = "vascular surgery") |>
#' tidytable::slice_head(n = 10) |>
#' summary_stats(condition = patient == "new",
#'               group_vars = c(specialty, state, hcpcs, cost),
#'               summary_vars = c(min, max, mode, range),
#'               arr = cost)
#' }
#' @autoglobal
#' @export
summary_stats <- function(df,
                          condition = NULL,
                          group_vars = NULL,
                          summary_vars = NULL,
                          arr = NULL) {

  results <- df |>
    tidytable::filter({{ condition }}) |>
    tidytable::summarise(tidytable::across({{ summary_vars }},
                      list(median = \(x) stats::median(x, na.rm = TRUE),
                           mean = \(x) mean(x, na.rm = TRUE)),
                                           .names = "{.fn}_{.col}"),
                         n = tidytable::n.(),
                      .by = ({{ group_vars }}) ) |>
  tidytable::arrange(tidytable::desc({{ arr }}))

  df_size(results)

  return(results)
}

.datatable.aware <- TRUE
