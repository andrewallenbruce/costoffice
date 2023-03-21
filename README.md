
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
search_datasets() |> knitr::kable()
```

| specialty                                               | issued     | modified   | released   | csv_url                                                                                                                                                                    |
|:--------------------------------------------------------|:-----------|:-----------|:-----------|:---------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| addiction medicine                                      | 2022-07-11 | 2022-07-11 | 2022-07-14 | <https://data.cms.gov/provider-data/sites/default/files/resources/cc28605bc749af6ac14a045571988c26_1657569936/Addiction_Medicine.csv>                                      |
| advanced heart failure and transplant cardiology        | 2022-07-11 | 2022-07-11 | 2022-07-14 | <https://data.cms.gov/provider-data/sites/default/files/resources/e2eedfbf43da2776998b9952e00cfe40_1657569937/Advanced_Heart_Failure_and_Transplant_Cardiology.csv>        |
| allergy/ immunology                                     | 2022-07-11 | 2022-07-11 | 2022-07-14 | <https://data.cms.gov/provider-data/sites/default/files/resources/958e996af3c22f1380161b6868c6656a_1657569938/Allergy_Immunology.csv>                                      |
| anesthesiology                                          | 2022-07-11 | 2022-07-11 | 2022-07-14 | <https://data.cms.gov/provider-data/sites/default/files/resources/0e643700acc41298d9c7dce07f4eea48_1657569938/Anesthesiology.csv>                                          |
| cardiac surgery                                         | 2022-07-11 | 2022-07-11 | 2022-07-14 | <https://data.cms.gov/provider-data/sites/default/files/resources/4e5504c35e85cc460f1ce47c041ad64b_1657569939/Cardiac_Surgery.csv>                                         |
| cardiology                                              | 2022-07-11 | 2022-07-11 | 2022-07-14 | <https://data.cms.gov/provider-data/sites/default/files/resources/22a5a5f11e55c744b3d153c01e947334_1657569939/Cardiology.csv>                                              |
| certified clinical nurse specialist                     | 2022-07-11 | 2022-07-11 | 2022-07-14 | <https://data.cms.gov/provider-data/sites/default/files/resources/e1c6d251c902660ac28dd9dbc225d3bb_1657569940/Certified_Clinical_Nurse_Specialist.csv>                     |
| certified nurse midwife                                 | 2022-07-11 | 2022-07-11 | 2022-07-14 | <https://data.cms.gov/provider-data/sites/default/files/resources/adaff4b93fdb48b189a84f84dec41d4a_1657569941/Certified_Nurse_Midwife.csv>                                 |
| certified registered nurse anesthetist (crna)           | 2022-07-11 | 2022-07-11 | 2022-07-14 | <https://data.cms.gov/provider-data/sites/default/files/resources/38d6db10e07c7275049ce31b026dfdf9_1657569941/Certified_Registered_Nurse_Anesthetist_CRNA.csv>             |
| clinic or group practice                                | 2022-07-11 | 2022-07-11 | 2022-07-14 | <https://data.cms.gov/provider-data/sites/default/files/resources/3a4b7f471f73d8291e1224271cc3a71f_1657569942/Clinic_or_Group_Practice.csv>                                |
| clinical cardiac electrophysiology                      | 2022-07-11 | 2022-07-11 | 2022-07-14 | <https://data.cms.gov/provider-data/sites/default/files/resources/f86502a77201bc616ca3a9cb7be93d55_1657569942/Clinical_Cardiac_Electrophysiology.csv>                      |
| clinical laboratory                                     | 2022-07-11 | 2022-07-11 | 2022-07-14 | <https://data.cms.gov/provider-data/sites/default/files/resources/7aa98344abafdfc2c6b75fbc6d67d781_1657569943/Clinical_Laboratory.csv>                                     |
| colorectal surgery (proctology)                         | 2022-07-11 | 2022-07-11 | 2022-07-14 | <https://data.cms.gov/provider-data/sites/default/files/resources/9988d7714b0270daa1ee32b7af606512_1657569944/Colorectal_Surgery_Proctology.csv>                           |
| critical care (intensivists)                            | 2022-07-11 | 2022-07-11 | 2022-07-14 | <https://data.cms.gov/provider-data/sites/default/files/resources/f2f11f1f09c109ae7365cf37fb147520_1657569944/Critical_Care_Intensivists.csv>                              |
| dentist                                                 | 2022-07-11 | 2022-07-11 | 2022-07-14 | <https://data.cms.gov/provider-data/sites/default/files/resources/1f898f1bdef28c3d11c8a412fce8781d_1657569945/Dentist.csv>                                                 |
| dermatology                                             | 2022-07-11 | 2022-07-11 | 2022-07-14 | <https://data.cms.gov/provider-data/sites/default/files/resources/fea257652a684e8900533f30ec7f7c97_1657569945/Dermatology.csv>                                             |
| diagnostic radiology                                    | 2022-07-11 | 2022-07-11 | 2022-07-14 | <https://data.cms.gov/provider-data/sites/default/files/resources/8319db368f77babdaa171a035dd3013f_1657569946/Diagnostic_Radiology.csv>                                    |
| emergency medicine                                      | 2022-07-11 | 2022-07-11 | 2022-07-14 | <https://data.cms.gov/provider-data/sites/default/files/resources/2ecf5bc219ab4dc6f1d8b479e3f8dfa6_1657569946/Emergency_Medicine.csv>                                      |
| endocrinology                                           | 2022-07-11 | 2022-07-11 | 2022-07-14 | <https://data.cms.gov/provider-data/sites/default/files/resources/03c6b6d201e42fd683bcc38429d9908d_1657569947/Endocrinology.csv>                                           |
| family practice                                         | 2022-07-11 | 2022-07-11 | 2022-07-14 | <https://data.cms.gov/provider-data/sites/default/files/resources/91ae7d117c11835deed4941798cdb067_1657569948/Family_Practice.csv>                                         |
| gastroenterology                                        | 2022-07-11 | 2022-07-11 | 2022-07-14 | <https://data.cms.gov/provider-data/sites/default/files/resources/95ca7fa4819c84641900dca2df1f3142_1657569948/Gastroenterology.csv>                                        |
| general practice                                        | 2022-07-11 | 2022-07-11 | 2022-07-14 | <https://data.cms.gov/provider-data/sites/default/files/resources/b41b7d122394f3fc3f410d415e54e17c_1657569949/General_Practice.csv>                                        |
| general surgery                                         | 2022-07-11 | 2022-07-11 | 2022-07-14 | <https://data.cms.gov/provider-data/sites/default/files/resources/590178d88c114a423b3d48fa28bd9509_1657569949/General_Surgery.csv>                                         |
| geriatric medicine                                      | 2022-07-11 | 2022-07-11 | 2022-07-14 | <https://data.cms.gov/provider-data/sites/default/files/resources/e84744ef3134eb535a803d0b20a0cdb8_1657569950/Geriatric_Medicine.csv>                                      |
| geriatric psychiatry                                    | 2022-07-11 | 2022-07-11 | 2022-07-14 | <https://data.cms.gov/provider-data/sites/default/files/resources/3cded062d3c7f2b1f8adc170fffec377_1657569951/Geriatric_Psychiatry.csv>                                    |
| gynecological oncology                                  | 2022-07-11 | 2022-07-11 | 2022-07-14 | <https://data.cms.gov/provider-data/sites/default/files/resources/a957bd3242a68cd7e672e485b66cbd91_1657569951/Gynecological_Oncology.csv>                                  |
| hand surgery                                            | 2022-07-11 | 2022-07-11 | 2022-07-14 | <https://data.cms.gov/provider-data/sites/default/files/resources/d121bff4e958eac7fe32c86c54773fe7_1657569952/Hand_Surgery.csv>                                            |
| hematology                                              | 2022-07-11 | 2022-07-11 | 2022-07-14 | <https://data.cms.gov/provider-data/sites/default/files/resources/e07d2c0b3cde592f1f9066894e551edc_1657569952/Hematology.csv>                                              |
| hematology-oncology                                     | 2022-07-11 | 2022-07-11 | 2022-07-14 | <https://data.cms.gov/provider-data/sites/default/files/resources/a406cc6e7aefecbdd42c1e4bf205fcaf_1657569953/Hematology_Oncology.csv>                                     |
| hematopoietic cell transplantation and cellular therapy | 2022-07-11 | 2022-07-11 | 2022-07-14 | <https://data.cms.gov/provider-data/sites/default/files/resources/fcae5652a2c23a1f3d345f54aaabbc09_1657569953/Hematopoietic_Cell_Transplantation_and_Cellular_Therapy.csv> |
| hospice and palliative care                             | 2022-07-11 | 2022-07-11 | 2022-07-14 | <https://data.cms.gov/provider-data/sites/default/files/resources/c649b9b13ca3527cfffafd8f2edb4451_1657569954/Hospice_and_Palliative_Care.csv>                             |
| hospitalist                                             | 2022-07-11 | 2022-07-11 | 2022-07-14 | <https://data.cms.gov/provider-data/sites/default/files/resources/00ac1a129abe627e7e5dfbdd9ae4fbc6_1657569955/Hospitalist.csv>                                             |
| infectious disease                                      | 2022-07-11 | 2022-07-11 | 2022-07-14 | <https://data.cms.gov/provider-data/sites/default/files/resources/ecf51ec1ccb922352bbc2dd7e7f06c4b_1657569955/Infectious_Disease.csv>                                      |
| internal medicine                                       | 2022-07-11 | 2022-07-11 | 2022-07-14 | <https://data.cms.gov/provider-data/sites/default/files/resources/2f56fabf52fc4b0acef300c3952e6c50_1657569956/Internal_Medicine.csv>                                       |
| interventional cardiology                               | 2022-07-11 | 2022-07-11 | 2022-07-14 | <https://data.cms.gov/provider-data/sites/default/files/resources/cdd51b6251422caa159f9028a3c6f096_1657569956/Interventional_Cardiology.csv>                               |
| interventional pain management                          | 2022-07-11 | 2022-07-11 | 2022-07-14 | <https://data.cms.gov/provider-data/sites/default/files/resources/82277b91a8022587e74009388db8b586_1657569957/Interventional_Pain_Management.csv>                          |
| interventional radiology                                | 2022-07-11 | 2022-07-11 | 2022-07-14 | <https://data.cms.gov/provider-data/sites/default/files/resources/606903f27fc8bd54332e7c9c27b6abf5_1657569958/Interventional_Radiology.csv>                                |
| licensed clinical social worker                         | 2022-07-11 | 2022-07-11 | 2022-07-14 | <https://data.cms.gov/provider-data/sites/default/files/resources/56fde9d1e8d16b4750ceae0233436e1b_1657569958/Licensed_Clinical_Social_Worker.csv>                         |
| mammography center                                      | 2022-07-11 | 2022-07-11 | 2022-07-14 | <https://data.cms.gov/provider-data/sites/default/files/resources/1053fe8f1f8a573e1fa13f1d7a47cdb7_1657569958/Mammography_Center.csv>                                      |
| maxillofacial surgery                                   | 2022-07-11 | 2022-07-11 | 2022-07-14 | <https://data.cms.gov/provider-data/sites/default/files/resources/29d3508a2200a4ef2e61c3500074c98e_1657569959/Maxillofacial_Surgery.csv>                                   |
| medical genetics and genomics                           | 2022-07-11 | 2022-07-11 | 2022-07-14 | <https://data.cms.gov/provider-data/sites/default/files/resources/a6a6f31bbea0f525457535ed428732c2_1657569959/Medical_Genetics_and_Genomics.csv>                           |
| medical oncology                                        | 2022-07-11 | 2022-07-11 | 2022-07-14 | <https://data.cms.gov/provider-data/sites/default/files/resources/dfd7d7b53fcd2217720217565150df7c_1657569960/Medical_Oncology.csv>                                        |
| medical toxicology                                      | 2022-07-11 | 2022-07-11 | 2022-07-14 | <https://data.cms.gov/provider-data/sites/default/files/resources/7e1a53c956e1e857423a0596e7982def_1657569960/Medical_Toxicology.csv>                                      |
| nephrology                                              | 2022-07-11 | 2022-07-11 | 2022-07-14 | <https://data.cms.gov/provider-data/sites/default/files/resources/cc2e449ab5a965b55f6b0d35fba809c1_1657569961/Nephrology.csv>                                              |
| neurology                                               | 2022-07-11 | 2022-07-11 | 2022-07-14 | <https://data.cms.gov/provider-data/sites/default/files/resources/5260bbc280b8720f02abb5a84924922b_1657569962/Neurology.csv>                                               |
| neuropsychiatry                                         | 2022-07-11 | 2022-07-11 | 2022-07-14 | <https://data.cms.gov/provider-data/sites/default/files/resources/5043bc93ee904a676cc9d79f9e723e42_1657569962/Neuropsychiatry.csv>                                         |
| neurosurgery                                            | 2022-07-11 | 2022-07-11 | 2022-07-14 | <https://data.cms.gov/provider-data/sites/default/files/resources/b5ab0e9de0abce52871cb7391effecd5_1657569963/Neurosurgery.csv>                                            |
| nuclear medicine                                        | 2022-07-11 | 2022-07-11 | 2022-07-14 | <https://data.cms.gov/provider-data/sites/default/files/resources/6251154e9017c99a319ca7419fa4b11e_1657569963/Nuclear_Medicine.csv>                                        |
| nurse practitioner                                      | 2022-07-11 | 2022-07-11 | 2022-07-14 | <https://data.cms.gov/provider-data/sites/default/files/resources/331b2848de873f759b8c531c1cf42a10_1657569964/Nurse_Practitioner.csv>                                      |
| obstetrics & gynecology                                 | 2022-07-11 | 2022-07-11 | 2022-07-14 | <https://data.cms.gov/provider-data/sites/default/files/resources/9a6a7870414d97424ae6de723419d99a_1657569964/Obstetrics_Gynecology.csv>                                   |
| ophthalmology                                           | 2022-07-11 | 2022-07-11 | 2022-07-14 | <https://data.cms.gov/provider-data/sites/default/files/resources/83eed7b7d605c2c56952889e54e24566_1657569965/Ophthalmology.csv>                                           |
| optometry                                               | 2022-07-11 | 2022-07-11 | 2022-07-14 | <https://data.cms.gov/provider-data/sites/default/files/resources/e6e733ba587f18f753bbe6760218c6a0_1657569966/Optometry.csv>                                               |
| oral surgery (dentist only)                             | 2022-07-11 | 2022-07-11 | 2022-07-14 | <https://data.cms.gov/provider-data/sites/default/files/resources/6982f0351ba1b0cfb728539213715e29_1657569966/Oral_Surgery_Dentist_only.csv>                               |
| orthopedic surgery                                      | 2022-07-11 | 2022-07-11 | 2022-07-14 | <https://data.cms.gov/provider-data/sites/default/files/resources/4bc1023d314de26ebc83877b6c549a11_1657569967/Orthopedic_Surgery.csv>                                      |
| osteopathic manipulative medicine                       | 2022-07-11 | 2022-07-11 | 2022-07-14 | <https://data.cms.gov/provider-data/sites/default/files/resources/db22a34f680f32b7177f804dace389f2_1657569967/Osteopathic_Manipulative_Medicine.csv>                       |
| otolaryngology                                          | 2022-07-11 | 2022-07-11 | 2022-07-14 | <https://data.cms.gov/provider-data/sites/default/files/resources/e34bacff53ba14b5e31f9a5b5867037c_1657569968/Otolaryngology.csv>                                          |
| pain management                                         | 2022-07-11 | 2022-07-11 | 2022-07-14 | <https://data.cms.gov/provider-data/sites/default/files/resources/aca0893699b644a5a49152653f515198_1657569968/Pain_Management.csv>                                         |
| pathology                                               | 2022-07-11 | 2022-07-11 | 2022-07-14 | <https://data.cms.gov/provider-data/sites/default/files/resources/d27411657d5f0b42b86e9c8260f9d245_1657569969/Pathology.csv>                                               |
| pediatric medicine                                      | 2022-07-11 | 2022-07-11 | 2022-07-14 | <https://data.cms.gov/provider-data/sites/default/files/resources/bea58b342d24f8009d1c1f3a56f20a41_1657569970/Pediatric_Medicine.csv>                                      |
| peripheral vascular disease                             | 2022-07-11 | 2022-07-11 | 2022-07-14 | <https://data.cms.gov/provider-data/sites/default/files/resources/f7b2d53645cf70be635f75e23941181a_1657569970/Peripheral_Vascular_Disease.csv>                             |
| physical medicine and rehabilitation                    | 2022-07-11 | 2022-07-11 | 2022-07-14 | <https://data.cms.gov/provider-data/sites/default/files/resources/f333f807f81eb2506e4693974960b4a2_1657569971/Physical_Medicine_and_Rehabilitation.csv>                    |
| physical therapist in private practice                  | 2022-07-11 | 2022-07-11 | 2022-07-14 | <https://data.cms.gov/provider-data/sites/default/files/resources/8f82bf3fa7981ee5b426a5881ef9dcd7_1657569971/Physical_Therapist_in_Private_Practice.csv>                  |
| physician assistant                                     | 2022-07-11 | 2022-07-11 | 2022-07-14 | <https://data.cms.gov/provider-data/sites/default/files/resources/a2008c8f22ac10ef4d819f87b4b9119e_1657569972/Physician_Assistant.csv>                                     |
| plastic and reconstructive surgery                      | 2022-07-11 | 2022-07-11 | 2022-07-14 | <https://data.cms.gov/provider-data/sites/default/files/resources/63da7376c3409c68d7a715cec101a3e4_1657569973/Plastic_and_Reconstructive_Surgery.csv>                      |
| podiatry                                                | 2022-07-11 | 2022-07-11 | 2022-07-14 | <https://data.cms.gov/provider-data/sites/default/files/resources/772cbc29db4eef701abddebc9402fd33_1657569973/Podiatry.csv>                                                |
| preventive medicine                                     | 2022-07-11 | 2022-07-11 | 2022-07-14 | <https://data.cms.gov/provider-data/sites/default/files/resources/22da2fb0a2c9b64a8e84a65b9c2cb079_1657569974/Preventive_Medicine.csv>                                     |
| psychiatry                                              | 2022-07-11 | 2022-07-11 | 2022-07-14 | <https://data.cms.gov/provider-data/sites/default/files/resources/fc2d959e5f37a15379a86cfc87332296_1657569974/Psychiatry.csv>                                              |
| psychologist, clinical                                  | 2022-07-11 | 2022-07-11 | 2022-07-14 | <https://data.cms.gov/provider-data/sites/default/files/resources/3e5c7cbf897d3bb23798a215d1b5ae80_1657569975/Psychologist_Clinical.csv>                                   |
| public health or welfare agency                         | 2022-07-11 | 2022-07-11 | 2022-07-14 | <https://data.cms.gov/provider-data/sites/default/files/resources/baf7a9f2a037363fdb29396e7fdba2df_1657569975/Public_Health_or_Welfare_Agency.csv>                         |
| pulmonary disease                                       | 2022-07-11 | 2022-07-11 | 2022-07-14 | <https://data.cms.gov/provider-data/sites/default/files/resources/35b8ec590f943a8b73e779b69d4ffe00_1657569976/Pulmonary_Disease.csv>                                       |
| radiation oncology                                      | 2022-07-11 | 2022-07-11 | 2022-07-14 | <https://data.cms.gov/provider-data/sites/default/files/resources/976c48b4f76b3af8ec0f271e9802d0a9_1657569977/Radiation_Oncology.csv>                                      |
| registered dietitian or nutrition professional          | 2022-07-11 | 2022-07-11 | 2022-07-14 | <https://data.cms.gov/provider-data/sites/default/files/resources/7373d389ec7a0c58cc3fb023be23ecae_1657569977/Registered_Dietitian_or_Nutrition_Professional.csv>          |
| rheumatology                                            | 2022-07-11 | 2022-07-11 | 2022-07-14 | <https://data.cms.gov/provider-data/sites/default/files/resources/1035649d7adbc2290d783983f825a66d_1657569978/Rheumatology.csv>                                            |
| sleep medicine                                          | 2022-07-11 | 2022-07-11 | 2022-07-14 | <https://data.cms.gov/provider-data/sites/default/files/resources/68e81c2db0479c1b64aad55ec664a39e_1657569978/Sleep_Medicine.csv>                                          |
| speech language pathologist                             | 2022-07-11 | 2022-07-11 | 2022-07-14 | <https://data.cms.gov/provider-data/sites/default/files/resources/72c701b79416a3218ba6878822687ea9_1657569979/Speech_Language_Pathologist.csv>                             |
| sports medicine                                         | 2022-07-11 | 2022-07-11 | 2022-07-14 | <https://data.cms.gov/provider-data/sites/default/files/resources/1d20b29d6738c2f341af538c7c486109_1657569980/Sports_Medicine.csv>                                         |
| surgical oncology                                       | 2022-07-11 | 2022-07-11 | 2022-07-14 | <https://data.cms.gov/provider-data/sites/default/files/resources/8f1142c1f651ea78e5460c3f251e5688_1657569980/Surgical_Oncology.csv>                                       |
| thoracic surgery                                        | 2022-07-11 | 2022-07-11 | 2022-07-14 | <https://data.cms.gov/provider-data/sites/default/files/resources/5234b8d4a4d9cd77c5043d82994cec38_1657569981/Thoracic_Surgery.csv>                                        |
| undefined physician type                                | 2022-07-11 | 2022-07-11 | 2022-07-14 | <https://data.cms.gov/provider-data/sites/default/files/resources/abdbd6ae76865340d7a0789f243e37df_1657569982/Undefined_Physician_type.csv>                                |
| undersea and hyperbaric medicine                        | 2022-07-11 | 2022-07-11 | 2022-07-14 | <https://data.cms.gov/provider-data/sites/default/files/resources/476dd439e2fe4e786c271f65b245e82d_1657569982/Undersea_and_Hyperbaric_Medicine.csv>                        |
| unknown supplier/provider specialty                     | 2022-07-11 | 2022-07-11 | 2022-07-14 | <https://data.cms.gov/provider-data/sites/default/files/resources/f48326c6208867f9171a6aa4ef39b234_1657569983/Unknown_Supplier_Provider_Specialty.csv>                     |
| urology                                                 | 2022-07-11 | 2022-07-11 | 2022-07-14 | <https://data.cms.gov/provider-data/sites/default/files/resources/7832645603e72ab656ed4b24cc854487_1657569983/Urology.csv>                                                 |
| vascular surgery                                        | 2022-07-11 | 2022-07-11 | 2022-07-14 | <https://data.cms.gov/provider-data/sites/default/files/resources/9cc7e57be541ff848728f69c9226e31f_1657569984/Vascular_Surgery.csv>                                        |

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
  tidytable::slice_tail(n = 10)
```

    #> # A tidytable: 10 × 16
    #>    specialty     zip_c…¹ new_c…² new_p…³ new_p…⁴ new_p…⁵ new_c…⁶ new_c…⁷ new_c…⁸
    #>    <chr>         <chr>   <chr>     <dbl>   <dbl>   <dbl>   <dbl>   <dbl>   <dbl>
    #>  1 vascular sur… 99919   99203      74.8    234.    117.    18.7    58.4    29.2
    #>  2 vascular sur… 99921   99203      74.8    234.    117.    18.7    58.4    29.2
    #>  3 vascular sur… 99922   99203      74.8    234.    117.    18.7    58.4    29.2
    #>  4 vascular sur… 99923   99203      74.8    234.    117.    18.7    58.4    29.2
    #>  5 vascular sur… 99925   99203      74.8    234.    117.    18.7    58.4    29.2
    #>  6 vascular sur… 99926   99203      74.8    234.    117.    18.7    58.4    29.2
    #>  7 vascular sur… 99927   99203      74.8    234.    117.    18.7    58.4    29.2
    #>  8 vascular sur… 99928   99203      74.8    234.    117.    18.7    58.4    29.2
    #>  9 vascular sur… 99929   99203      74.8    234.    117.    18.7    58.4    29.2
    #> 10 vascular sur… 99950   99203      74.8    234.    117.    18.7    58.4    29.2
    #> # … with 7 more variables: est_code <chr>, est_price_min <dbl>,
    #> #   est_price_max <dbl>, est_price_mode <dbl>, est_copay_min <dbl>,
    #> #   est_copay_max <dbl>, est_copay_mode <dbl>, and abbreviated variable names
    #> #   ¹​zip_code, ²​new_code, ³​new_price_min, ⁴​new_price_max, ⁵​new_price_mode,
    #> #   ⁶​new_copay_min, ⁷​new_copay_max, ⁸​new_copay_mode

