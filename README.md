
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

    #> # A tidytable: 10 × 15
    #>    zip_code new_top_code new_p…¹ new_p…² new_p…³ new_c…⁴ new_c…⁵ new_c…⁶ est_t…⁷
    #>    <chr>           <int>   <dbl>   <dbl>   <dbl>   <dbl>   <dbl>   <dbl>   <int>
    #>  1 99919           99203    74.8    234.    117.    18.7    58.4    29.2   99213
    #>  2 99921           99203    74.8    234.    117.    18.7    58.4    29.2   99213
    #>  3 99922           99203    74.8    234.    117.    18.7    58.4    29.2   99213
    #>  4 99923           99203    74.8    234.    117.    18.7    58.4    29.2   99213
    #>  5 99925           99203    74.8    234.    117.    18.7    58.4    29.2   99213
    #>  6 99926           99203    74.8    234.    117.    18.7    58.4    29.2   99213
    #>  7 99927           99203    74.8    234.    117.    18.7    58.4    29.2   99213
    #>  8 99928           99203    74.8    234.    117.    18.7    58.4    29.2   99213
    #>  9 99929           99203    74.8    234.    117.    18.7    58.4    29.2   99213
    #> 10 99950           99203    74.8    234.    117.    18.7    58.4    29.2   99213
    #> # … with 6 more variables: est_price_min <dbl>, est_price_max <dbl>,
    #> #   est_price_mode <dbl>, est_copay_min <dbl>, est_copay_max <dbl>,
    #> #   est_copay_mode <dbl>, and abbreviated variable names ¹​new_price_min,
    #> #   ²​new_price_max, ³​new_price_mode, ⁴​new_copay_min, ⁵​new_copay_max,
    #> #   ⁶​new_copay_mode, ⁷​est_top_code

<br>

## Geocoding with `zipcodeR`

``` r
search_datasets(specialty = "vascular surgery") |> 
  download_dataset() |> 
  tidytable::slice_tail(n = 50) |> 
  use_zipcoder() |> 
  tidytable::select(-geo) |> 
  knitr::kable()
```

