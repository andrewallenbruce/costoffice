
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

<br>

## Motivation

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

<details closed>
<summary>
<span title="Click to Expand"> Available Medical Specialties </span>
</summary>

``` r

addiction medicine
advanced heart failure and transplant cardiology
allergy/ immunology
anesthesiology
cardiac surgery
cardiology
certified clinical nurse specialist
certified nurse midwife
certified registered nurse anesthetist (crna)
clinic or group practice
clinical cardiac electrophysiology
clinical laboratory
colorectal surgery (proctology)
critical care (intensivists)
dentist
dermatology
diagnostic radiology
emergency medicine
endocrinology
family practice
gastroenterology
general practice
general surgery
geriatric medicine
geriatric psychiatry
gynecological oncology
hand surgery
hematology
hematology-oncology
hematopoietic cell transplantation and cellular therapy
hospice and palliative care
hospitalist
infectious disease
internal medicine
interventional cardiology
interventional pain management
interventional radiology
licensed clinical social worker
mammography center
maxillofacial surgery
medical genetics and genomics
medical oncology
medical toxicology
nephrology
neurology
neuropsychiatry
neurosurgery
nuclear medicine
nurse practitioner
obstetrics &amp; gynecology
ophthalmology
optometry
oral surgery (dentist only)
orthopedic surgery
osteopathic manipulative medicine
otolaryngology
pain management
pathology
pediatric medicine
peripheral vascular disease
physical medicine and rehabilitation
physical therapist in private practice
physician assistant
plastic and reconstructive surgery
podiatry
preventive medicine
psychiatry
psychologist, clinical
public health or welfare agency
pulmonary disease
radiation oncology
registered dietitian or nutrition professional
rheumatology
sleep medicine
speech language pathologist
sports medicine
surgical oncology
thoracic surgery
undefined physician type
undersea and hyperbaric medicine
unknown supplier/provider specialty
urology
vascular surgery
```

</details>

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
the `download_dataset()` function into your pipeline to download the csv
file, which is returned as a `tidytable`:

``` r
search_datasets(specialty = "vascular surgery") |> 
  download_dataset() |> 
  head(n = 10)
```

    #> Error in data.table::fread(...): File 'https://data.cms.gov/provider-data/sites/default/files/resources/9cc7e57be541ff848728f69c9226e31f_1657569984/Vascular_Surgery.csv' does not exist or is non-readable. getwd()=='C:/Users/andyb/Desktop/costoffice'

<br>

## `use_zipcoder()`

`costoffice` includes a subset of zip code-related data from Gavin
Rozzi’s amazing `zipcodeR` package. Piping the downloaded dataset into
the `use_zipcoder()` function adds this information to the data frame.

``` r
search_datasets(specialty = "vascular surgery") |> 
  download_dataset() |> 
  tidytable::slice_sample(n = 10) |> 
  use_zipcoder(full = TRUE)
```

    #> Error in data.table::fread(...): File 'https://data.cms.gov/provider-data/sites/default/files/resources/9cc7e57be541ff848728f69c9226e31f_1657569984/Vascular_Surgery.csv' does not exist or is non-readable. getwd()=='C:/Users/andyb/Desktop/costoffice'

<br>

## `download_datasets()`

The `download_datasets()` function wraps the previous three functions
into a one-stop shop of sorts. Arguments from all three base functions
are accessible as well.

``` r
(x <- download_datasets(specialty = "vascular surgery") |> head())
```

    #> Error in `purrr::map()`:
    #> ℹ In index: 1.
    #> ℹ With name: Vascular_Surgery.csv.
    #> Caused by error:
    #> ! argument "x" is missing, with no default

<br>

``` r
(y <- download_datasets(keyword = "anesthesiology") |> head())
```

    #> Error in `purrr::map()`:
    #> ℹ In index: 1.
    #> ℹ With name: Anesthesiology.csv.
    #> Caused by error:
    #> ! argument "x" is missing, with no default

<br>

## `summary_stats()`

`summary_stats()` is a versatile summary function, tailored for the data
this package accesses.

Current average prices by state for a **New Patient** office visit to a
**Vascular Surgeon**:

