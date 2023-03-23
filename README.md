
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
| vascular surgery | 01088    | 99203    |        61.328 |       185.128 |         94.072 |        15.332 |        46.282 |         23.518 | 99213    |        19.312 |       151.472 |         76.608 |         4.828 |        37.868 |         19.152 |
| vascular surgery | 71711    | 99203    |        53.136 |       163.672 |         82.312 |        13.284 |        40.918 |         20.578 | 99213    |        16.264 |       133.848 |         67.144 |         4.066 |        33.462 |         16.786 |
| vascular surgery | 35079    | 99203    |        55.544 |       170.616 |         85.952 |        13.886 |        42.654 |         21.488 | 99213    |        16.936 |       139.088 |         69.848 |         4.234 |        34.772 |         17.462 |
| vascular surgery | 41542    | 99203    |        54.720 |       168.416 |         84.752 |        13.680 |        42.104 |         21.188 | 99213    |        16.656 |       137.344 |         68.920 |         4.164 |        34.336 |         17.230 |
| vascular surgery | 39121    | 99203    |        53.504 |       165.088 |         82.960 |        13.376 |        41.272 |         20.740 | 99213    |        16.256 |       134.744 |         67.544 |         4.064 |        33.686 |         16.886 |
| vascular surgery | 43947    | 99203    |        56.744 |       173.944 |         87.728 |        14.186 |        43.486 |         21.932 | 99213    |        17.312 |       141.664 |         71.200 |         4.328 |        35.416 |         17.800 |
| vascular surgery | 59535    | 99203    |        59.120 |       179.288 |         90.904 |        14.780 |        44.822 |         22.726 | 99213    |        18.416 |       146.416 |         73.912 |         4.604 |        36.604 |         18.478 |
| vascular surgery | 30034    | 99203    |        58.880 |       178.512 |         90.512 |        14.720 |        44.628 |         22.628 | 99213    |        18.368 |       145.864 |         73.632 |         4.592 |        36.466 |         18.408 |
| vascular surgery | 94289    | 99203    |        61.528 |       185.296 |         94.248 |        15.382 |        46.324 |         23.562 | 99213    |        19.528 |       151.944 |         76.912 |         4.882 |        37.986 |         19.228 |
| vascular surgery | 93385    | 99203    |        61.336 |       185.104 |         94.064 |        15.334 |        46.276 |         23.516 | 99213    |        19.368 |       151.616 |         76.688 |         4.842 |        37.904 |         19.172 |

<br>

## Geocoding with `zipcodeR`

``` r
search_datasets(specialty = "vascular surgery") |> 
  download_dataset() |> 
  tidytable::slice_sample(n = 10) |> 
  use_zipcoder() |> 
  knitr::kable()
```

| city         | county                 | state | zip_code | specialty        | new_code | new_price_min | new_price_max | new_price_mode | new_copay_min | new_copay_max | new_copay_mode | est_code | est_price_min | est_price_max | est_price_mode | est_copay_min | est_copay_max | est_copay_mode |   lat |     lng | bounds_west | bounds_east | bounds_north | bounds_south |
|:-------------|:-----------------------|:------|:---------|:-----------------|:---------|--------------:|--------------:|---------------:|--------------:|--------------:|---------------:|:---------|--------------:|--------------:|---------------:|--------------:|--------------:|---------------:|------:|--------:|------------:|------------:|-------------:|-------------:|
| Clifford     | Lapeer County          | MI    | 48727    | vascular surgery | 99203    |        56.392 |       172.800 |         87.160 |        14.098 |        43.200 |         21.790 | 99213    |        17.248 |       140.864 |         70.808 |         4.312 |        35.216 |         17.702 | 43.32 |  -83.18 |   -83.23646 |   -83.11903 |     43.36908 |     43.26757 |
| Corvallis    | Ravalli County         | MT    | 59828    | vascular surgery | 99203    |        59.120 |       179.288 |         90.904 |        14.780 |        44.822 |         22.726 | 99213    |        18.416 |       146.416 |         73.912 |         4.604 |        36.604 |         18.478 | 46.30 | -114.00 |  -114.15560 |  -113.77160 |     46.42728 |     46.24083 |
| Springfield  | Greene County          | MO    | 65809    | vascular surgery | 99203    |        54.200 |       167.176 |         84.040 |        13.550 |        41.794 |         21.010 | 99213    |        16.432 |       136.288 |         68.328 |         4.108 |        34.072 |         17.082 | 37.17 |  -93.19 |   -93.23100 |   -93.13323 |     37.20955 |     37.10623 |
| Blue Springs | Gage County            | NE    | 68318    | vascular surgery | 99203    |        54.432 |       166.144 |         83.920 |        13.608 |        41.536 |         20.980 | 99213    |        17.000 |       136.312 |         68.624 |         4.250 |        34.078 |         17.156 | 40.10 |  -96.60 |   -96.78470 |   -96.53792 |     40.20435 |     40.10262 |
| Collins      | Covington County       | MS    | 39428    | vascular surgery | 99203    |        53.504 |       165.088 |         82.960 |        13.376 |        41.272 |         20.740 | 99213    |        16.256 |       134.744 |         67.544 |         4.064 |        33.686 |         16.886 | 31.60 |  -89.60 |   -89.75580 |   -89.40027 |     31.77159 |     31.53595 |
| Silver Bay   | Lake County            | MN    | 55614    | vascular surgery | 99203    |        57.952 |       174.840 |         88.840 |        14.488 |        43.710 |         22.210 | 99213    |        18.416 |       143.568 |         72.624 |         4.604 |        35.892 |         18.156 | 47.40 |  -91.30 |   -91.63966 |   -91.01855 |     47.53453 |     47.18394 |
| Butler       | Custer County          | OK    | 73625    | vascular surgery | 99203    |        54.976 |       168.904 |         85.072 |        13.744 |        42.226 |         21.268 | 99213    |        16.800 |       137.832 |         69.216 |         4.200 |        34.458 |         17.304 | 35.60 |  -99.30 |   -99.32362 |   -99.06640 |     35.80149 |     35.53837 |
| Grover Beach | San Luis Obispo County | CA    | 93433    | vascular surgery | 99203    |        61.480 |       184.856 |         94.104 |        15.370 |        46.214 |         23.526 | 99213    |        19.560 |       151.616 |         76.792 |         4.890 |        37.904 |         19.198 | 35.12 | -120.62 |  -120.64014 |  -120.60476 |     35.13437 |     35.10548 |
| NA           | NA                     | NA    | 83447    | vascular surgery | 99203    |        53.936 |       165.440 |         83.368 |        13.484 |        41.360 |         20.842 | 99213    |        16.648 |       135.440 |         68.048 |         4.162 |        33.860 |         17.012 |    NA |      NA |          NA |          NA |           NA |           NA |
| Baltimore    | Baltimore County       | MD    | 21209    | vascular surgery | 99203    |        63.640 |       191.952 |         97.608 |        15.910 |        47.988 |         24.402 | 99213    |        19.912 |       156.576 |         79.216 |         4.978 |        39.144 |         19.804 | 39.37 |  -76.68 |   -76.70723 |   -76.63941 |     39.39774 |     39.33820 |

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

    #> Error in data.table::fread(...): input= must be a single character string containing a file name, a system command containing at least one space, a URL starting 'http[s]://', 'ftp[s]://' or 'file://', or, the input data itself containing at least one \n or \r

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