| city            | county                                  | state | zip_code | new_top_code | new_price_min | new_price_max | new_price_mode | new_copay_min | new_copay_max | new_copay_mode | est_top_code | est_price_min | est_price_max | est_price_mode | est_copay_min | est_copay_max | est_copay_mode |
|:----------------|:----------------------------------------|:------|:---------|-------------:|--------------:|--------------:|---------------:|--------------:|--------------:|---------------:|-------------:|--------------:|--------------:|---------------:|--------------:|--------------:|---------------:|
| Stevens Village | Yukon-Koyukuk Census Area               | AK    | 99774    |        99203 |        74.816 |       233.632 |        116.688 |        18.704 |        58.408 |         29.172 |        99213 |        22.376 |       190.744 |          95.16 |         5.594 |        47.686 |          23.79 |
| Fairbanks       | Fairbanks North Star Borough            | AK    | 99775    |        99203 |        74.816 |       233.632 |        116.688 |        18.704 |        58.408 |         29.172 |        99213 |        22.376 |       190.744 |          95.16 |         5.594 |        47.686 |          23.79 |
| Tanacross       | Southeast Fairbanks Census Area         | AK    | 99776    |        99203 |        74.816 |       233.632 |        116.688 |        18.704 |        58.408 |         29.172 |        99213 |        22.376 |       190.744 |          95.16 |         5.594 |        47.686 |          23.79 |
| Tanana          | Yukon-Koyukuk Census Area               | AK    | 99777    |        99203 |        74.816 |       233.632 |        116.688 |        18.704 |        58.408 |         29.172 |        99213 |        22.376 |       190.744 |          95.16 |         5.594 |        47.686 |          23.79 |
| Teller          | Nome Census Area                        | AK    | 99778    |        99203 |        74.816 |       233.632 |        116.688 |        18.704 |        58.408 |         29.172 |        99213 |        22.376 |       190.744 |          95.16 |         5.594 |        47.686 |          23.79 |
| Tok             | Southeast Fairbanks Census Area         | AK    | 99779    |        99203 |        74.816 |       233.632 |        116.688 |        18.704 |        58.408 |         29.172 |        99213 |        22.376 |       190.744 |          95.16 |         5.594 |        47.686 |          23.79 |
| Tok             | Southeast Fairbanks Census Area         | AK    | 99780    |        99203 |        74.816 |       233.632 |        116.688 |        18.704 |        58.408 |         29.172 |        99213 |        22.376 |       190.744 |          95.16 |         5.594 |        47.686 |          23.79 |
| Venetie         | Yukon-Koyukuk Census Area               | AK    | 99781    |        99203 |        74.816 |       233.632 |        116.688 |        18.704 |        58.408 |         29.172 |        99213 |        22.376 |       190.744 |          95.16 |         5.594 |        47.686 |          23.79 |
| Wainwright      | North Slope Borough                     | AK    | 99782    |        99203 |        74.816 |       233.632 |        116.688 |        18.704 |        58.408 |         29.172 |        99213 |        22.376 |       190.744 |          95.16 |         5.594 |        47.686 |          23.79 |
| Wales           | Nome Census Area                        | AK    | 99783    |        99203 |        74.816 |       233.632 |        116.688 |        18.704 |        58.408 |         29.172 |        99213 |        22.376 |       190.744 |          95.16 |         5.594 |        47.686 |          23.79 |
| White Mountain  | Nome Census Area                        | AK    | 99784    |        99203 |        74.816 |       233.632 |        116.688 |        18.704 |        58.408 |         29.172 |        99213 |        22.376 |       190.744 |          95.16 |         5.594 |        47.686 |          23.79 |
| Brevig Mission  | Nome Census Area                        | AK    | 99785    |        99203 |        74.816 |       233.632 |        116.688 |        18.704 |        58.408 |         29.172 |        99213 |        22.376 |       190.744 |          95.16 |         5.594 |        47.686 |          23.79 |
| Ambler          | Northwest Arctic Borough                | AK    | 99786    |        99203 |        74.816 |       233.632 |        116.688 |        18.704 |        58.408 |         29.172 |        99213 |        22.376 |       190.744 |          95.16 |         5.594 |        47.686 |          23.79 |
| Chalkyitsik     | Yukon-Koyukuk Census Area               | AK    | 99788    |        99203 |        74.816 |       233.632 |        116.688 |        18.704 |        58.408 |         29.172 |        99213 |        22.376 |       190.744 |          95.16 |         5.594 |        47.686 |          23.79 |
| Nuiqsut         | North Slope Borough                     | AK    | 99789    |        99203 |        74.816 |       233.632 |        116.688 |        18.704 |        58.408 |         29.172 |        99213 |        22.376 |       190.744 |          95.16 |         5.594 |        47.686 |          23.79 |
| Fairbanks       | Yukon-Koyukuk Census Area               | AK    | 99790    |        99203 |        74.816 |       233.632 |        116.688 |        18.704 |        58.408 |         29.172 |        99213 |        22.376 |       190.744 |          95.16 |         5.594 |        47.686 |          23.79 |
| Atqasuk         | North Slope Borough                     | AK    | 99791    |        99203 |        74.816 |       233.632 |        116.688 |        18.704 |        58.408 |         29.172 |        99213 |        22.376 |       190.744 |          95.16 |         5.594 |        47.686 |          23.79 |
| Juneau          | Juneau City and Borough                 | AK    | 99801    |        99203 |        74.816 |       233.632 |        116.688 |        18.704 |        58.408 |         29.172 |        99213 |        22.376 |       190.744 |          95.16 |         5.594 |        47.686 |          23.79 |
| Juneau          | City and Borough of Juneau              | AK    | 99802    |        99203 |        74.816 |       233.632 |        116.688 |        18.704 |        58.408 |         29.172 |        99213 |        22.376 |       190.744 |          95.16 |         5.594 |        47.686 |          23.79 |
| Juneau          | City and Borough of Juneau              | AK    | 99803    |        99203 |        74.816 |       233.632 |        116.688 |        18.704 |        58.408 |         29.172 |        99213 |        22.376 |       190.744 |          95.16 |         5.594 |        47.686 |          23.79 |
| Juneau          | City and Borough of Juneau              | AK    | 99811    |        99203 |        74.816 |       233.632 |        116.688 |        18.704 |        58.408 |         29.172 |        99213 |        22.376 |       190.744 |          95.16 |         5.594 |        47.686 |          23.79 |
| Juneau          | City and Borough of Juneau              | AK    | 99812    |        99203 |        74.816 |       233.632 |        116.688 |        18.704 |        58.408 |         29.172 |        99213 |        22.376 |       190.744 |          95.16 |         5.594 |        47.686 |          23.79 |
| Angoon          | Hoonah-Angoon Census Area               | AK    | 99820    |        99203 |        74.816 |       233.632 |        116.688 |        18.704 |        58.408 |         29.172 |        99213 |        22.376 |       190.744 |          95.16 |         5.594 |        47.686 |          23.79 |
| Auke Bay        | City and Borough of Juneau              | AK    | 99821    |        99203 |        74.816 |       233.632 |        116.688 |        18.704 |        58.408 |         29.172 |        99213 |        22.376 |       190.744 |          95.16 |         5.594 |        47.686 |          23.79 |
| Douglas         | Juneau City and Borough                 | AK    | 99824    |        99203 |        74.816 |       233.632 |        116.688 |        18.704 |        58.408 |         29.172 |        99213 |        22.376 |       190.744 |          95.16 |         5.594 |        47.686 |          23.79 |
| Elfin Cove      | Hoonah-Angoon Census Area               | AK    | 99825    |        99203 |        74.816 |       233.632 |        116.688 |        18.704 |        58.408 |         29.172 |        99213 |        22.376 |       190.744 |          95.16 |         5.594 |        47.686 |          23.79 |
| Gustavus        | Hoonah-Angoon Census Area               | AK    | 99826    |        99203 |        74.816 |       233.632 |        116.688 |        18.704 |        58.408 |         29.172 |        99213 |        22.376 |       190.744 |          95.16 |         5.594 |        47.686 |          23.79 |
| Haines          | Haines Borough                          | AK    | 99827    |        99203 |        74.816 |       233.632 |        116.688 |        18.704 |        58.408 |         29.172 |        99213 |        22.376 |       190.744 |          95.16 |         5.594 |        47.686 |          23.79 |
| Hoonah          | Hoonah-Angoon Census Area               | AK    | 99829    |        99203 |        74.816 |       233.632 |        116.688 |        18.704 |        58.408 |         29.172 |        99213 |        22.376 |       190.744 |          95.16 |         5.594 |        47.686 |          23.79 |
| Kake            | Petersburg Census Area                  | AK    | 99830    |        99203 |        74.816 |       233.632 |        116.688 |        18.704 |        58.408 |         29.172 |        99213 |        22.376 |       190.744 |          95.16 |         5.594 |        47.686 |          23.79 |
| Pelican         | Hoonah-Angoon Census Area               | AK    | 99832    |        99203 |        74.816 |       233.632 |        116.688 |        18.704 |        58.408 |         29.172 |        99213 |        22.376 |       190.744 |          95.16 |         5.594 |        47.686 |          23.79 |
| Petersburg      | Petersburg Census Area                  | AK    | 99833    |        99203 |        74.816 |       233.632 |        116.688 |        18.704 |        58.408 |         29.172 |        99213 |        22.376 |       190.744 |          95.16 |         5.594 |        47.686 |          23.79 |
| Sitka           | Sitka City and Borough                  | AK    | 99835    |        99203 |        74.816 |       233.632 |        116.688 |        18.704 |        58.408 |         29.172 |        99213 |        22.376 |       190.744 |          95.16 |         5.594 |        47.686 |          23.79 |
| Port Alexander  | Petersburg Census Area                  | AK    | 99836    |        99203 |        74.816 |       233.632 |        116.688 |        18.704 |        58.408 |         29.172 |        99213 |        22.376 |       190.744 |          95.16 |         5.594 |        47.686 |          23.79 |
| Skagway         | Skagway Municipality                    | AK    | 99840    |        99203 |        74.816 |       233.632 |        116.688 |        18.704 |        58.408 |         29.172 |        99213 |        22.376 |       190.744 |          95.16 |         5.594 |        47.686 |          23.79 |
| Tenakee Springs | Hoonah-Angoon Census Area               | AK    | 99841    |        99203 |        74.816 |       233.632 |        116.688 |        18.704 |        58.408 |         29.172 |        99213 |        22.376 |       190.744 |          95.16 |         5.594 |        47.686 |          23.79 |
| Juneau          | City and Borough of Juneau              | AK    | 99850    |        99203 |        74.816 |       233.632 |        116.688 |        18.704 |        58.408 |         29.172 |        99213 |        22.376 |       190.744 |          95.16 |         5.594 |        47.686 |          23.79 |
| Ketchikan       | Ketchikan Gateway Borough               | AK    | 99901    |        99203 |        74.816 |       233.632 |        116.688 |        18.704 |        58.408 |         29.172 |        99213 |        22.376 |       190.744 |          95.16 |         5.594 |        47.686 |          23.79 |
| Meyers Chuck    | Wrangell City and Borough               | AK    | 99903    |        99203 |        74.816 |       233.632 |        116.688 |        18.704 |        58.408 |         29.172 |        99213 |        22.376 |       190.744 |          95.16 |         5.594 |        47.686 |          23.79 |
| Coffman Cove    | Prince of Wales-Hyder Census Area       | AK    | 99918    |        99203 |        74.816 |       233.632 |        116.688 |        18.704 |        58.408 |         29.172 |        99213 |        22.376 |       190.744 |          95.16 |         5.594 |        47.686 |          23.79 |
| Thorne Bay      | Prince of Wales-Hyder Census Area       | AK    | 99919    |        99203 |        74.816 |       233.632 |        116.688 |        18.704 |        58.408 |         29.172 |        99213 |        22.376 |       190.744 |          95.16 |         5.594 |        47.686 |          23.79 |
| Craig           | Prince of Wales-Hyder Census Area       | AK    | 99921    |        99203 |        74.816 |       233.632 |        116.688 |        18.704 |        58.408 |         29.172 |        99213 |        22.376 |       190.744 |          95.16 |         5.594 |        47.686 |          23.79 |
| Hydaburg        | Prince of Wales-Hyder Census Area       | AK    | 99922    |        99203 |        74.816 |       233.632 |        116.688 |        18.704 |        58.408 |         29.172 |        99213 |        22.376 |       190.744 |          95.16 |         5.594 |        47.686 |          23.79 |
| Hyder           | Prince of Wales-Hyder Census Area       | AK    | 99923    |        99203 |        74.816 |       233.632 |        116.688 |        18.704 |        58.408 |         29.172 |        99213 |        22.376 |       190.744 |          95.16 |         5.594 |        47.686 |          23.79 |
| Klawock         | Prince of Wales-Hyder Census Area       | AK    | 99925    |        99203 |        74.816 |       233.632 |        116.688 |        18.704 |        58.408 |         29.172 |        99213 |        22.376 |       190.744 |          95.16 |         5.594 |        47.686 |          23.79 |
| Metlakatla      | Prince of Wales-Outer Ketchikan Borough | AK    | 99926    |        99203 |        74.816 |       233.632 |        116.688 |        18.704 |        58.408 |         29.172 |        99213 |        22.376 |       190.744 |          95.16 |         5.594 |        47.686 |          23.79 |
| Point Baker     | Prince of Wales-Hyder Census Area       | AK    | 99927    |        99203 |        74.816 |       233.632 |        116.688 |        18.704 |        58.408 |         29.172 |        99213 |        22.376 |       190.744 |          95.16 |         5.594 |        47.686 |          23.79 |
| Ward Cove       | Ketchikan Gateway Borough               | AK    | 99928    |        99203 |        74.816 |       233.632 |        116.688 |        18.704 |        58.408 |         29.172 |        99213 |        22.376 |       190.744 |          95.16 |         5.594 |        47.686 |          23.79 |
| Wrangell        | Wrangell City and Borough               | AK    | 99929    |        99203 |        74.816 |       233.632 |        116.688 |        18.704 |        58.408 |         29.172 |        99213 |        22.376 |       190.744 |          95.16 |         5.594 |        47.686 |          23.79 |
| Ketchikan       | Prince of Wales-Outer Ketchikan Borough | AK    | 99950    |        99203 |        74.816 |       233.632 |        116.688 |        18.704 |        58.408 |         29.172 |        99213 |        22.376 |       190.744 |          95.16 |         5.594 |        47.686 |          23.79 |

