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
#' @family databases
#' @export
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
