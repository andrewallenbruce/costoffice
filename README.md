
<!-- README.md is generated from README.Rmd. Please edit that file -->

# `costoffice` <a href="https://andrewallenbruce.github.io/costoffice/"><img src="man/figures/logo.png" align="right" height="200" /></a>

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
devtools::install_github("andrewallenbruce/costoffice", build_vignettes = TRUE)
```

``` r
# install.packages("remotes")
remotes::install_github("andrewallenbruce/costoffice", build_vignettes = TRUE)
```

``` r
library(costoffice)
```

## Purpose

The `costoffice` package contains functions enabling the user to access
the latest **Physician Office Visit Costs** datasets from
[Data.CMS.gov](https://data.cms.gov/provider-data/search?page-size=50&theme=Physician%20office%20visit%20costs).

There are 83 datasets in total, each representing a different medical
specialty. Each one contains the:

- Most Utilized Procedure Code (HCPCS Level II aka CPT code)
- Minimum/Maximum/Mode Price Medicare Paid
- Minimum/Maximum/Mode Copay the Patient Paid

by zip code, for new and established patients both.

<br>

## `search_datasets()`

Returns dataset information such as title, dates concerning data
freshness and, most importantly, a csv download url.

<br>

Use the `specialty` argument to return only *exact* matches:

``` r
search_datasets(specialty = "cardiac surgery")
```

    #> # A tidytable: 1 × 6
    #>   specialty       title                 issued     modified   released   csv_url
    #>   <chr>           <chr>                 <date>     <date>     <date>     <chr>  
    #> 1 cardiac surgery Cardiac Surgery Offi… 2022-07-11 2022-07-11 2022-07-14 https:…

<br>

> Return a vector of the exact names of the medical specialties by
> simply calling `search_datasets()$specialty`.

<br>

Use the `keyword` argument to return *partial* matches:

``` r
search_datasets(keyword = "medicine")
```

    #> # A tidytable: 12 × 6
    #>    specialty                      title issued     modified   released   csv_url
    #>    <chr>                          <chr> <date>     <date>     <date>     <chr>  
    #>  1 addiction medicine             Addi… 2022-07-11 2022-07-11 2022-07-14 https:…
    #>  2 emergency medicine             Emer… 2022-07-11 2022-07-11 2022-07-14 https:…
    #>  3 geriatric medicine             Geri… 2022-07-11 2022-07-11 2022-07-14 https:…
    #>  4 internal medicine              Inte… 2022-07-11 2022-07-11 2022-07-14 https:…
    #>  5 nuclear medicine               Nucl… 2022-07-11 2022-07-11 2022-07-14 https:…
    #>  6 osteopathic manipulative medi… Oste… 2022-07-11 2022-07-11 2022-07-14 https:…
    #>  7 pediatric medicine             Pedi… 2022-07-11 2022-07-11 2022-07-14 https:…
    #>  8 physical medicine and rehabil… Phys… 2022-07-11 2022-07-11 2022-07-14 https:…
    #>  9 preventive medicine            Prev… 2022-07-11 2022-07-11 2022-07-14 https:…
    #> 10 sleep medicine                 Slee… 2022-07-11 2022-07-11 2022-07-14 https:…
    #> 11 sports medicine                Spor… 2022-07-11 2022-07-11 2022-07-14 https:…
    #> 12 undersea and hyperbaric medic… Unde… 2022-07-11 2022-07-11 2022-07-14 https:…

<br>

Calling the function with no arguments will return the entire dataset:

``` r
search_datasets()
```

    #> # A tidytable: 83 × 6
    #>    specialty                      title issued     modified   released   csv_url
    #>    <chr>                          <chr> <date>     <date>     <date>     <chr>  
    #>  1 addiction medicine             Addi… 2022-07-11 2022-07-11 2022-07-14 https:…
    #>  2 advanced heart failure and tr… Adva… 2022-07-11 2022-07-11 2022-07-14 https:…
    #>  3 allergy/ immunology            Alle… 2022-07-11 2022-07-11 2022-07-14 https:…
    #>  4 anesthesiology                 Anes… 2022-07-11 2022-07-11 2022-07-14 https:…
    #>  5 cardiac surgery                Card… 2022-07-11 2022-07-11 2022-07-14 https:…
    #>  6 cardiology                     Card… 2022-07-11 2022-07-11 2022-07-14 https:…
    #>  7 certified clinical nurse spec… Cert… 2022-07-11 2022-07-11 2022-07-14 https:…
    #>  8 certified nurse midwife        Cert… 2022-07-11 2022-07-11 2022-07-14 https:…
    #>  9 certified registered nurse an… Cert… 2022-07-11 2022-07-11 2022-07-14 https:…
    #> 10 clinic or group practice       Clin… 2022-07-11 2022-07-11 2022-07-14 https:…
    #> # ℹ 73 more rows

<br>

## `download_dataset()`

Once you’ve found the dataset that you’re interested in, simply insert
the `download_dataset()` function into your pipeline to retrieve the
csv:

``` r
search_datasets(specialty = "vascular surgery") |> 
  download_dataset() |> 
  head(n = 10)