<br>

## Summary Statistics by State

Current average prices by state for an office visit by a **New Patient**
to a **Vascular Surgeon**:

``` r
search_datasets(specialty = "vascular surgery") |> 
  download_dataset() |> 
  use_zipcoder() |> 
  tidytable::select(state, tidytable::starts_with("new_")) |> 
  tidytable::summarise(avg_min = mean(new_price_min),
                       avg_max = mean(new_price_max),
                       avg_mode = mean(new_price_mode),
                       avg_copay_min = mean(new_copay_min),
                       avg_copay_max = mean(new_copay_max),
                       avg_copay_mode = mean(new_copay_mode),
                       .by = c(state, new_top_code)) |> 
  knitr::kable()
```

| state | new_top_code |  avg_min |  avg_max |  avg_mode | avg_copay_min | avg_copay_max | avg_copay_mode |
|:------|-------------:|---------:|---------:|----------:|--------------:|--------------:|---------------:|
| NA    |        99203 | 58.55011 | 178.0044 |  90.13161 |      14.63753 |      44.50110 |       22.53290 |
| AK    |        99203 | 74.81600 | 233.6320 | 116.68800 |      18.70400 |      58.40800 |       29.17200 |
| AL    |        99203 | 55.54400 | 170.6160 |  85.95200 |      13.88600 |      42.65400 |       21.48800 |
| AR    |        99203 | 53.13600 | 163.6720 |  82.31200 |      13.28400 |      40.91800 |       20.57800 |
| AZ    |        99203 | 57.31200 | 174.6720 |  88.33600 |      14.32800 |      43.66800 |       22.08400 |
| CA    |        99203 | 63.96274 | 191.4808 |  97.69472 |      15.99069 |      47.87020 |       24.42368 |
| CO    |        99203 | 60.06400 | 181.0080 |  92.04800 |      15.01600 |      45.25200 |       23.01200 |
| CT    |        99203 | 63.47200 | 190.8720 |  97.18400 |      15.86800 |      47.71800 |       24.29600 |
| DC    |        99203 | 68.56800 | 204.5680 | 104.59200 |      17.14200 |      51.14200 |       26.14800 |
| DE    |        99203 | 59.80000 | 180.9520 |  91.84800 |      14.95000 |      45.23800 |       22.96200 |
| FL    |        99203 | 59.50686 | 181.9566 |  91.91565 |      14.87672 |      45.48916 |       22.97891 |
| GA    |        99203 | 56.19265 | 172.1172 |  86.82782 |      14.04816 |      43.02929 |       21.70696 |
| HI    |        99203 | 63.01600 | 188.1120 |  96.11200 |      15.75400 |      47.02800 |       24.02800 |
| IA    |        99203 | 54.88000 | 167.7120 |  84.67200 |      13.72000 |      41.92800 |       21.16800 |
| ID    |        99203 | 53.93600 | 165.4400 |  83.36800 |      13.48400 |      41.36000 |       20.84200 |
| IL    |        99203 | 58.51602 | 178.9383 |  90.37385 |      14.62900 |      44.73458 |       22.59346 |
| IN    |        99203 | 54.76800 | 167.5440 |  84.54400 |      13.69200 |      41.88600 |       21.13600 |
| KS    |        99203 | 54.99200 | 168.0720 |  84.85600 |      13.74800 |      42.01800 |       21.21400 |
| KY    |        99203 | 54.72000 | 168.4160 |  84.75200 |      13.68000 |      42.10400 |       21.18800 |
| LA    |        99203 | 56.35087 | 173.6683 |  87.37184 |      14.08772 |      43.41706 |       21.84296 |
| MA    |        99203 | 62.85904 | 189.0272 |  96.23768 |      15.71476 |      47.25680 |       24.05942 |
| MD    |        99203 | 63.44152 | 191.1060 |  97.23305 |      15.86038 |      47.77650 |       24.30826 |
| ME    |        99203 | 55.76780 | 170.4254 |  86.05939 |      13.94195 |      42.60636 |       21.51485 |
| MI    |        99203 | 57.26866 | 175.2421 |  88.46181 |      14.31717 |      43.81053 |       22.11545 |
| MN    |        99203 | 57.95200 | 174.8400 |  88.84000 |      14.48800 |      43.71000 |       22.21000 |
| MO    |        99203 | 54.98135 | 169.0726 |  85.12273 |      13.74534 |      42.26815 |       21.28068 |
| MS    |        99203 | 53.50400 | 165.0880 |  82.96000 |      13.37600 |      41.27200 |       20.74000 |
| MT    |        99203 | 59.12000 | 179.2880 |  90.90400 |      14.78000 |      44.82200 |       22.72600 |
| NC    |        99203 | 56.51200 | 172.6560 |  87.20800 |      14.12800 |      43.16400 |       21.80200 |
| ND    |        99203 | 57.75200 | 174.5680 |  88.61600 |      14.43800 |      43.64200 |       22.15400 |
| NE    |        99203 | 54.43200 | 166.1440 |  83.92000 |      13.60800 |      41.53600 |       20.98000 |
| NH    |        99203 | 60.13600 | 181.5520 |  92.25600 |      15.03400 |      45.38800 |       23.06400 |
| NJ    |        99203 | 65.56033 | 196.1567 | 100.12798 |      16.39008 |      49.03919 |       25.03199 |
| NM    |        99203 | 56.40000 | 173.3200 |  87.31200 |      14.10000 |      43.33000 |       21.82800 |
| NV    |        99203 | 60.19200 | 183.0160 |  92.69600 |      15.04800 |      45.75400 |       23.17400 |
| NY    |        99203 | 62.47486 | 189.1462 |  96.00561 |      15.61871 |      47.28656 |       24.00140 |
| OH    |        99203 | 56.74400 | 173.9440 |  87.72800 |      14.18600 |      43.48600 |       21.93200 |
| OK    |        99203 | 54.97600 | 168.9040 |  85.07200 |      13.74400 |      42.22600 |       21.26800 |
| OR    |        99203 | 57.36956 | 174.1255 |  88.22323 |      14.34239 |      43.53137 |       22.05581 |
| PA    |        99203 | 57.96446 | 176.5596 |  89.31989 |      14.49112 |      44.13989 |       22.32997 |
| PR    |        99203 | 59.39200 | 179.9520 |  91.28000 |      14.84800 |      44.98800 |       22.82000 |
| RI    |        99203 | 61.15200 | 184.8880 |  93.88000 |      15.28800 |      46.22200 |       23.47000 |
| SC    |        99203 | 55.43200 | 169.7600 |  85.63200 |      13.85800 |      42.44000 |       21.40800 |
| SD    |        99203 | 57.53600 | 173.8400 |  88.26400 |      14.38400 |      43.46000 |       22.06600 |
| TN    |        99203 | 54.58400 | 167.1920 |  84.32000 |      13.64600 |      41.79800 |       21.08000 |
| TX    |        99203 | 57.48533 | 174.6063 |  88.43434 |      14.37133 |      43.65158 |       22.10859 |
| UT    |        99203 | 56.18400 | 171.8240 |  86.74400 |      14.04600 |      42.95600 |       21.68600 |
| VA    |        99203 | 59.81039 | 181.0333 |  91.87380 |      14.95260 |      45.25831 |       22.96845 |
| VT    |        99203 | 58.12800 | 175.8320 |  89.24000 |      14.53200 |      43.95800 |       22.31000 |
| WA    |        99203 | 60.09151 | 181.2114 |  92.12345 |      15.02288 |      45.30284 |       23.03086 |
| WI    |        99203 | 55.63200 | 169.1600 |  85.60800 |      13.90800 |      42.29000 |       21.40200 |
| WV    |        99203 | 55.31200 | 170.8160 |  85.84800 |      13.82800 |      42.70400 |       21.46200 |
| WY    |        99203 | 58.77600 | 178.1120 |  90.33600 |      14.69400 |      44.52800 |       22.58400 |

