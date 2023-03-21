
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

    #> Error in sd[, "csv_url"]: object of type 'closure' is not subsettable

<br>

## Geocoding with `zipcodeR`

``` r
search_datasets(specialty = "vascular surgery") |> 
  download_dataset() |> 
  tidytable::slice_tail(n = 50) |> 
  use_zipcoder() |> 
  knitr::kable()
```

    #> Error in sd[, "csv_url"]: object of type 'closure' is not subsettable

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

    #> Error in sd[, "csv_url"]: object of type 'closure' is not subsettable

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

    #> Error in sd[, "csv_url"]: object of type 'closure' is not subsettable

<br>

Current average prices by state for an office visit by an **Established
Patient** to a **Cardiologist**:

``` r
costoffice::search_datasets(specialty = "cardiology") |> 
  costoffice::download_dataset() |> 
  costoffice::use_zipcoder() |> 
  tidytable::drop_na() |> 
  tidytable::select(specialty, 
                    city,
                    state, 
                    tidytable::starts_with("est_")) |> 
  tidytable::summarise(avg_price_mode = round(mean(est_price_mode), 2),
                       avg_copay_mode = round(mean(est_copay_mode), 2),
                       .by = c(specialty,
                               city,
                               state, 
                               est_code)) |> 
  knitr::kable()
```

    #> Error in sd[, "csv_url"]: object of type 'closure' is not subsettable

<br>

## Code of Conduct

Please note that the `costoffice` project is released with a
[Contributor Code of
Conduct](https://andrewallenbruce.github.io/costoffice/CODE_OF_CONDUCT.html).
By contributing to this project, you agree to abide by its terms.