```

    #> # A tidytable: 10 × 9
    #>    specialty        zip_code hcpcs patient cost    min   max  mode range
    #>    <chr>            <chr>    <chr> <chr>   <chr> <dbl> <dbl> <dbl> <dbl>
    #>  1 vascular surgery 00210    99203 new     copay  15.0  45.4  23.1  30.4
    #>  2 vascular surgery 00210    99203 new     price  60.1 182.   92.3 121. 
    #>  3 vascular surgery 00211    99203 new     copay  15.0  45.4  23.1  30.4
    #>  4 vascular surgery 00211    99203 new     price  60.1 182.   92.3 121. 
    #>  5 vascular surgery 00212    99203 new     copay  15.0  45.4  23.1  30.4
    #>  6 vascular surgery 00212    99203 new     price  60.1 182.   92.3 121. 
    #>  7 vascular surgery 00213    99203 new     copay  15.0  45.4  23.1  30.4
    #>  8 vascular surgery 00213    99203 new     price  60.1 182.   92.3 121. 
    #>  9 vascular surgery 00214    99203 new     copay  15.0  45.4  23.1  30.4
    #> 10 vascular surgery 00214    99203 new     price  60.1 182.   92.3 121.

<br>

## `use_zipcoder()`

``` r
x <- search_datasets(specialty = "vascular surgery") |> 
  download_dataset()
  #tidytable::slice_sample(n = 10) |> 
  use_zipcoder()
```

    #> Error in tidytable::left_join(df, zip_db): argument "df" is missing, with no default

<br>

## `download_datasets()`

``` r
download_datasets(keyword = "medicine") |> 
  summary_stats(condition = patient == "est",
                group_vars = c(specialty, hcpcs, cost),
                summary_vars = c(min, max, mode, range),
                arr = cost)
```

    #> # A tidytable: 24 × 12
    #>    specialty     hcpcs cost  median_min mean_min median_max mean_max median_mode
    #>    <chr>         <chr> <chr>      <dbl>    <dbl>      <dbl>    <dbl>       <dbl>
    #>  1 Addiction_Me… 99214 price       17.6     18.1       142.     145.       101. 
    #>  2 Emergency_Me… 99214 price       17.6     18.1       142.     145.       101. 
    #>  3 Geriatric_Me… 99214 price       17.6     18.1       142.     145.       101. 
    #>  4 Internal_Med… 99214 price       17.6     18.1       142.     145.       101. 
    #>  5 Nuclear_Medi… 99214 price       17.6     18.1       142.     145.       101. 
    #>  6 Osteopathic_… 99213 price       17.6     18.1       142.     145.        71.4
    #>  7 Pediatric_Me… 99214 price       17.6     18.1       142.     145.       101. 
    #>  8 Physical_Med… 99213 price       17.6     18.1       142.     145.        71.4
    #>  9 Preventive_M… 99213 price       17.6     18.1       142.     145.        71.4
    #> 10 Sleep_Medici… 99214 price       17.6     18.1       142.     145.       101. 
    #> # ℹ 14 more rows
    #> # ℹ 4 more variables: mean_mode <dbl>, median_range <dbl>, mean_range <dbl>,
    #> #   n <int>

<br>

## Summary Statistics by State

Current average prices by state for a **New Patient** office visit to a
**Vascular Surgeon**:

``` r
download_datasets(specialty = "vascular surgery") |>
  summary_stats(condition = patient == "new",
                group_vars = c(specialty, state, hcpcs, cost),
                summary_vars = c(min, max, mode, range),
                arr = cost)
```

    #> # A tidytable: 104 × 13
    #>    specialty        state hcpcs cost  median_min mean_min median_max mean_max
    #>    <chr>            <chr> <chr> <chr>      <dbl>    <dbl>      <dbl>    <dbl>
    #>  1 Vascular_Surgery AK    99203 price       74.8     74.8       234.     234.
    #>  2 Vascular_Surgery AL    99203 price       55.5     55.5       171.     171.
    #>  3 Vascular_Surgery AR    99203 price       53.1     53.1       164.     164.
    #>  4 Vascular_Surgery AZ    99203 price       57.3     57.3       175.     175.
    #>  5 Vascular_Surgery CA    99203 price       63.6     64.0       190.     191.
    #>  6 Vascular_Surgery CO    99203 price       60.1     60.1       181.     181.
    #>  7 Vascular_Surgery CT    99203 price       63.5     63.5       191.     191.
    #>  8 Vascular_Surgery DC    99203 price       68.6     68.6       205.     205.
    #>  9 Vascular_Surgery DE    99203 price       59.8     59.8       181.     181.
    #> 10 Vascular_Surgery FL    99203 price       58.4     59.5       179.     182.
    #> # ℹ 94 more rows
    #> # ℹ 5 more variables: median_mode <dbl>, mean_mode <dbl>, median_range <dbl>,
    #> #   mean_range <dbl>, n <int>

<br>

Current average prices by state for an **Established Patient** office
visit to a **Cardiologist**:

``` r
est_cardio <- download_datasets(specialty = "cardiology") |> 
  summary_stats(condition = patient == "est",
                group_vars = c(specialty, state, hcpcs, cost),
                summary_vars = c(min, max, mode, range),
                arr = cost)

