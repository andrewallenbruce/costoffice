
# sd <- costoffice::search_datasets() |>
#       tidytable::select(specialty, csv_url)
#
# data <- dplyr::tibble(specialty = sd$specialty) |>
#         dplyr::mutate(file_contents = purrr::map(specialty, ~ readr::read_csv(sd$csv_url)))
#
# data |>
#   tidyr::unnest(file_contents) |>
#   tidytable::select(specialty,
#                     zip_code,
#                   new_code = most_utilized_procedure_code_for_new_patient,
#                   new_price_min = min_medicare_pricing_for_new_patient,
#                   new_price_max = max_medicare_pricing_for_new_patient,
#                   new_price_mode = mode_medicare_pricing_for_new_patient,
#                   new_copay_min = min_copay_for_new_patient,
#                   new_copay_max = max_copay_for_new_patient,
#                   new_copay_mode = mode_copay_for_new_patient,
#                   est_code = most_utilized_procedure_code_for_established_patient,
#                   est_price_min = min_medicare_pricing_for_established_patient,
#                   est_price_max = max_medicare_pricing_for_established_patient,
#                   est_price_mode = mode_medicare_pricing_for_established_patient,
#                   est_copay_min = min_copay_for_established_patient,
#                   est_copay_max = max_copay_for_established_patient,
#                   est_copay_mode = mode_copay_for_established_patient)
