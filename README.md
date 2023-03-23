
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
[![CodeFactor](https://www.codefactor.io/repository/github/andrewallenbruce/costoffice/badge)](https://www.codefactor.io/repository/github/andrewallenbruce/costoffice)
[![Codecov test
coverage](https://codecov.io/gh/andrewallenbruce/costoffice/branch/main/graph/badge.svg)](https://app.codecov.io/gh/andrewallenbruce/costoffice?branch=main)
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
    #> # ℹ 73 more rows

<br>

Search specialties by keyword:

``` r
search_datasets(keyword = "medicine")
```

    #> # A tidytable: 12 × 5
    #>    specialty                            issued     modified   released   csv_url
    #>    <chr>                                <date>     <date>     <date>     <chr>  
    #>  1 addiction medicine                   2022-07-11 2022-07-11 2022-07-14 https:…
    #>  2 emergency medicine                   2022-07-11 2022-07-11 2022-07-14 https:…
    #>  3 geriatric medicine                   2022-07-11 2022-07-11 2022-07-14 https:…
    #>  4 internal medicine                    2022-07-11 2022-07-11 2022-07-14 https:…
    #>  5 nuclear medicine                     2022-07-11 2022-07-11 2022-07-14 https:…
    #>  6 osteopathic manipulative medicine    2022-07-11 2022-07-11 2022-07-14 https:…
    #>  7 pediatric medicine                   2022-07-11 2022-07-11 2022-07-14 https:…
    #>  8 physical medicine and rehabilitation 2022-07-11 2022-07-11 2022-07-14 https:…
    #>  9 preventive medicine                  2022-07-11 2022-07-11 2022-07-14 https:…
    #> 10 sleep medicine                       2022-07-11 2022-07-11 2022-07-14 https:…
    #> 11 sports medicine                      2022-07-11 2022-07-11 2022-07-14 https:…
    #> 12 undersea and hyperbaric medicine     2022-07-11 2022-07-11 2022-07-14 https:…

<br>

If you’re searching for one in particular, just supply the `specialty`
argument:

``` r
search_datasets(specialty = "cardiac surgery") |> tidytable::glimpse()
```

    #> Rows: 1
    #> Columns: 5
    #> $ specialty <chr> "cardiac surgery"
    #> $ issued    <date> 2022-07-11
    #> $ modified  <date> 2022-07-11
    #> $ released  <date> 2022-07-14
    #> $ csv_url   <chr> "https://data.cms.gov/provider-data/sites/default/files/reso…

<br>

## Downloading A Dataset

Each dataset has approximately 43k rows and is roughly 4.5 to 5 MB.

``` r
search_datasets(specialty = "vascular surgery") |> 
  download_dataset() |> 
  tidytable::slice_sample(n = 10) |> 
  knitr::kable()
```

| specialty        | zip_code | new_code | new_price_min | new_price_max | new_price_mode | new_copay_min | new_copay_max | new_copay_mode | est_code | est_price_min | est_price_max | est_price_mode | est_copay_min | est_copay_max | est_copay_mode |
|:-----------------|:---------|:---------|--------------:|--------------:|---------------:|--------------:|--------------:|---------------:|:---------|--------------:|--------------:|---------------:|--------------:|--------------:|---------------:|
| vascular surgery | 96706    | 99203    |        63.016 |       188.112 |         96.112 |        15.754 |        47.028 |         24.028 | 99213    |        20.256 |       154.368 |         78.416 |         5.064 |        38.592 |         19.604 |
| vascular surgery | 67518    | 99203    |        54.992 |       168.072 |         84.856 |        13.748 |        42.018 |         21.214 | 99213    |        17.064 |       137.624 |         69.248 |         4.266 |        34.406 |         17.312 |
| vascular surgery | 67622    | 99203    |        54.992 |       168.072 |         84.856 |        13.748 |        42.018 |         21.214 | 99213    |        17.064 |       137.624 |         69.248 |         4.266 |        34.406 |         17.312 |
| vascular surgery | 19496    | 99203    |        62.800 |       189.432 |         96.312 |        15.700 |        47.358 |         24.078 | 99213    |        19.680 |       154.624 |         78.224 |         4.920 |        38.656 |         19.556 |
| vascular surgery | 15220    | 99203    |        57.024 |       174.056 |         87.960 |        14.256 |        43.514 |         21.990 | 99213    |        17.592 |       142.080 |         71.536 |         4.398 |        35.520 |         17.884 |
| vascular surgery | 73169    | 99203    |        54.976 |       168.904 |         85.072 |        13.744 |        42.226 |         21.268 | 99213    |        16.800 |       137.832 |         69.216 |         4.200 |        34.458 |         17.304 |
| vascular surgery | 77841    | 99203    |        56.752 |       172.600 |         87.360 |        14.188 |        43.150 |         21.840 | 99213    |        17.720 |       141.296 |         71.240 |         4.430 |        35.324 |         17.810 |
| vascular surgery | 84660    | 99203    |        56.184 |       171.824 |         86.744 |        14.046 |        42.956 |         21.686 | 99213    |        17.304 |       140.304 |         70.584 |         4.326 |        35.076 |         17.646 |
| vascular surgery | 25149    | 99203    |        55.312 |       170.816 |         85.848 |        13.828 |        42.704 |         21.462 | 99213    |        16.616 |       138.832 |         69.568 |         4.154 |        34.708 |         17.392 |
| vascular surgery | 32147    | 99203    |        58.400 |       178.792 |         90.248 |        14.600 |        44.698 |         22.562 | 99213    |        17.744 |       145.288 |         73.056 |         4.436 |        36.322 |         18.264 |

<br>

## Geocoding with `zipcodeR`

``` r
search_datasets(specialty = "vascular surgery") |> 
  download_dataset() |> 
  tidytable::slice_sample(n = 10) |> 
  use_zipcoder() |> 
  knitr::kable()
```

| city         | county            | state | zip_code | specialty        | new_code | new_price_min | new_price_max | new_price_mode | new_copay_min | new_copay_max | new_copay_mode | est_code | est_price_min | est_price_max | est_price_mode | est_copay_min | est_copay_max | est_copay_mode |    lat |      lng | bounds_west | bounds_east | bounds_north | bounds_south |
|:-------------|:------------------|:------|:---------|:-----------------|:---------|--------------:|--------------:|---------------:|--------------:|--------------:|---------------:|:---------|--------------:|--------------:|---------------:|--------------:|--------------:|---------------:|-------:|---------:|------------:|------------:|-------------:|-------------:|
| Talking Rock | Pickens County    | GA    | 30175    | vascular surgery | 99203    |        55.192 |       169.736 |         85.456 |        13.798 |        42.434 |         21.364 | 99213    |        16.800 |       138.360 |         69.448 |         4.200 |        34.590 |         17.362 | 34.500 |  -84.500 |   -84.65452 |   -84.38035 |     34.64022 |     34.46176 |
| Basalt       | Eagle County      | CO    | 81621    | vascular surgery | 99203    |        60.064 |       181.008 |         92.048 |        15.016 |        45.252 |         23.012 | 99213    |        18.984 |       148.200 |         75.000 |         4.746 |        37.050 |         18.750 | 39.400 | -106.900 |  -107.15523 |  -106.50921 |     39.48476 |     39.23101 |
| Yuma         | Yuma County       | AZ    | 85369    | vascular surgery | 99203    |        57.312 |       174.672 |         88.336 |        14.328 |        43.668 |         22.084 | 99213    |        17.744 |       142.648 |         71.864 |         4.436 |        35.662 |         17.966 |     NA |       NA |          NA |          NA |           NA |           NA |
| Frazeysburg  | Muskingum County  | OH    | 43822    | vascular surgery | 99203    |        56.744 |       173.944 |         87.728 |        14.186 |        43.486 |         21.932 | 99213    |        17.312 |       141.664 |         71.200 |         4.328 |        35.416 |         17.800 | 40.200 |  -82.200 |   -82.28578 |   -82.03662 |     40.28707 |     40.06257 |
| Delray Beach | Palm Beach County | FL    | 33483    | vascular surgery | 99203    |        61.368 |       187.008 |         94.648 |        15.342 |        46.752 |         23.662 | 99213    |        18.680 |       151.656 |         76.408 |         4.670 |        37.914 |         19.102 | 26.460 |  -80.060 |   -80.07631 |   -80.04659 |     26.50739 |     26.42056 |
| Chicago      | Cook County       | IL    | 60660    | vascular surgery | 99203    |        63.000 |       191.320 |         96.992 |        15.750 |        47.830 |         24.248 | 99213    |        19.296 |       155.264 |         78.336 |         4.824 |        38.816 |         19.584 | 41.980 |  -87.660 |   -87.68147 |   -87.64885 |     41.99919 |     41.98177 |
| Gallatin     | Cherokee County   | TX    | 75764    | vascular surgery | 99203    |        56.752 |       172.600 |         87.360 |        14.188 |        43.150 |         21.840 | 99213    |        17.720 |       141.296 |         71.240 |         4.430 |        35.324 |         17.810 | 31.923 |  -95.145 |   -95.15808 |   -95.13537 |     31.90656 |     31.87959 |
| Camptonville | Yuba County       | CA    | 95922    | vascular surgery | 99203    |        60.864 |       183.392 |         93.256 |        15.216 |        45.848 |         23.314 | 99213    |        19.296 |       150.360 |         76.096 |         4.824 |        37.590 |         19.024 | 39.600 | -121.000 |  -121.16333 |  -120.90435 |     39.60680 |     39.36807 |
| Tallahassee  | Leon County       | FL    | 32308    | vascular surgery | 99203    |        58.400 |       178.792 |         90.248 |        14.600 |        44.698 |         22.562 | 99213    |        17.744 |       145.288 |         73.056 |         4.436 |        36.322 |         18.264 | 30.490 |  -84.250 |   -84.27708 |   -84.15861 |     30.50179 |     30.44310 |
| Fayette      | Seneca County     | NY    | 13065    | vascular surgery | 99203    |        57.176 |       174.056 |         88.064 |        14.294 |        43.514 |         22.016 | 99213    |        17.760 |       142.280 |         71.712 |         4.440 |        35.570 |         17.928 |     NA |       NA |          NA |          NA |           NA |           NA |

<br>

## Summary Statistics by State

Current average prices by state for a **New Patient** office visit to a
**Vascular Surgeon**:

``` r
search_datasets(specialty = "vascular surgery") |> 
  download_dataset() |> 
  use_zipcoder() |> 
  tidytable::select(specialty, 
                    state, 
                    tidytable::starts_with("new_")) |> 
  tidytable::summarise(avg_price_mode = round(mean(new_price_mode), 2),
                       avg_copay_mode = round(mean(new_copay_mode), 2),
                       .by = c(specialty, 
                               state, 
                               new_code)) |> 
  tidytable::drop_na() |> 
  knitr::kable()
```

| specialty        | state | new_code | avg_price_mode | avg_copay_mode |
|:-----------------|:------|:---------|---------------:|---------------:|
| vascular surgery | AK    | 99203    |         116.69 |          29.17 |
| vascular surgery | AL    | 99203    |          85.95 |          21.49 |
| vascular surgery | AR    | 99203    |          82.31 |          20.58 |
| vascular surgery | AZ    | 99203    |          88.34 |          22.08 |
| vascular surgery | CA    | 99203    |          97.69 |          24.42 |
| vascular surgery | CO    | 99203    |          92.05 |          23.01 |
| vascular surgery | CT    | 99203    |          97.18 |          24.30 |
| vascular surgery | DC    | 99203    |         104.59 |          26.15 |
| vascular surgery | DE    | 99203    |          91.85 |          22.96 |
| vascular surgery | FL    | 99203    |          91.92 |          22.98 |
| vascular surgery | GA    | 99203    |          86.83 |          21.71 |
| vascular surgery | HI    | 99203    |          96.11 |          24.03 |
| vascular surgery | IA    | 99203    |          84.67 |          21.17 |
| vascular surgery | ID    | 99203    |          83.37 |          20.84 |
| vascular surgery | IL    | 99203    |          90.37 |          22.59 |
| vascular surgery | IN    | 99203    |          84.54 |          21.14 |
| vascular surgery | KS    | 99203    |          84.86 |          21.21 |
| vascular surgery | KY    | 99203    |          84.75 |          21.19 |
| vascular surgery | LA    | 99203    |          87.37 |          21.84 |
| vascular surgery | MA    | 99203    |          96.24 |          24.06 |
| vascular surgery | MD    | 99203    |          97.23 |          24.31 |
| vascular surgery | ME    | 99203    |          86.06 |          21.51 |
| vascular surgery | MI    | 99203    |          88.46 |          22.12 |
| vascular surgery | MN    | 99203    |          88.84 |          22.21 |
| vascular surgery | MO    | 99203    |          85.12 |          21.28 |
| vascular surgery | MS    | 99203    |          82.96 |          20.74 |
| vascular surgery | MT    | 99203    |          90.90 |          22.73 |
| vascular surgery | NC    | 99203    |          87.21 |          21.80 |
| vascular surgery | ND    | 99203    |          88.62 |          22.15 |
| vascular surgery | NE    | 99203    |          83.92 |          20.98 |
| vascular surgery | NH    | 99203    |          92.26 |          23.06 |
| vascular surgery | NJ    | 99203    |         100.13 |          25.03 |
| vascular surgery | NM    | 99203    |          87.31 |          21.83 |
| vascular surgery | NV    | 99203    |          92.70 |          23.17 |
| vascular surgery | NY    | 99203    |          96.01 |          24.00 |
| vascular surgery | OH    | 99203    |          87.73 |          21.93 |
| vascular surgery | OK    | 99203    |          85.07 |          21.27 |
| vascular surgery | OR    | 99203    |          88.22 |          22.06 |
| vascular surgery | PA    | 99203    |          89.32 |          22.33 |
| vascular surgery | PR    | 99203    |          91.28 |          22.82 |
| vascular surgery | RI    | 99203    |          93.88 |          23.47 |
| vascular surgery | SC    | 99203    |          85.63 |          21.41 |
| vascular surgery | SD    | 99203    |          88.26 |          22.07 |
| vascular surgery | TN    | 99203    |          84.32 |          21.08 |
| vascular surgery | TX    | 99203    |          88.43 |          22.11 |
| vascular surgery | UT    | 99203    |          86.74 |          21.69 |
| vascular surgery | VA    | 99203    |          91.87 |          22.97 |
| vascular surgery | VT    | 99203    |          89.24 |          22.31 |
| vascular surgery | WA    | 99203    |          92.12 |          23.03 |
| vascular surgery | WI    | 99203    |          85.61 |          21.40 |
| vascular surgery | WV    | 99203    |          85.85 |          21.46 |
| vascular surgery | WY    | 99203    |          90.34 |          22.58 |

<br>

Current average prices by state for an **Established Patient** office
visit to a **Cardiologist**:

``` r
search_datasets(specialty = "cardiology") |> 
  download_dataset() |> 
  use_zipcoder() |> 
  tidytable::select(specialty, 
                    state, 
                    tidytable::starts_with("est_")) |> 
  tidytable::summarise(avg_price_mode = round(mean(est_price_mode), 2),
                       avg_copay_mode = round(mean(est_copay_mode), 2),
                       .by = c(specialty, 
                               state, 
                               est_code)) |> 
  tidytable::drop_na() |> 
  knitr::kable()
```

| specialty  | state | est_code | avg_price_mode | avg_copay_mode |
|:-----------|:------|:---------|---------------:|---------------:|
| cardiology | AK    | 99214    |         135.85 |          33.96 |
| cardiology | AL    | 99214    |          99.34 |          24.83 |
| cardiology | AR    | 99214    |          95.61 |          23.90 |
| cardiology | AZ    | 99214    |         102.07 |          25.52 |
| cardiology | CA    | 99214    |         112.92 |          28.23 |
| cardiology | CO    | 99214    |         106.33 |          26.58 |
| cardiology | CT    | 99214    |         112.10 |          28.02 |
| cardiology | DC    | 99214    |         120.20 |          30.05 |
| cardiology | DE    | 99214    |         105.98 |          26.50 |
| cardiology | FL    | 99214    |         105.48 |          26.37 |
| cardiology | GA    | 99214    |         100.34 |          25.08 |
| cardiology | HI    | 99214    |         111.01 |          27.75 |
| cardiology | IA    | 99214    |          98.30 |          24.57 |
| cardiology | ID    | 99214    |          96.84 |          24.21 |
| cardiology | IL    | 99214    |         103.97 |          25.99 |
| cardiology | IN    | 99214    |          98.12 |          24.53 |
| cardiology | KS    | 99214    |          98.47 |          24.62 |
| cardiology | KY    | 99214    |          98.06 |          24.52 |
| cardiology | LA    | 99214    |         100.61 |          25.15 |
| cardiology | MA    | 99214    |         111.09 |          27.77 |
| cardiology | MD    | 99214    |         111.90 |          27.98 |
| cardiology | ME    | 99214    |          99.67 |          24.92 |
| cardiology | MI    | 99214    |         102.01 |          25.50 |
| cardiology | MN    | 99214    |         103.05 |          25.76 |
| cardiology | MO    | 99214    |          98.47 |          24.62 |
| cardiology | MS    | 99214    |          96.18 |          24.04 |
| cardiology | MT    | 99214    |         104.87 |          26.22 |
| cardiology | NC    | 99214    |         100.83 |          25.21 |
| cardiology | ND    | 99214    |         102.74 |          25.68 |
| cardiology | NE    | 99214    |          97.60 |          24.40 |
| cardiology | NH    | 99214    |         106.44 |          26.61 |
| cardiology | NJ    | 99214    |         115.41 |          28.85 |
| cardiology | NM    | 99214    |         100.67 |          25.17 |
| cardiology | NV    | 99214    |         106.60 |          26.65 |
| cardiology | NY    | 99214    |         110.32 |          27.58 |
| cardiology | OH    | 99214    |         101.20 |          25.30 |
| cardiology | OK    | 99214    |          98.46 |          24.61 |
| cardiology | OR    | 99214    |         102.22 |          25.55 |
| cardiology | PA    | 99214    |         103.13 |          25.78 |
| cardiology | PR    | 99214    |         105.28 |          26.32 |
| cardiology | RI    | 99214    |         108.29 |          27.07 |
| cardiology | SC    | 99214    |          99.16 |          24.79 |
| cardiology | SD    | 99214    |         102.41 |          25.60 |
| cardiology | TN    | 99214    |          97.85 |          24.46 |
| cardiology | TX    | 99214    |         102.41 |          25.60 |
| cardiology | UT    | 99214    |         100.33 |          25.08 |
| cardiology | VA    | 99214    |         106.01 |          26.50 |
| cardiology | VT    | 99214    |         103.32 |          25.83 |
| cardiology | WA    | 99214    |         106.44 |          26.61 |
| cardiology | WI    | 99214    |          99.46 |          24.86 |
| cardiology | WV    | 99214    |          98.99 |          24.75 |
| cardiology | WY    | 99214    |         104.34 |          26.08 |

<br>

## Download All Datasets

``` r
search_datasets() |>
  dplyr::select(csv_url) |>
  dplyr::slice_head(n = 10) |> # remove to download all sets
  tibble::deframe() |>
  rlang::set_names(basename) |>
  purrr::map(download_dataset_purrr) |>
  purrr::list_rbind(names_to = "filename") |>
  tidytable::separate_wider_delim(filename,
                                  delim = ".",
                                  names = c("specialty", "ext")) |>
  tidytable::mutate(ext = NULL) |>
  use_zipcoder() |>
  tidytable::drop_na() |>
  tidytable::relocate(specialty)
```

    #> # A tidytable: 331,040 × 25
    #>    specialty    city  county state zip_code new_code new_price_min new_price_max
    #>    <chr>        <chr> <chr>  <chr> <chr>    <chr>            <dbl>         <dbl>
    #>  1 Addiction_M… Agua… Aguad… PR    00602    99204             59.4          180.
    #>  2 Addiction_M… Agua… Aguad… PR    00603    99204             59.4          180.
    #>  3 Addiction_M… Mari… Maric… PR    00606    99204             59.4          180.
    #>  4 Addiction_M… Anas… Aasco… PR    00610    99204             59.4          180.
    #>  5 Addiction_M… Arec… Areci… PR    00612    99204             59.4          180.
    #>  6 Addiction_M… Baja… Areci… PR    00616    99204             59.4          180.
    #>  7 Addiction_M… Barc… Barce… PR    00617    99204             59.4          180.
    #>  8 Addiction_M… Boqu… Cabo … PR    00622    99204             59.4          180.
    #>  9 Addiction_M… Cabo… Cabo … PR    00623    99204             59.4          180.
    #> 10 Addiction_M… Camuy Camuy… PR    00627    99204             59.4          180.
    #> # ℹ 331,030 more rows
    #> # ℹ 17 more variables: new_price_mode <dbl>, new_copay_min <dbl>,
    #> #   new_copay_max <dbl>, new_copay_mode <dbl>, est_code <chr>,
    #> #   est_price_min <dbl>, est_price_max <dbl>, est_price_mode <dbl>,
    #> #   est_copay_min <dbl>, est_copay_max <dbl>, est_copay_mode <dbl>, lat <dbl>,
    #> #   lng <dbl>, bounds_west <dbl>, bounds_east <dbl>, bounds_north <dbl>,
    #> #   bounds_south <dbl>

<br>

## Download `arrow` Table Objects

``` r
download_dataset_arrow(specialty = "addiction medicine") |> 
  use_zipcoder_arrow()
```

    #> Table (query)
    #> city: string
    #> county: string
    #> state: string
    #> zip_code: string
    #> new_code: string
    #> new_price_min: double
    #> new_price_max: double
    #> new_price_mode: double
    #> new_copay_min: double
    #> new_copay_max: double
    #> new_copay_mode: double
    #> est_code: string
    #> est_price_min: double
    #> est_price_max: double
    #> est_price_mode: double
    #> est_copay_min: double
    #> est_copay_max: double
    #> est_copay_mode: double
    #> specialty: string
    #> lat: double
    #> lng: double
    #> bounds_west: double
    #> bounds_east: double
    #> bounds_north: double
    #> bounds_south: double
    #> 
    #> See $.data for the source Arrow object

<br>

## Code of Conduct

Please note that the `costoffice` project is released with a
[Contributor Code of
Conduct](https://andrewallenbruce.github.io/costoffice/CODE_OF_CONDUCT.html).
By contributing to this project, you agree to abide by its terms.