``` r
(vasc <- download_datasets(specialty = "vascular surgery") |> 
  summary_stats(condition = patient == "new",
                group_vars = c(specialty, state, hcpcs, cost),
                summary_vars = c(min, max, mode, range),
                arr = cost))
```

    #> Error in `purrr::map()`:
    #> ℹ In index: 1.
    #> ℹ With name: Vascular_Surgery.csv.
    #> Caused by error:
    #> ! argument "x" is missing, with no default

<br>

Average prices by state for an **Established Patient** office visit to a
**Cardiologist**:

``` r
download_datasets(specialty = "cardiology", full = TRUE) |> 
  tidytable::select(!c(geo, is_zcta, zcta_crosswalk)) |> 
  tidytable::unnest(demo) |> 
  tidytable::group_by(state, zip_code) |> 
  tidytable::summarise(n = tidytable::n.(),
                       pop = sum(pop, na.rm = TRUE))
```

    #> Error in `purrr::map()`:
    #> ℹ In index: 1.
    #> ℹ With name: Cardiology.csv.
    #> Caused by error:
    #> ! argument "x" is missing, with no default

``` r
costoffice::zip_db |> 
  tidytable::unnest(demo) |> 
  tidytable::group_by(state) |> 
  tidytable::summarise(no_zips = tidytable::n.(),
                       pop_sum = sum(pop, na.rm = TRUE),
                       mean_pop_dens = mean(pop_density, na.rm = TRUE),
                       med_income = median(med_income, na.rm = TRUE))
```

    #> # A tidytable: 52 × 5
    #>    state no_zips  pop_sum mean_pop_dens med_income
    #>    <chr>   <int>    <int>         <dbl>      <dbl>
    #>  1 AK        274   709930          229.      48036
    #>  2 AL        839  4779588          360.      38493
    #>  3 AR        710  2916042          209.      36104
    #>  4 AZ        568  6394519         1169.      42734
    #>  5 CA       2654 37249542         3273.      56528
    #>  6 CO        662  5029374          989.      51937
    #>  7 CT        438  3574097         1627.      78122
    #>  8 DC        296   601723        20318.      76948
    #>  9 DE         98   897925         1780.      57292
    #> 10 FL       1495 18801226         1955.      45593
    #> # ℹ 42 more rows

``` r
(cardio <- download_datasets(specialty = "cardiology") |> 
  summary_stats(condition = patient == "est",
                group_vars = c(specialty, state, hcpcs, cost),
                summary_vars = c(min, max, mode, range),
                arr = cost))
```

    #> Error in `purrr::map()`:
    #> ℹ In index: 1.
    #> ℹ With name: Cardiology.csv.
    #> Caused by error:
    #> ! argument "x" is missing, with no default

<br>

## Plots

``` r
ggplot2::ggplot(vasc |> tidytable::filter(cost == "price"), 
  ggplot2::aes(forcats::fct_reorder(state, mean_mode, median), mean_mode)) +
  ggplot2::geom_point() +
  ggplot2::coord_flip() +
  ggplot2::scale_y_continuous(labels = scales::label_dollar()) +
  ggplot2::labs(x = "", y = "",
           title = "Established Patient Office Visit Costs: Vascular Surgery")
```

    #> Error in is.data.frame(.df): object 'vasc' not found

<br>

``` r
ggplot2::ggplot(data = vasc, ggplot2::aes(x = reorder(state, mean_mode), y = mean_mode)) +
  ggplot2::geom_linerange(ggplot2::aes(ymin = mean_min, ymax = mean_max), 
                          color = "#f3d478", linewidth = 4.5, alpha = 0.8) +
  ggplot2::geom_point(fill = "#ed3324", color = "white", size = 2, shape = 21) +
  ggplot2::coord_flip() +
  ggplot2::scale_y_continuous(labels = scales::label_dollar()) +
  ggplot2::labs(x = "", y = "",
           title = "Established Patient Office Visit Costs: Vascular Surgery")
```

    #> Error in ggplot2::ggplot(data = vasc, ggplot2::aes(x = reorder(state, : object 'vasc' not found

<br>

## Code of Conduct

Please note that the `costoffice` project is released with a
[Contributor Code of
Conduct](https://andrewallenbruce.github.io/costoffice/CODE_OF_CONDUCT.html).
By contributing to this project, you agree to abide by its terms.