<br>

## Geocoding with `zipcodeR`

``` r
search_datasets(specialty = "vascular surgery") |> 
  download_dataset() |> 
  tidytable::slice_tail(n = 50) |> 
  use_zipcoder() |> 
  knitr::kable()
```

| city            | county                                  | state | zip_code | specialty        | new_code | new_price_min | new_price_max | new_price_mode | new_copay_min | new_copay_max | new_copay_mode | est_code | est_price_min | est_price_max | est_price_mode | est_copay_min | est_copay_max | est_copay_mode |    lat |      lng | bounds_west | bounds_east | bounds_north | bounds_south |
|:----------------|:----------------------------------------|:------|:---------|:-----------------|:---------|--------------:|--------------:|---------------:|--------------:|--------------:|---------------:|:---------|--------------:|--------------:|---------------:|--------------:|--------------:|---------------:|-------:|---------:|------------:|------------:|-------------:|-------------:|
| Stevens Village | Yukon-Koyukuk Census Area               | AK    | 99774    | vascular surgery | 99203    |        74.816 |       233.632 |        116.688 |        18.704 |        58.408 |         29.172 | 99213    |        22.376 |       190.744 |          95.16 |         5.594 |        47.686 |          23.79 | 67.000 | -149.000 |   -149.1666 |   -148.9731 |     66.05727 |     65.99105 |
| Fairbanks       | Fairbanks North Star Borough            | AK    | 99775    | vascular surgery | 99203    |        74.816 |       233.632 |        116.688 |        18.704 |        58.408 |         29.172 | 99213    |        22.376 |       190.744 |          95.16 |         5.594 |        47.686 |          23.79 | 64.860 | -147.820 |   -147.8313 |   -147.8169 |     64.86201 |     64.85493 |
| Tanacross       | Southeast Fairbanks Census Area         | AK    | 99776    | vascular surgery | 99203    |        74.816 |       233.632 |        116.688 |        18.704 |        58.408 |         29.172 | 99213    |        22.376 |       190.744 |          95.16 |         5.594 |        47.686 |          23.79 | 63.385 | -143.347 |   -143.5985 |   -143.2727 |     63.42951 |     63.35797 |
| Tanana          | Yukon-Koyukuk Census Area               | AK    | 99777    | vascular surgery | 99203    |        74.816 |       233.632 |        116.688 |        18.704 |        58.408 |         29.172 | 99213    |        22.376 |       190.744 |          95.16 |         5.594 |        47.686 |          23.79 | 65.000 | -155.000 |   -152.2302 |   -151.9220 |     65.27328 |     65.16815 |
| Teller          | Nome Census Area                        | AK    | 99778    | vascular surgery | 99203    |        74.816 |       233.632 |        116.688 |        18.704 |        58.408 |         29.172 | 99213    |        22.376 |       190.744 |          95.16 |         5.594 |        47.686 |          23.79 | 65.260 | -166.340 |   -166.9534 |   -165.6498 |     65.44442 |     64.88255 |
| Tok             | Southeast Fairbanks Census Area         | AK    | 99779    | vascular surgery | 99203    |        74.816 |       233.632 |        116.688 |        18.704 |        58.408 |         29.172 | 99213    |        22.376 |       190.744 |          95.16 |         5.594 |        47.686 |          23.79 |     NA |       NA |          NA |          NA |           NA |           NA |
| Tok             | Southeast Fairbanks Census Area         | AK    | 99780    | vascular surgery | 99203    |        74.816 |       233.632 |        116.688 |        18.704 |        58.408 |         29.172 | 99213    |        22.376 |       190.744 |          95.16 |         5.594 |        47.686 |          23.79 | 63.000 | -142.000 |   -144.1504 |   -141.8093 |     63.49844 |     62.85613 |
| Venetie         | Yukon-Koyukuk Census Area               | AK    | 99781    | vascular surgery | 99203    |        74.816 |       233.632 |        116.688 |        18.704 |        58.408 |         29.172 | 99213    |        22.376 |       190.744 |          95.16 |         5.594 |        47.686 |          23.79 | 68.000 | -145.000 |   -147.2488 |   -145.1673 |     68.11005 |     66.96208 |
| Wainwright      | North Slope Borough                     | AK    | 99782    | vascular surgery | 99203    |        74.816 |       233.632 |        116.688 |        18.704 |        58.408 |         29.172 | 99213    |        22.376 |       190.744 |          95.16 |         5.594 |        47.686 |          23.79 | 70.000 | -161.000 |   -160.1063 |   -159.8087 |     70.68557 |     70.61122 |
| Wales           | Nome Census Area                        | AK    | 99783    | vascular surgery | 99203    |        74.816 |       233.632 |        116.688 |        18.704 |        58.408 |         29.172 | 99213    |        22.376 |       190.744 |          95.16 |         5.594 |        47.686 |          23.79 | 65.000 | -168.000 |   -168.1210 |   -167.8139 |     65.76203 |     65.55808 |
| White Mountain  | Nome Census Area                        | AK    | 99784    | vascular surgery | 99203    |        74.816 |       233.632 |        116.688 |        18.704 |        58.408 |         29.172 | 99213    |        22.376 |       190.744 |          95.16 |         5.594 |        47.686 |          23.79 | 64.600 | -163.600 |   -163.4308 |   -163.3879 |     64.68913 |     64.67156 |
| Brevig Mission  | Nome Census Area                        | AK    | 99785    | vascular surgery | 99203    |        74.816 |       233.632 |        116.688 |        18.704 |        58.408 |         29.172 | 99213    |        22.376 |       190.744 |          95.16 |         5.594 |        47.686 |          23.79 | 66.000 | -167.000 |   -166.5311 |   -166.4606 |     65.35140 |     65.32694 |
| Ambler          | Northwest Arctic Borough                | AK    | 99786    | vascular surgery | 99203    |        74.816 |       233.632 |        116.688 |        18.704 |        58.408 |         29.172 | 99213    |        22.376 |       190.744 |          95.16 |         5.594 |        47.686 |          23.79 | 67.080 | -157.860 |   -158.1938 |   -154.1323 |     68.04026 |     66.30205 |
| Chalkyitsik     | Yukon-Koyukuk Census Area               | AK    | 99788    | vascular surgery | 99203    |        74.816 |       233.632 |        116.688 |        18.704 |        58.408 |         29.172 | 99213    |        22.376 |       190.744 |          95.16 |         5.594 |        47.686 |          23.79 | 66.000 | -143.000 |   -143.8434 |   -143.7109 |     66.67571 |     66.62125 |
| Nuiqsut         | North Slope Borough                     | AK    | 99789    | vascular surgery | 99203    |        74.816 |       233.632 |        116.688 |        18.704 |        58.408 |         29.172 | 99213    |        22.376 |       190.744 |          95.16 |         5.594 |        47.686 |          23.79 | 70.220 | -150.990 |   -152.8811 |   -150.8346 |     70.43145 |     69.64461 |
| Fairbanks       | Yukon-Koyukuk Census Area               | AK    | 99790    | vascular surgery | 99203    |        74.816 |       233.632 |        116.688 |        18.704 |        58.408 |         29.172 | 99213    |        22.376 |       190.744 |          95.16 |         5.594 |        47.686 |          23.79 | 64.846 | -147.722 |   -148.9245 |   -147.8373 |     65.64674 |     65.21107 |
| Atqasuk         | North Slope Borough                     | AK    | 99791    | vascular surgery | 99203    |        74.816 |       233.632 |        116.688 |        18.704 |        58.408 |         29.172 | 99213    |        22.376 |       190.744 |          95.16 |         5.594 |        47.686 |          23.79 | 70.000 | -158.000 |   -157.5409 |   -155.8996 |     70.92612 |     70.20212 |
| Juneau          | Juneau City and Borough                 | AK    | 99801    | vascular surgery | 99203    |        74.816 |       233.632 |        116.688 |        18.704 |        58.408 |         29.172 | 99213    |        22.376 |       190.744 |          95.16 |         5.594 |        47.686 |          23.79 | 58.000 | -134.000 |   -135.0468 |   -133.1764 |     58.86994 |     57.79505 |
| Juneau          | City and Borough of Juneau              | AK    | 99802    | vascular surgery | 99203    |        74.816 |       233.632 |        116.688 |        18.704 |        58.408 |         29.172 | 99213    |        22.376 |       190.744 |          95.16 |         5.594 |        47.686 |          23.79 |     NA |       NA |          NA |          NA |           NA |           NA |
| Juneau          | City and Borough of Juneau              | AK    | 99803    | vascular surgery | 99203    |        74.816 |       233.632 |        116.688 |        18.704 |        58.408 |         29.172 | 99213    |        22.376 |       190.744 |          95.16 |         5.594 |        47.686 |          23.79 |     NA |       NA |          NA |          NA |           NA |           NA |
| Juneau          | City and Borough of Juneau              | AK    | 99811    | vascular surgery | 99203    |        74.816 |       233.632 |        116.688 |        18.704 |        58.408 |         29.172 | 99213    |        22.376 |       190.744 |          95.16 |         5.594 |        47.686 |          23.79 |     NA |       NA |          NA |          NA |           NA |           NA |
| Juneau          | City and Borough of Juneau              | AK    | 99812    | vascular surgery | 99203    |        74.816 |       233.632 |        116.688 |        18.704 |        58.408 |         29.172 | 99213    |        22.376 |       190.744 |          95.16 |         5.594 |        47.686 |          23.79 |     NA |       NA |          NA |          NA |           NA |           NA |
| Angoon          | Hoonah-Angoon Census Area               | AK    | 99820    | vascular surgery | 99203    |        74.816 |       233.632 |        116.688 |        18.704 |        58.408 |         29.172 | 99213    |        22.376 |       190.744 |          95.16 |         5.594 |        47.686 |          23.79 | 58.000 | -134.000 |   -134.9182 |   -133.0840 |     58.28291 |     57.01325 |
| Auke Bay        | City and Borough of Juneau              | AK    | 99821    | vascular surgery | 99203    |        74.816 |       233.632 |        116.688 |        18.704 |        58.408 |         29.172 | 99213    |        22.376 |       190.744 |          95.16 |         5.594 |        47.686 |          23.79 |     NA |       NA |          NA |          NA |           NA |           NA |
| Douglas         | Juneau City and Borough                 | AK    | 99824    | vascular surgery | 99203    |        74.816 |       233.632 |        116.688 |        18.704 |        58.408 |         29.172 | 99213    |        22.376 |       190.744 |          95.16 |         5.594 |        47.686 |          23.79 | 58.250 | -134.390 |   -134.4335 |   -134.3710 |     58.28844 |     58.25053 |
| Elfin Cove      | Hoonah-Angoon Census Area               | AK    | 99825    | vascular surgery | 99203    |        74.816 |       233.632 |        116.688 |        18.704 |        58.408 |         29.172 | 99213    |        22.376 |       190.744 |          95.16 |         5.594 |        47.686 |          23.79 | 58.180 | -136.320 |   -136.4060 |   -135.4067 |     58.31869 |     57.97906 |
| Gustavus        | Hoonah-Angoon Census Area               | AK    | 99826    | vascular surgery | 99203    |        74.816 |       233.632 |        116.688 |        18.704 |        58.408 |         29.172 | 99213    |        22.376 |       190.744 |          95.16 |         5.594 |        47.686 |          23.79 | 59.000 | -137.000 |   -137.9465 |   -135.3185 |     59.26530 |     58.20995 |
| Haines          | Haines Borough                          | AK    | 99827    | vascular surgery | 99203    |        74.816 |       233.632 |        116.688 |        18.704 |        58.408 |         29.172 | 99213    |        22.376 |       190.744 |          95.16 |         5.594 |        47.686 |          23.79 | 59.000 | -135.000 |   -136.4941 |   -135.0623 |     59.72963 |     58.20909 |
| Hoonah          | Hoonah-Angoon Census Area               | AK    | 99829    | vascular surgery | 99203    |        74.816 |       233.632 |        116.688 |        18.704 |        58.408 |         29.172 | 99213    |        22.376 |       190.744 |          95.16 |         5.594 |        47.686 |          23.79 | 58.000 | -135.700 |   -135.4682 |   -135.3783 |     58.13468 |     58.07797 |
| Kake            | Petersburg Census Area                  | AK    | 99830    | vascular surgery | 99203    |        74.816 |       233.632 |        116.688 |        18.704 |        58.408 |         29.172 | 99213    |        22.376 |       190.744 |          95.16 |         5.594 |        47.686 |          23.79 | 56.800 | -133.500 |   -134.4221 |   -133.7748 |     57.02448 |     56.61742 |
| Pelican         | Hoonah-Angoon Census Area               | AK    | 99832    | vascular surgery | 99203    |        74.816 |       233.632 |        116.688 |        18.704 |        58.408 |         29.172 | 99213    |        22.376 |       190.744 |          95.16 |         5.594 |        47.686 |          23.79 | 57.960 | -136.220 |   -136.4719 |   -135.9067 |     58.22218 |     57.83586 |
| Petersburg      | Petersburg Census Area                  | AK    | 99833    | vascular surgery | 99203    |        74.816 |       233.632 |        116.688 |        18.704 |        58.408 |         29.172 | 99213    |        22.376 |       190.744 |          95.16 |         5.594 |        47.686 |          23.79 | 57.000 | -133.000 |   -134.3224 |   -132.0510 |     57.42686 |     56.43192 |
| Sitka           | Sitka City and Borough                  | AK    | 99835    | vascular surgery | 99203    |        74.816 |       233.632 |        116.688 |        18.704 |        58.408 |         29.172 | 99213    |        22.376 |       190.744 |          95.16 |         5.594 |        47.686 |          23.79 | 57.000 | -136.000 |   -135.7137 |   -134.6163 |     57.61748 |     56.16154 |
| Port Alexander  | Petersburg Census Area                  | AK    | 99836    | vascular surgery | 99203    |        74.816 |       233.632 |        116.688 |        18.704 |        58.408 |         29.172 | 99213    |        22.376 |       190.744 |          95.16 |         5.594 |        47.686 |          23.79 | 56.220 | -134.640 |   -134.6667 |   -134.6221 |     56.27183 |     56.16960 |
| Skagway         | Skagway Municipality                    | AK    | 99840    | vascular surgery | 99203    |        74.816 |       233.632 |        116.688 |        18.704 |        58.408 |         29.172 | 99213    |        22.376 |       190.744 |          95.16 |         5.594 |        47.686 |          23.79 | 59.600 | -135.400 |   -135.7226 |   -134.9933 |     59.79963 |     59.34062 |
| Tenakee Springs | Hoonah-Angoon Census Area               | AK    | 99841    | vascular surgery | 99203    |        74.816 |       233.632 |        116.688 |        18.704 |        58.408 |         29.172 | 99213    |        22.376 |       190.744 |          95.16 |         5.594 |        47.686 |          23.79 | 57.775 | -135.201 |   -135.3169 |   -135.0522 |     57.81748 |     57.77394 |
| Juneau          | City and Borough of Juneau              | AK    | 99850    | vascular surgery | 99203    |        74.816 |       233.632 |        116.688 |        18.704 |        58.408 |         29.172 | 99213    |        22.376 |       190.744 |          95.16 |         5.594 |        47.686 |          23.79 |     NA |       NA |          NA |          NA |           NA |           NA |
| Ketchikan       | Ketchikan Gateway Borough               | AK    | 99901    | vascular surgery | 99203    |        74.816 |       233.632 |        116.688 |        18.704 |        58.408 |         29.172 | 99213    |        22.376 |       190.744 |          95.16 |         5.594 |        47.686 |          23.79 | 55.600 | -131.400 |   -133.2566 |   -129.9795 |     56.40738 |     54.66448 |
| Meyers Chuck    | Wrangell City and Borough               | AK    | 99903    | vascular surgery | 99203    |        74.816 |       233.632 |        116.688 |        18.704 |        58.408 |         29.172 | 99213    |        22.376 |       190.744 |          95.16 |         5.594 |        47.686 |          23.79 | 56.000 | -131.500 |   -132.3002 |   -131.8716 |     56.09563 |     55.63661 |
| Coffman Cove    | Prince of Wales-Hyder Census Area       | AK    | 99918    | vascular surgery | 99203    |        74.816 |       233.632 |        116.688 |        18.704 |        58.408 |         29.172 | 99213    |        22.376 |       190.744 |          95.16 |         5.594 |        47.686 |          23.79 | 56.010 | -132.830 |   -132.9055 |   -132.5660 |     56.04426 |     55.85769 |
| Thorne Bay      | Prince of Wales-Hyder Census Area       | AK    | 99919    | vascular surgery | 99203    |        74.816 |       233.632 |        116.688 |        18.704 |        58.408 |         29.172 | 99213    |        22.376 |       190.744 |          95.16 |         5.594 |        47.686 |          23.79 | 55.600 | -132.400 |   -132.6417 |   -132.3755 |     55.75541 |     55.53326 |
| Craig           | Prince of Wales-Hyder Census Area       | AK    | 99921    | vascular surgery | 99203    |        74.816 |       233.632 |        116.688 |        18.704 |        58.408 |         29.172 | 99213    |        22.376 |       190.744 |          95.16 |         5.594 |        47.686 |          23.79 | 55.490 | -133.130 |   -133.8217 |   -131.9526 |     56.22040 |     54.68963 |
| Hydaburg        | Prince of Wales-Hyder Census Area       | AK    | 99922    | vascular surgery | 99203    |        74.816 |       233.632 |        116.688 |        18.704 |        58.408 |         29.172 | 99213    |        22.376 |       190.744 |          95.16 |         5.594 |        47.686 |          23.79 | 55.200 | -132.900 |   -133.2838 |   -132.8006 |     55.38444 |     55.19380 |
| Hyder           | Prince of Wales-Hyder Census Area       | AK    | 99923    | vascular surgery | 99203    |        74.816 |       233.632 |        116.688 |        18.704 |        58.408 |         29.172 | 99213    |        22.376 |       190.744 |          95.16 |         5.594 |        47.686 |          23.79 | 56.000 | -131.000 |   -130.0752 |   -130.0043 |     56.03867 |     55.90772 |
| Klawock         | Prince of Wales-Hyder Census Area       | AK    | 99925    | vascular surgery | 99203    |        74.816 |       233.632 |        116.688 |        18.704 |        58.408 |         29.172 | 99213    |        22.376 |       190.744 |          95.16 |         5.594 |        47.686 |          23.79 | 55.550 | -133.080 |   -133.1284 |   -132.8321 |     55.63883 |     55.46796 |
| Metlakatla      | Prince of Wales-Outer Ketchikan Borough | AK    | 99926    | vascular surgery | 99203    |        74.816 |       233.632 |        116.688 |        18.704 |        58.408 |         29.172 | 99213    |        22.376 |       190.744 |          95.16 |         5.594 |        47.686 |          23.79 | 55.100 | -131.400 |   -131.6679 |   -131.2939 |     55.30097 |     54.98619 |
| Point Baker     | Prince of Wales-Hyder Census Area       | AK    | 99927    | vascular surgery | 99203    |        74.816 |       233.632 |        116.688 |        18.704 |        58.408 |         29.172 | 99213    |        22.376 |       190.744 |          95.16 |         5.594 |        47.686 |          23.79 | 56.352 | -133.629 |   -133.6832 |   -133.0640 |     56.35881 |     56.15497 |
| Ward Cove       | Ketchikan Gateway Borough               | AK    | 99928    | vascular surgery | 99203    |        74.816 |       233.632 |        116.688 |        18.704 |        58.408 |         29.172 | 99213    |        22.376 |       190.744 |          95.16 |         5.594 |        47.686 |          23.79 |     NA |       NA |          NA |          NA |           NA |           NA |
| Wrangell        | Wrangell City and Borough               | AK    | 99929    | vascular surgery | 99203    |        74.816 |       233.632 |        116.688 |        18.704 |        58.408 |         29.172 | 99213    |        22.376 |       190.744 |          95.16 |         5.594 |        47.686 |          23.79 | 56.000 | -132.000 |   -132.7234 |   -130.9979 |     56.90331 |     55.91256 |
| Ketchikan       | Prince of Wales-Outer Ketchikan Borough | AK    | 99950    | vascular surgery | 99203    |        74.816 |       233.632 |        116.688 |        18.704 |        58.408 |         29.172 | 99213    |        22.376 |       190.744 |          95.16 |         5.594 |        47.686 |          23.79 |     NA |       NA |          NA |          NA |           NA |           NA |

<br>

## Summary Statistics by State

Current average prices by state for an office visit by a **New Patient**
to a **Vascular Surgeon**:

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

Current average prices by state for an office visit by an **Established
Patient** to a **Cardiologist**:

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

## Code of Conduct

Please note that the `costoffice` project is released with a
[Contributor Code of
Conduct](https://andrewallenbruce.github.io/costoffice/CODE_OF_CONDUCT.html).
By contributing to this project, you agree to abide by its terms.
