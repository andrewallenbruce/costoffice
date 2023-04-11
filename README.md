
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

## Motivation

The `costoffice` package contains functions enabling the user to access
the latest **Physician Office Visit Costs** datasets from
[Data.CMS.gov](https://data.cms.gov/provider-data/search?page-size=50&theme=Physician%20office%20visit%20costs).

There are 83 datasets in total, each representing a different medical
specialty. Each one contains the:

- Most Utilized Procedure Code (HCPCS Level II aka CPT code)
- Price Medicare Paid (Minimum-Maximum-Mode)
- Copay the Patient Paid (Minimum-Maximum-Mode)

by zip code, for new and established patients both.

<br>

## `search_datasets()`

Returns a data frame of each dataset’s medical specialty, date of most
recent release, and a download link for it’s corresponding csv file:

<br>

``` r
# Call with no arguments to return the entire data frame
search_datasets()
```

    #> # A tibble: 83 × 3
    #>    specialty                                        released   csv_url          
    #>    <chr>                                            <date>     <chr>            
    #>  1 addiction_medicine                               2022-07-14 https://data.cms…
    #>  2 advanced_heart_failure_and_transplant_cardiology 2022-07-14 https://data.cms…
    #>  3 allergy_immunology                               2022-07-14 https://data.cms…
    #>  4 anesthesiology                                   2022-07-14 https://data.cms…
    #>  5 cardiac_surgery                                  2022-07-14 https://data.cms…
    #>  6 cardiology                                       2022-07-14 https://data.cms…
    #>  7 certified_clinical_nurse_specialist              2022-07-14 https://data.cms…
    #>  8 certified_nurse_midwife                          2022-07-14 https://data.cms…
    #>  9 certified_registered_nurse_anesthetist_crna      2022-07-14 https://data.cms…
    #> 10 clinic_or_group_practice                         2022-07-14 https://data.cms…
    #> # ℹ 73 more rows

<br>

If needed, there are two arguments to this function. Use the `specialty`
argument to return only *exact* matches (note the underscore in the
names):

``` r
search_datasets(specialty = "emergency_medicine")
```

    #> # A tibble: 1 × 3
    #>   specialty          released   csv_url                                         
    #>   <chr>              <date>     <chr>                                           
    #> 1 emergency_medicine 2022-07-14 https://data.cms.gov/provider-data/sites/defaul…

<br>

Use the `keyword` argument to return *partial* matches:

``` r
search_datasets(keyword = "medicine")
```

    #> # A tibble: 12 × 3
    #>    specialty                            released   csv_url                      
    #>    <chr>                                <date>     <chr>                        
    #>  1 addiction_medicine                   2022-07-14 https://data.cms.gov/provide…
    #>  2 emergency_medicine                   2022-07-14 https://data.cms.gov/provide…
    #>  3 geriatric_medicine                   2022-07-14 https://data.cms.gov/provide…
    #>  4 internal_medicine                    2022-07-14 https://data.cms.gov/provide…
    #>  5 nuclear_medicine                     2022-07-14 https://data.cms.gov/provide…
    #>  6 osteopathic_manipulative_medicine    2022-07-14 https://data.cms.gov/provide…
    #>  7 pediatric_medicine                   2022-07-14 https://data.cms.gov/provide…
    #>  8 physical_medicine_and_rehabilitation 2022-07-14 https://data.cms.gov/provide…
    #>  9 preventive_medicine                  2022-07-14 https://data.cms.gov/provide…
    #> 10 sleep_medicine                       2022-07-14 https://data.cms.gov/provide…
    #> 11 sports_medicine                      2022-07-14 https://data.cms.gov/provide…
    #> 12 undersea_and_hyperbaric_medicine     2022-07-14 https://data.cms.gov/provide…

<br>

> Return a vector of the exact names of the medical specialties by
> simply calling `search_datasets()$specialty`.

<br>

<details closed>
<summary>
<span title="Click to Expand"> Available Medical Specialties </span>
</summary>

``` r

addiction_medicine
advanced_heart_failure_and_transplant_cardiology
allergy_immunology
anesthesiology
cardiac_surgery
cardiology
certified_clinical_nurse_specialist
certified_nurse_midwife
certified_registered_nurse_anesthetist_crna
clinic_or_group_practice
clinical_cardiac_electrophysiology
clinical_laboratory
colorectal_surgery_proctology
critical_care_intensivists
dentist
dermatology
diagnostic_radiology
emergency_medicine
endocrinology
family_practice
gastroenterology
general_practice
general_surgery
geriatric_medicine
geriatric_psychiatry
gynecological_oncology
hand_surgery
hematology
hematology_oncology
hematopoietic_cell_transplantation_and_cellular_therapy
hospice_and_palliative_care
hospitalist
infectious_disease
internal_medicine
interventional_cardiology
interventional_pain_management
interventional_radiology
licensed_clinical_social_worker
mammography_center
maxillofacial_surgery
medical_genetics_and_genomics
medical_oncology
medical_toxicology
nephrology
neurology
neuropsychiatry
neurosurgery
nuclear_medicine
nurse_practitioner
obstetrics_gynecology
ophthalmology
optometry
oral_surgery_dentist_only
orthopedic_surgery
osteopathic_manipulative_medicine
otolaryngology
pain_management
pathology
pediatric_medicine
peripheral_vascular_disease
physical_medicine_and_rehabilitation
physical_therapist_in_private_practice
physician_assistant
plastic_and_reconstructive_surgery
podiatry
preventive_medicine
psychiatry
psychologist_clinical
public_health_or_welfare_agency
pulmonary_disease
radiation_oncology
registered_dietitian_or_nutrition_professional
rheumatology
sleep_medicine
speech_language_pathologist
sports_medicine
surgical_oncology
thoracic_surgery
undefined_physician_type
undersea_and_hyperbaric_medicine
unknown_supplierprovider_specialty
urology
vascular_surgery
```

</details>

<br>

<br>

## `download_dataset()`

``` r
search_datasets(specialty = "vascular_surgery") |> 
  download_dataset() |> 
  dplyr::group_by(region, patient, cost) |> 
  dplyr::summarise(min = mean(min, na.rm = TRUE),
                   max = mean(max, na.rm = TRUE),
                   mode = mean(mode, na.rm = TRUE),
                   range = mean(range, na.rm = TRUE),
                   .groups = "drop") |> 
  dplyr::arrange(patient, cost)
```

    #> # A tibble: 20 × 7
    #>    region    patient cost    min   max  mode range
    #>    <fct>     <chr>   <chr> <dbl> <dbl> <dbl> <dbl>
    #>  1 Northeast est     copay  4.75  37.6  19.0  32.8
    #>  2 Midwest   est     copay  4.36  35.2  17.7  30.8
    #>  3 South     est     copay  4.39  35.5  17.9  31.2
    #>  4 West      est     copay  4.79  37.7  19.1  32.9
    #>  5 <NA>      est     copay  4.65  36.8  18.6  32.2
    #>  6 Northeast est     price 19.0  150.   76.0 131. 
    #>  7 Midwest   est     price 17.4  141.   70.8 123. 
    #>  8 South     est     price 17.6  142.   71.6 125. 
    #>  9 West      est     price 19.2  151.   76.2 132. 
    #> 10 <NA>      est     price 18.6  147.   74.4 129. 
    #> 11 Northeast new     copay 15.2   46.0  23.4  30.8
    #> 12 Midwest   new     copay 14.1   43.0  21.7  28.9
    #> 13 South     new     copay 14.3   43.6  22.0  29.3
    #> 14 West      new     copay 15.2   46.1  23.4  30.8
    #> 15 <NA>      new     copay 14.9   45.1  22.9  30.2
    #> 16 Northeast new     price 60.8  184.   93.5 123. 
    #> 17 Midwest   new     price 56.4  172.   86.9 116. 
    #> 18 South     new     price 57.0  174.   88.0 117. 
    #> 19 West      new     price 61.0  184.   93.6 123. 
    #> 20 <NA>      new     price 59.6  180.   91.5 121.

<br>

## TODO: Add Missing ZIP Codes

``` r
search_datasets(specialty = "addiction_medicine") |> 
  download_dataset() |> 
  dplyr::filter(is.na(state)) |> 
  dplyr::select(zip_code)
```

    #> # A tidytable: 492 × 1
    #>    zip_code
    #>    <chr>   
    #>  1 00303   
    #>  2 00303   
    #>  3 00304   
    #>  4 00304   
    #>  5 00323   
    #>  6 00323   
    #>  7 00353   
    #>  8 00353   
    #>  9 00905   
    #> 10 00905   
    #> # ℹ 482 more rows

<br>

## Create database with `duckdb`

``` r
# https://r4ds.hadley.nz/iteration.html#sec-save-database
template <- search_datasets(specialty = "addiction_medicine") |> 
  download_dataset() |> 
  head()

con <- DBI::dbConnect(duckdb::duckdb(), "D:/duckdb/costoffice.duckdb")

DBI::dbCreateTable(con, "costoffice", template)

con |> dplyr::tbl("costoffice")
```

    #> # Source:   table<costoffice> [0 x 14]
    #> # Database: DuckDB 0.7.1 [andyb@Windows 10 x64:R 4.2.2/D:/duckdb/costoffice.duckdb]
    #> # ℹ 14 variables: specialty <chr>, zip_code <chr>, city <chr>, county <chr>,
    #> #   state <chr>, region <chr>, division <chr>, hcpcs <chr>, patient <chr>,
    #> #   cost <chr>, min <dbl>, max <dbl>, mode <dbl>, range <dbl>

<br>

``` r
# Size on disk:
fs::dir_info("D:/duckdb/") |> 
  dplyr::select(path, size) |> 
  dplyr::summarise(sum(size)) |> 
  tibble::deframe()
```

    #> 12.6K

<br>

``` r
cert <- search_datasets(keyword = "certified")[1, ] |> 
  download_dataset()

DBI::dbAppendTable(con, "costoffice", cert)

con |> dplyr::tbl("costoffice")
```

    #> # Source:   table<costoffice> [?? x 14]
    #> # Database: DuckDB 0.7.1 [andyb@Windows 10 x64:R 4.2.2/D:/duckdb/costoffice.duckdb]
    #>    specialty     zip_code city  county state region division hcpcs patient cost 
    #>    <chr>         <chr>    <chr> <chr>  <chr> <chr>  <chr>    <chr> <chr>   <chr>
    #>  1 certified_cl… 00210    Port… <NA>   NH    North… New Eng… 99204 new     copay
    #>  2 certified_cl… 00210    Port… <NA>   NH    North… New Eng… 99204 new     price
    #>  3 certified_cl… 00211    Port… <NA>   NH    North… New Eng… 99204 new     copay
    #>  4 certified_cl… 00211    Port… <NA>   NH    North… New Eng… 99204 new     price
    #>  5 certified_cl… 00212    Port… <NA>   NH    North… New Eng… 99204 new     copay
    #>  6 certified_cl… 00212    Port… <NA>   NH    North… New Eng… 99204 new     price
    #>  7 certified_cl… 00213    Port… <NA>   NH    North… New Eng… 99204 new     copay
    #>  8 certified_cl… 00213    Port… <NA>   NH    North… New Eng… 99204 new     price
    #>  9 certified_cl… 00214    Port… <NA>   NH    North… New Eng… 99204 new     copay
    #> 10 certified_cl… 00214    Port… <NA>   NH    North… New Eng… 99204 new     price
    #> # ℹ more rows
    #> # ℹ 4 more variables: min <dbl>, max <dbl>, mode <dbl>, range <dbl>

<br>

``` r
# Size on disk:
fs::dir_info("D:/duckdb/") |> 
  dplyr::select(path, size) |> 
  dplyr::summarise(sum(size)) |> 
  tibble::deframe()
```

    #> 5.76M

<br>

``` r
cert2 <- search_datasets(keyword = "certified")[2, ] |> 
  download_dataset()

DBI::dbAppendTable(con, "costoffice", cert2)

con |> dplyr::tbl("costoffice")
```

    #> # Source:   table<costoffice> [?? x 14]
    #> # Database: DuckDB 0.7.1 [andyb@Windows 10 x64:R 4.2.2/D:/duckdb/costoffice.duckdb]
    #>    specialty     zip_code city  county state region division hcpcs patient cost 
    #>    <chr>         <chr>    <chr> <chr>  <chr> <chr>  <chr>    <chr> <chr>   <chr>
    #>  1 certified_cl… 00210    Port… <NA>   NH    North… New Eng… 99204 new     copay
    #>  2 certified_cl… 00210    Port… <NA>   NH    North… New Eng… 99204 new     price
    #>  3 certified_cl… 00211    Port… <NA>   NH    North… New Eng… 99204 new     copay
    #>  4 certified_cl… 00211    Port… <NA>   NH    North… New Eng… 99204 new     price
    #>  5 certified_cl… 00212    Port… <NA>   NH    North… New Eng… 99204 new     copay
    #>  6 certified_cl… 00212    Port… <NA>   NH    North… New Eng… 99204 new     price
    #>  7 certified_cl… 00213    Port… <NA>   NH    North… New Eng… 99204 new     copay
    #>  8 certified_cl… 00213    Port… <NA>   NH    North… New Eng… 99204 new     price
    #>  9 certified_cl… 00214    Port… <NA>   NH    North… New Eng… 99204 new     copay
    #> 10 certified_cl… 00214    Port… <NA>   NH    North… New Eng… 99204 new     price
    #> # ℹ more rows
    #> # ℹ 4 more variables: min <dbl>, max <dbl>, mode <dbl>, range <dbl>

<br>

``` r
# Size on disk:
fs::dir_info("D:/duckdb/") |> 
  dplyr::select(path, size) |> 
  dplyr::summarise(sum(size)) |> 
  tibble::deframe()
```

    #> 11.3M

<br>

``` r
duckdb::dbDisconnect(con, shutdown = TRUE)
```

## Code of Conduct

Please note that the `costoffice` project is released with a
[Contributor Code of
Conduct](https://andrewallenbruce.github.io/costoffice/CODE_OF_CONDUCT.html).
By contributing to this project, you agree to abide by its terms.