<br>

Current average prices by state for an office visit by an **Established
Patient** to a **Cardiologist**:

``` r
search_datasets(specialty = "cardiology") |> 
  download_dataset() |> 
  use_zipcoder() |> 
  tidytable::select(state, tidytable::starts_with("est_")) |> 
  tidytable::summarise(avg_min = mean(est_price_min),
                       avg_max = mean(est_price_max),
                       avg_mode = mean(est_price_mode),
                       avg_copay_min = mean(est_copay_min),
                       avg_copay_max = mean(est_copay_max),
                       avg_copay_mode = mean(est_copay_mode),
                       .by = c(state, est_top_code)) |> 
  knitr::kable()
```

| state | est_top_code |  avg_min |  avg_max |  avg_mode | avg_copay_min | avg_copay_max | avg_copay_mode |
|:------|-------------:|---------:|---------:|----------:|--------------:|--------------:|---------------:|
| NA    |        99214 | 18.19982 | 145.4331 | 104.12394 |      4.549956 |      36.35828 |       26.03099 |
| AK    |        99214 | 22.37600 | 190.7440 | 135.84800 |      5.594000 |      47.68600 |       33.96200 |
| AL    |        99214 | 16.93600 | 139.0880 |  99.33600 |      4.234000 |      34.77200 |       24.83400 |
| AR    |        99214 | 16.26400 | 133.8480 |  95.60800 |      4.066000 |      33.46200 |       23.90200 |
| AZ    |        99214 | 17.74400 | 142.6480 | 102.07200 |      4.436000 |      35.66200 |       25.51800 |
| CA    |        99214 | 20.48726 | 157.1162 | 112.92056 |      5.121814 |      39.27906 |       28.23014 |
| CO    |        99214 | 18.98400 | 148.2000 | 106.32800 |      4.746000 |      37.05000 |       26.58200 |
| CT    |        99214 | 20.08800 | 156.1840 | 112.09600 |      5.022000 |      39.04600 |       28.02400 |
| DC    |        99214 | 21.87200 | 167.2480 | 120.20000 |      5.468000 |      41.81200 |       30.05000 |
| DE    |        99214 | 18.72000 | 147.8880 | 105.98400 |      4.680000 |      36.97200 |       26.49600 |
| FL    |        99214 | 18.06239 | 147.6902 | 105.47837 |      4.515597 |      36.92256 |       26.36959 |
| GA    |        99214 | 17.22544 | 140.3960 | 100.33747 |      4.306360 |      35.09901 |       25.08437 |
| HI    |        99214 | 20.25600 | 154.3680 | 111.00800 |      5.064000 |      38.59200 |       27.75200 |
| IA    |        99214 | 17.04000 | 137.3680 |  98.29600 |      4.260000 |      34.34200 |       24.57400 |
| ID    |        99214 | 16.64800 | 135.4400 |  96.84000 |      4.162000 |      33.86000 |       24.21000 |
| IL    |        99214 | 17.84426 | 145.5157 | 103.97222 |      4.461064 |      36.37892 |       25.99305 |
| IN    |        99214 | 16.96000 | 137.1600 |  98.12000 |      4.240000 |      34.29000 |       24.53000 |
| KS    |        99214 | 17.06400 | 137.6240 |  98.47200 |      4.266000 |      34.40600 |       24.61800 |
| KY    |        99214 | 16.65600 | 137.3440 |  98.06400 |      4.164000 |      34.33600 |       24.51600 |
| LA    |        99214 | 16.94879 | 141.0495 | 100.60521 |      4.237197 |      35.26238 |       25.15130 |
| MA    |        99214 | 19.92195 | 154.7662 | 111.09154 |      4.980486 |      38.69155 |       27.77288 |
| MD    |        99214 | 19.92944 | 156.0376 | 111.90210 |      4.982360 |      39.00940 |       27.97552 |
| ME    |        99214 | 17.24430 | 139.3399 |  99.67418 |      4.311074 |      34.83496 |       24.91855 |
| MI    |        99214 | 17.51825 | 142.7475 | 102.01384 |      4.379562 |      35.68688 |       25.50346 |
| MN    |        99214 | 18.41600 | 143.5680 | 103.04800 |      4.604000 |      35.89200 |       25.76200 |
| MO    |        99214 | 16.75576 | 137.8893 |  98.47124 |      4.188940 |      34.47233 |       24.61781 |
| MS    |        99214 | 16.25600 | 134.7440 |  96.17600 |      4.064000 |      33.68600 |       24.04400 |
| MT    |        99214 | 18.41600 | 146.4160 | 104.87200 |      4.604000 |      36.60400 |       26.21800 |
| NC    |        99214 | 17.43200 | 140.9840 | 100.83200 |      4.358000 |      35.24600 |       25.20800 |
| ND    |        99214 | 18.26400 | 143.2160 | 102.73600 |      4.566000 |      35.80400 |       25.68400 |
| NE    |        99214 | 17.00000 | 136.3120 |  97.60000 |      4.250000 |      34.07800 |       24.40000 |
| NH    |        99214 | 18.89600 | 148.4400 | 106.44000 |      4.724000 |      37.11000 |       26.61000 |
| NJ    |        99214 | 20.91854 | 160.6245 | 115.40896 |      5.229634 |      40.15613 |       28.85224 |
| NM    |        99214 | 17.10400 | 141.0240 | 100.67200 |      4.276000 |      35.25600 |       25.16800 |
| NV    |        99214 | 18.54400 | 149.0000 | 106.60000 |      4.636000 |      37.25000 |       26.65000 |
| NY    |        99214 | 19.37964 | 154.0527 | 110.31778 |      4.844909 |      38.51317 |       27.57945 |
| OH    |        99214 | 17.31200 | 141.6640 | 101.20000 |      4.328000 |      35.41600 |       25.30000 |
| OK    |        99214 | 16.80000 | 137.8320 |  98.45600 |      4.200000 |      34.45800 |       24.61400 |
| OR    |        99214 | 17.98889 | 142.6490 | 102.21768 |      4.497222 |      35.66224 |       25.55442 |
| PA    |        99214 | 17.93197 | 144.1224 | 103.12717 |      4.482993 |      36.03061 |       25.78179 |
| PR    |        99214 | 18.52800 | 146.9680 | 105.28000 |      4.632000 |      36.74200 |       26.32000 |
| RI    |        99214 | 19.15200 | 151.0800 | 108.28800 |      4.788000 |      37.77000 |       27.07200 |
| SC    |        99214 | 17.06400 | 138.6960 |  99.16000 |      4.266000 |      34.67400 |       24.79000 |
| SD    |        99214 | 18.24000 | 142.7200 | 102.40800 |      4.560000 |      35.68000 |       25.60200 |
| TN    |        99214 | 16.86400 | 136.8240 |  97.84800 |      4.216000 |      34.20600 |       24.46200 |
| TX    |        99214 | 17.98123 | 142.9479 | 102.40835 |      4.495307 |      35.73696 |       25.60209 |
| UT    |        99214 | 17.30400 | 140.3040 | 100.32800 |      4.326000 |      35.07600 |       25.08200 |
| VA    |        99214 | 18.70496 | 147.9312 | 106.00909 |      4.676240 |      36.98280 |       26.50227 |
| VT    |        99214 | 18.32000 | 144.0880 | 103.32000 |      4.580000 |      36.02200 |       25.83000 |
| WA    |        99214 | 18.97468 | 148.3786 | 106.44473 |      4.743670 |      37.09464 |       26.61118 |
| WI    |        99214 | 17.46400 | 138.8000 |  99.45600 |      4.366000 |      34.70000 |       24.86400 |
| WV    |        99214 | 16.61600 | 138.8320 |  98.99200 |      4.154000 |      34.70800 |       24.74800 |
| WY    |        99214 | 18.37600 | 145.6160 | 104.33600 |      4.594000 |      36.40400 |       26.08400 |

<br>

## Code of Conduct

Please note that the `costoffice` project is released with a
[Contributor Code of
Conduct](https://andrewallenbruce.github.io/costoffice/CODE_OF_CONDUCT.html).
By contributing to this project, you agree to abide by its terms.
