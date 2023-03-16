
<!-- README.md is generated from README.Rmd. Please edit that file -->

# `costoffice`

<!-- badges: start -->
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

## Motivation

``` r
library(costoffice)
```

<br>

``` r
search_datasets()
```

    #> # A tibble: 83 × 5
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

``` r
search_datasets(specialty = "vascular surgery")
```

    #> # A tibble: 1 × 5
    #>   specialty        issued     modified   released   csv_url                     
    #>   <chr>            <date>     <date>     <date>     <chr>                       
    #> 1 vascular surgery 2022-07-11 2022-07-11 2022-07-14 https://data.cms.gov/provid…

<br>