est_cardio
```

    #> # A tidytable: 104 × 13
    #>    specialty  state hcpcs cost  median_min mean_min median_max mean_max
    #>    <chr>      <chr> <chr> <chr>      <dbl>    <dbl>      <dbl>    <dbl>
    #>  1 Cardiology AK    99214 price       22.4     22.4       191.     191.
    #>  2 Cardiology AL    99214 price       16.9     16.9       139.     139.
    #>  3 Cardiology AR    99214 price       16.3     16.3       134.     134.
    #>  4 Cardiology AZ    99214 price       17.7     17.7       143.     143.
    #>  5 Cardiology CA    99214 price       20.4     20.5       156.     157.
    #>  6 Cardiology CO    99214 price       19.0     19.0       148.     148.
    #>  7 Cardiology CT    99214 price       20.1     20.1       156.     156.
    #>  8 Cardiology DC    99214 price       21.9     21.9       167.     167.
    #>  9 Cardiology DE    99214 price       18.7     18.7       148.     148.
    #> 10 Cardiology FL    99214 price       17.7     18.1       145.     148.
    #> # ℹ 94 more rows
    #> # ℹ 5 more variables: median_mode <dbl>, mean_mode <dbl>, median_range <dbl>,
    #> #   mean_range <dbl>, n <int>

<br>

## Visualizations

``` r
p1 <- ggplot2::ggplot(est_cardio |> tidytable::filter(cost == "price"), 
      ggplot2::aes(forcats::fct_reorder(state, avg_mode, median), avg_mode)) + 
  ggplot2::geom_pointrange(ggplot2::aes(ymin = avg_min, ymax = avg_max), 
    size = 0, colour = "black", linewidth = 0.5) +
  ggplot2::geom_point(color = "black", size = 3) +
  ggplot2::coord_flip() +
  ggplot2::scale_y_continuous(labels = scales::label_dollar()) +
  ggplot2::labs(
    x = "", 
    y = "Minimum, Mode, Maximum",
    title = "",
    subtitle = "Price Ranges by State") +
  ggplot2::theme_minimal()

p2 <- ggplot2::ggplot(est_cardio |> tidytable::filter(cost == "copay"), 
      ggplot2::aes(forcats::fct_reorder(state, avg_mode, median), avg_mode)) + 
  ggplot2::geom_pointrange(ggplot2::aes(ymin = avg_min, ymax = avg_max), 
    size = 0, colour = "black", linewidth = 0.5) +
  ggplot2::geom_point(color = "black", size = 3) +
  ggplot2::coord_flip() +
  ggplot2::scale_y_continuous(labels = scales::label_dollar()) +
  ggplot2::labs(
    x = "", 
    y = "Minimum, Mode, Maximum",
    title = "",
    subtitle = "Copay Ranges by State") +
  ggplot2::theme_minimal()

library(patchwork)
(p1 + p2) +
  plot_annotation(
    title = "Cardiology: Established Patient Office Visit Costs",
    caption = "Source: data.cms.gov/provider-data",
    theme = ggplot2::theme(plot.title = ggplot2::element_text(size = 16))
  )
```

    #> Error in `ggplot2::geom_pointrange()`:
    #> ! Problem while computing aesthetics.
    #> ℹ Error occurred in the 1st layer.
    #> Caused by error in `stopifnot()`:
    #> ! object 'avg_mode' not found

<br>

``` r
library(statebins)

statebins(est_cardio |> tidytable::filter(cost == "copay"), 
          value_col = "avg_mode",
          name = "Average Medicare Copays",
          ggplot2_scale_function = viridis::scale_fill_viridis,
          direction = 1,
          round = FALSE) +
  ggplot2::labs(title = "Established Patient Office Visit Costs: Cardiology") +
  theme_statebins()
```

    #> Error in `geom_tile()`:
    #> ! Problem while computing aesthetics.
    #> ℹ Error occurred in the 1st layer.
    #> Caused by error in `FUN()`:
    #> ! object 'avg_mode' not found

<br>

## Code of Conduct

Please note that the `costoffice` project is released with a
[Contributor Code of
Conduct](https://andrewallenbruce.github.io/costoffice/CODE_OF_CONDUCT.html).
By contributing to this project, you agree to abide by its terms.
