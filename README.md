
<!-- README.md is generated from README.Rmd. Please edit that file -->

# `costoffice`

<!-- badges: start -->

[![R-CMD-check](https://github.com/andrewallenbruce/costoffice/actions/workflows/R-CMD-check.yaml/badge.svg)](https://github.com/andrewallenbruce/costoffice/actions/workflows/R-CMD-check.yaml)
[![Lifecycle:
experimental](https://img.shields.io/badge/lifecycle-experimental-orange.svg)](https://lifecycle.r-lib.org/articles/stages.html#experimental)
[![Project Status: WIP - Initial development is in progress, but there
has not yet been a stable, usable release suitable for the
public.](https://www.repostatus.org/badges/latest/wip.svg)](https://www.repostatus.org/#wip)
[![Code
Size](https://img.shields.io/github/languages/code-size/andrewallenbruce/costoffice.svg)](https://github.com/andrewallenbruce/costoffice)
[![Last
Commit](https://img.shields.io/github/last-commit/andrewallenbruce/costoffice.svg)](https://github.com/andrewallenbruce/costoffice/commits/main)
[![Codecov](https://codecov.io/gh/andrewallenbruce/costoffice/branch/main/graph/badge.svg)](https://codecov.io/gh/andrewallenbruce/costoffice)
[![CodeFactor](https://www.codefactor.io/repository/github/andrewallenbruce/costoffice/badge)](https://www.codefactor.io/repository/github/andrewallenbruce/costoffice)
<!-- badges: end -->

<br>

## Installation

You can install the development version of `costoffice` from
[GitHub](https://github.com/) with:

``` r
# install.packages("devtools")
devtools::install_github("andrewallenbruce/costoffice")
```

``` r
# install.packages("remotes")
remotes::install_github("andrewallenbruce/costoffice")
```

<br>

## Retrieve Dataset Info

``` r
library(costoffice)
library(data.table)
library(tidytable)
```

    #> 
    #> Attaching package: 'tidytable'

    #> The following objects are masked from 'package:data.table':
    #> 
    #>     between, first, fread, last

    #> The following objects are masked from 'package:stats':
    #> 
    #>     dt, filter, lag

    #> The following object is masked from 'package:base':
    #> 
    #>     %in%

<br>

To retrieve information on all of the data sets (83 specialties in
total), simply call `search_datasets()` with no arguments:

``` r
search_datasets()
```

    #> Error in `:=`(issued = vctrs::vec_recycle(clock::date_parse(issued), .N)): Check that is.data.table(DT) == TRUE. Otherwise, := and `:=`(...) are defined for use in j, once only and in particular ways. See help(":=").

<br>

If you’re searching for one in particular, just supply the `specialty`
argument:

``` r
search_datasets(specialty = "vascular surgery") |> dplyr::glimpse()
```

    #> Error in `:=`(issued = vctrs::vec_recycle(clock::date_parse(issued), .N)): Check that is.data.table(DT) == TRUE. Otherwise, := and `:=`(...) are defined for use in j, once only and in particular ways. See help(":=").

<br>

## Downloading Datasets

``` r
vasc <- search_datasets(specialty = "vascular surgery")
```

    #> Error in `:=`(issued = vctrs::vec_recycle(clock::date_parse(issued), .N)): Check that is.data.table(DT) == TRUE. Otherwise, := and `:=`(...) are defined for use in j, once only and in particular ways. See help(":=").

``` r
dt <- data.table::fread(vasc$csv_url)
```

    #> Error in data.table::fread(vasc$csv_url): object 'vasc' not found

``` r
lobstr::obj_size(dt)
```

    #> 1.31 kB

<br>

``` r
dt <- dt |> 
  tibble::tibble() |> 
  dplyr::slice_sample(n = 25) |> 
  dplyr::select(zip_code,
                new_top_code = most_utilized_procedure_code_for_new_patient,
                new_price_min = min_medicare_pricing_for_new_patient,
                new_price_max = max_medicare_pricing_for_new_patient,
                new_price_mode = mode_medicare_pricing_for_new_patient,
                new_copay_min = min_copay_for_new_patient,
                new_copay_max = max_copay_for_new_patient,
                new_copay_mode = mode_copay_for_new_patient,
                est_top_code = most_utilized_procedure_code_for_established_patient,
                est_price_min = min_medicare_pricing_for_established_patient,
                est_price_max = max_medicare_pricing_for_established_patient,
                est_price_mode = mode_medicare_pricing_for_established_patient,
                est_copay_min = min_copay_for_established_patient,
                est_copay_max = max_copay_for_established_patient,
                est_copay_mode = mode_copay_for_established_patient)
```

    #> Error in `tibble::tibble()`:
    #> ! All columns in a tibble must be vectors.
    #> ✖ Column `dt` is a function.

``` r
dt
```

    #> function (.df, ...) 
    #> {
    #>     UseMethod("dt")
    #> }
    #> <bytecode: 0x0000024deac3d9d0>
    #> <environment: namespace:tidytable>

``` r
dt |> 
  dplyr::mutate(zip_code = purrr::map_chr(.data$zip_code, zipcodeR::normalize_zip)) |>  
  dplyr::mutate(zip_info = purrr::map_df(.data$zip_code, zipcodeR::reverse_zipcode), .after = zip_code) |>
  tidyr::unnest_wider(zip_info) |> 
  dplyr::select(city = major_city, 
                county, 
                state,
                zip_code,
                lat,
                lng,
                bounds_west,
                bounds_east,
                bounds_north,
                bounds_south,
                dplyr::contains("new"),
                dplyr::contains("est")) |> 
  tidyr::nest(geo = c(lat, lng, dplyr::starts_with("bounds")))
```

    #> Error in UseMethod("mutate"): no applicable method for 'mutate' applied to an object of class "function"

## Code of Conduct

Please note that the costoffice project is released with a [Contributor
Code of
Conduct](https://andrewallenbruce.github.io/costoffice/CODE_OF_CONDUCT.html).
By contributing to this project, you agree to abide by its terms.
