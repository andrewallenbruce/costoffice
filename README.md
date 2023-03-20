
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
```

<br>

To retrieve information on all of the data sets (83 specialties in
total), simply call `search_datasets()` with no arguments:

``` r
search_datasets()
```

    #> # A tidytable: 83 × 5
    #>    specialty                            issued     modified   released   csv_url
    #>    <chr>                                <date>     <date>     <date>     <chr>  
    #>  1 addiction medicine                   2022-07-11 2022-07-11 2022-07-14 https:…
    #>  2 advanced heart failure and transpla… 2022-07-11 2022-07-11 2022-07-14 https:…
    #>  3 allergy/ immunology                  2022-07-11 2022-07-11 2022-07-14 https:…
    #>  4 anesthesiology                       2022-07-11 2022-07-11 2022-07-14 https:…
    #>  5 cardiac surgery                      2022-07-11 2022-07-11 2022-07-14 https:…
    #>  6 cardiology                           2022-07-11 2022-07-11 2022-07-14 https:…
    #>  7 certified clinical nurse specialist  2022-07-11 2022-07-11 2022-07-14 https:…
    #>  8 certified nurse midwife              2022-07-11 2022-07-11 2022-07-14 https:…
    #>  9 certified registered nurse anesthet… 2022-07-11 2022-07-11 2022-07-14 https:…
    #> 10 clinic or group practice             2022-07-11 2022-07-11 2022-07-14 https:…
    #> # … with 73 more rows

<br>

If you’re searching for one in particular, just supply the `specialty`
argument:

``` r
search_datasets(specialty = "vascular surgery") |> dplyr::glimpse()
```

    #> Rows: 1
    #> Columns: 5
    #> $ specialty <chr> "vascular surgery"
    #> $ issued    <date> 2022-07-11
    #> $ modified  <date> 2022-07-11
    #> $ released  <date> 2022-07-14
    #> $ csv_url   <chr> "https://data.cms.gov/provider-data/sites/default/files/reso…

<br>

## Downloading Datasets

``` r
vasc <- search_datasets(specialty = "vascular surgery")

dt <- data.table::fread(vasc$csv_url)

lobstr::obj_size(dt)
```

    #> 4.64 MB

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
dt
```

    #> # A tibble: 25 × 15
    #>    zip_code new_top_code new_p…¹ new_p…² new_p…³ new_c…⁴ new_c…⁵ new_c…⁶ est_t…⁷
    #>       <int>        <int>   <dbl>   <dbl>   <dbl>   <dbl>   <dbl>   <dbl>   <int>
    #>  1    80465        99203    60.1    181.    92.0    15.0    45.3    23.0   99213
    #>  2    16255        99203    57.0    174.    88.0    14.3    43.5    22.0   99213
    #>  3    32878        99203    58.4    179.    90.2    14.6    44.7    22.6   99213
    #>  4    99169        99203    59.0    178.    90.5    14.7    44.6    22.6   99213
    #>  5    79056        99203    56.8    173.    87.4    14.2    43.2    21.8   99213
    #>  6    15522        99203    57.0    174.    88.0    14.3    43.5    22.0   99213
    #>  7    30284        99203    55.2    170.    85.5    13.8    42.4    21.4   99213
    #>  8    38334        99203    54.6    167.    84.3    13.6    41.8    21.1   99213
    #>  9    31744        99203    55.2    170.    85.5    13.8    42.4    21.4   99213
    #> 10    80602        99203    60.1    181.    92.0    15.0    45.3    23.0   99213
    #> # … with 15 more rows, 6 more variables: est_price_min <dbl>,
    #> #   est_price_max <dbl>, est_price_mode <dbl>, est_copay_min <dbl>,
    #> #   est_copay_max <dbl>, est_copay_mode <dbl>, and abbreviated variable names
    #> #   ¹​new_price_min, ²​new_price_max, ³​new_price_mode, ⁴​new_copay_min,
    #> #   ⁵​new_copay_max, ⁶​new_copay_mode, ⁷​est_top_code

``` r
library(zipcodeR)
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

    #> # A tibble: 25 × 19
    #>    city     county state zip_c…¹ new_t…² new_p…³ new_p…⁴ new_p…⁵ new_c…⁶ new_c…⁷
    #>    <chr>    <chr>  <chr> <chr>     <int>   <dbl>   <dbl>   <dbl>   <dbl>   <dbl>
    #>  1 Morrison Jeffe… CO    80465     99203    60.1    181.    92.0    15.0    45.3
    #>  2 Sligo    Clari… PA    16255     99203    57.0    174.    88.0    14.3    43.5
    #>  3 Orlando  Orang… FL    32878     99203    58.4    179.    90.2    14.6    44.7
    #>  4 Ritzvil… Adams… WA    99169     99203    59.0    178.    90.5    14.7    44.6
    #>  5 Lipscomb Lipsc… TX    79056     99203    56.8    173.    87.4    14.2    43.2
    #>  6 Bedford  Bedfo… PA    15522     99203    57.0    174.    88.0    14.3    43.5
    #>  7 Sunny S… Spald… GA    30284     99203    55.2    170.    85.5    13.8    42.4
    #>  8 Finger   McNai… TN    38334     99203    54.6    167.    84.3    13.6    41.8
    #>  9 Doerun   Colqu… GA    31744     99203    55.2    170.    85.5    13.8    42.4
    #> 10 Brighton Adams… CO    80602     99203    60.1    181.    92.0    15.0    45.3
    #> # … with 15 more rows, 9 more variables: new_copay_mode <dbl>,
    #> #   est_top_code <int>, est_price_min <dbl>, est_price_max <dbl>,
    #> #   est_price_mode <dbl>, est_copay_min <dbl>, est_copay_max <dbl>,
    #> #   est_copay_mode <dbl>, geo <list>, and abbreviated variable names ¹​zip_code,
    #> #   ²​new_top_code, ³​new_price_min, ⁴​new_price_max, ⁵​new_price_mode,
    #> #   ⁶​new_copay_min, ⁷​new_copay_max

## Code of Conduct

Please note that the costoffice project is released with a [Contributor
Code of
Conduct](https://andrewallenbruce.github.io/costoffice/CODE_OF_CONDUCT.html).
By contributing to this project, you agree to abide by its terms.
