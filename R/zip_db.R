#' Zip code database
#'
#' A subset of the zip code database from the `zipcodeR` package
#'
#' @format ## `zipcode_db`
#' A tidytable with 41,877 rows and 13 columns:
#' \describe{
#'   \item{zip_code}{5 digit U.S. ZIP code}
#'   \item{city}{Major city serving the ZIP code}
#'   \item{county}{Name of county containing the ZIP code}
#'   \item{state}{Two-digit state code for ZIP code location}
#'   \item{lat}{Latitude of the centroid for the ZIP code}
#'   \item{lng}{Longitude of the centroid for the ZIP code}
#'   \item{bounds_west}{Bounding box coordinates}
#'   \item{bounds_east}{Bounding box coordinates}
#'   \item{bounds_north}{Bounding box coordinates}
#'   \item{bounds_south}{Bounding box coordinates}
#'   \item{demographics}{list column containing total population of zip code, zip code population density (persons per square mile), and median household income within the zip code}
#'   \item{is_zcta}{logical; TRUE if zip code is a ZIP code tabulation area (ZCTA)}
#'   \item{zcta_crosswalk}{list column containing 2010 Census tract code and GEOID (concatenation of 2010 state, county, and tract codes) for zip code, if a ZCTA}
#' }
"zip_db"
