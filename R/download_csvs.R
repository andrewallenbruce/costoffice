# ## Download all csv files
# urls <- search_datasets()$csv_url
# dir <- "E:/costoffice_data/costoffice_2022_raw_data/"
# curl::multi_download(urls = urls, destfiles = stringr::str_c(dir, basename(urls)))
#
# ## Load csv files from disk
# #### Prep
# paths <- list.files(dir, pattern = "[.]csv$", full.names = TRUE)
# names <- basename(paths)
# out <- gsub(".csv", ".rds", names)
# outdir <- "E:/costoffice_data/costoffice_2022_clean_data/"
#
# #### Data cleaning & Write to Disk
# tidy_csv(paths[[1]], names[[1]]) |> readr::write_rds(paste0(outdir, out[[1]])) |> tidytable::inv_gc()
# tidy_csv(paths[[2]], names[[2]]) |> readr::write_rds(paste0(outdir, out[[2]])) |> tidytable::inv_gc()
# tidy_csv(paths[[3]], names[[3]]) |> readr::write_rds(paste0(outdir, out[[3]])) |> tidytable::inv_gc()
# tidy_csv(paths[[4]], names[[4]]) |> readr::write_rds(paste0(outdir, out[[4]])) |> tidytable::inv_gc()
# tidy_csv(paths[[5]], names[[5]]) |> readr::write_rds(paste0(outdir, out[[5]])) |> tidytable::inv_gc()
# tidy_csv(paths[[6]], names[[6]]) |> readr::write_rds(paste0(outdir, out[[6]])) |> tidytable::inv_gc()
# tidy_csv(paths[[7]], names[[7]]) |> readr::write_rds(paste0(outdir, out[[7]])) |> tidytable::inv_gc()
# tidy_csv(paths[[8]], names[[8]]) |> readr::write_rds(paste0(outdir, out[[8]])) |> tidytable::inv_gc()
# tidy_csv(paths[[9]], names[[9]]) |> readr::write_rds(paste0(outdir, out[[9]])) |> tidytable::inv_gc()
# tidy_csv(paths[[10]], names[[10]]) |> readr::write_rds(paste0(outdir, out[[10]])) |> tidytable::inv_gc()
# tidy_csv(paths[[11]], names[[11]]) |> readr::write_rds(paste0(outdir, out[[11]])) |> tidytable::inv_gc()
# tidy_csv(paths[[12]], names[[12]]) |> readr::write_rds(paste0(outdir, out[[12]])) |> tidytable::inv_gc()
# tidy_csv(paths[[13]], names[[13]]) |> readr::write_rds(paste0(outdir, out[[13]])) |> tidytable::inv_gc()
# tidy_csv(paths[[14]], names[[14]]) |> readr::write_rds(paste0(outdir, out[[14]])) |> tidytable::inv_gc()
# tidy_csv(paths[[15]], names[[15]]) |> readr::write_rds(paste0(outdir, out[[15]])) |> tidytable::inv_gc()
# tidy_csv(paths[[16]], names[[16]]) |> readr::write_rds(paste0(outdir, out[[16]])) |> tidytable::inv_gc()
# tidy_csv(paths[[17]], names[[17]]) |> readr::write_rds(paste0(outdir, out[[17]])) |> tidytable::inv_gc()
# tidy_csv(paths[[18]], names[[18]]) |> readr::write_rds(paste0(outdir, out[[18]])) |> tidytable::inv_gc()
# tidy_csv(paths[[19]], names[[19]]) |> readr::write_rds(paste0(outdir, out[[19]])) |> tidytable::inv_gc()
# tidy_csv(paths[[20]], names[[20]]) |> readr::write_rds(paste0(outdir, out[[20]])) |> tidytable::inv_gc()
# tidy_csv(paths[[21]], names[[21]]) |> readr::write_rds(paste0(outdir, out[[21]])) |> tidytable::inv_gc()
# tidy_csv(paths[[22]], names[[22]]) |> readr::write_rds(paste0(outdir, out[[22]])) |> tidytable::inv_gc()
# tidy_csv(paths[[23]], names[[23]]) |> readr::write_rds(paste0(outdir, out[[23]])) |> tidytable::inv_gc()
# tidy_csv(paths[[24]], names[[24]]) |> readr::write_rds(paste0(outdir, out[[24]])) |> tidytable::inv_gc()
# tidy_csv(paths[[25]], names[[25]]) |> readr::write_rds(paste0(outdir, out[[25]])) |> tidytable::inv_gc()
# tidy_csv(paths[[26]], names[[26]]) |> readr::write_rds(paste0(outdir, out[[26]])) |> tidytable::inv_gc()
# tidy_csv(paths[[27]], names[[27]]) |> readr::write_rds(paste0(outdir, out[[27]])) |> tidytable::inv_gc()
# tidy_csv(paths[[28]], names[[28]]) |> readr::write_rds(paste0(outdir, out[[28]])) |> tidytable::inv_gc()
# tidy_csv(paths[[29]], names[[29]]) |> readr::write_rds(paste0(outdir, out[[29]])) |> tidytable::inv_gc()
# tidy_csv(paths[[30]], names[[30]]) |> readr::write_rds(paste0(outdir, out[[30]])) |> tidytable::inv_gc()
# tidy_csv(paths[[31]], names[[31]]) |> readr::write_rds(paste0(outdir, out[[31]])) |> tidytable::inv_gc()
# tidy_csv(paths[[32]], names[[32]]) |> readr::write_rds(paste0(outdir, out[[32]])) |> tidytable::inv_gc()
# tidy_csv(paths[[33]], names[[33]]) |> readr::write_rds(paste0(outdir, out[[33]])) |> tidytable::inv_gc()
# tidy_csv(paths[[34]], names[[34]]) |> readr::write_rds(paste0(outdir, out[[34]])) |> tidytable::inv_gc()
# tidy_csv(paths[[35]], names[[35]]) |> readr::write_rds(paste0(outdir, out[[35]])) |> tidytable::inv_gc()
# tidy_csv(paths[[36]], names[[36]]) |> readr::write_rds(paste0(outdir, out[[36]])) |> tidytable::inv_gc()
# tidy_csv(paths[[37]], names[[37]]) |> readr::write_rds(paste0(outdir, out[[37]])) |> tidytable::inv_gc()
# tidy_csv(paths[[38]], names[[38]]) |> readr::write_rds(paste0(outdir, out[[38]])) |> tidytable::inv_gc()
# tidy_csv(paths[[39]], names[[39]]) |> readr::write_rds(paste0(outdir, out[[39]])) |> tidytable::inv_gc()
# tidy_csv(paths[[40]], names[[40]]) |> readr::write_rds(paste0(outdir, out[[40]])) |> tidytable::inv_gc()
# tidy_csv(paths[[41]], names[[41]]) |> readr::write_rds(paste0(outdir, out[[41]])) |> tidytable::inv_gc()
# tidy_csv(paths[[42]], names[[42]]) |> readr::write_rds(paste0(outdir, out[[42]])) |> tidytable::inv_gc()
# tidy_csv(paths[[43]], names[[43]]) |> readr::write_rds(paste0(outdir, out[[43]])) |> tidytable::inv_gc()
# tidy_csv(paths[[44]], names[[44]]) |> readr::write_rds(paste0(outdir, out[[44]])) |> tidytable::inv_gc()
# tidy_csv(paths[[45]], names[[45]]) |> readr::write_rds(paste0(outdir, out[[45]])) |> tidytable::inv_gc()
# tidy_csv(paths[[46]], names[[46]]) |> readr::write_rds(paste0(outdir, out[[46]])) |> tidytable::inv_gc()
# tidy_csv(paths[[47]], names[[47]]) |> readr::write_rds(paste0(outdir, out[[47]])) |> tidytable::inv_gc()
# tidy_csv(paths[[48]], names[[48]]) |> readr::write_rds(paste0(outdir, out[[48]])) |> tidytable::inv_gc()
# tidy_csv(paths[[49]], names[[49]]) |> readr::write_rds(paste0(outdir, out[[49]])) |> tidytable::inv_gc()
# tidy_csv(paths[[50]], names[[50]]) |> readr::write_rds(paste0(outdir, out[[50]])) |> tidytable::inv_gc()
# tidy_csv(paths[[51]], names[[51]]) |> readr::write_rds(paste0(outdir, out[[51]])) |> tidytable::inv_gc()
# tidy_csv(paths[[52]], names[[52]]) |> readr::write_rds(paste0(outdir, out[[52]])) |> tidytable::inv_gc()
# tidy_csv(paths[[53]], names[[53]]) |> readr::write_rds(paste0(outdir, out[[53]])) |> tidytable::inv_gc()
# tidy_csv(paths[[54]], names[[54]]) |> readr::write_rds(paste0(outdir, out[[54]])) |> tidytable::inv_gc()
# tidy_csv(paths[[55]], names[[55]]) |> readr::write_rds(paste0(outdir, out[[55]])) |> tidytable::inv_gc()
# tidy_csv(paths[[56]], names[[56]]) |> readr::write_rds(paste0(outdir, out[[56]])) |> tidytable::inv_gc()
# tidy_csv(paths[[57]], names[[57]]) |> readr::write_rds(paste0(outdir, out[[57]])) |> tidytable::inv_gc()
# tidy_csv(paths[[58]], names[[58]]) |> readr::write_rds(paste0(outdir, out[[58]])) |> tidytable::inv_gc()
# tidy_csv(paths[[59]], names[[59]]) |> readr::write_rds(paste0(outdir, out[[59]])) |> tidytable::inv_gc()
# tidy_csv(paths[[60]], names[[60]]) |> readr::write_rds(paste0(outdir, out[[60]])) |> tidytable::inv_gc()
# tidy_csv(paths[[61]], names[[61]]) |> readr::write_rds(paste0(outdir, out[[61]])) |> tidytable::inv_gc()
# tidy_csv(paths[[62]], names[[62]]) |> readr::write_rds(paste0(outdir, out[[62]])) |> tidytable::inv_gc()
# tidy_csv(paths[[63]], names[[63]]) |> readr::write_rds(paste0(outdir, out[[63]])) |> tidytable::inv_gc()
# tidy_csv(paths[[64]], names[[64]]) |> readr::write_rds(paste0(outdir, out[[64]])) |> tidytable::inv_gc()
# tidy_csv(paths[[65]], names[[65]]) |> readr::write_rds(paste0(outdir, out[[65]])) |> tidytable::inv_gc()
# tidy_csv(paths[[66]], names[[66]]) |> readr::write_rds(paste0(outdir, out[[66]])) |> tidytable::inv_gc()
# tidy_csv(paths[[67]], names[[67]]) |> readr::write_rds(paste0(outdir, out[[67]])) |> tidytable::inv_gc()
# tidy_csv(paths[[68]], names[[68]]) |> readr::write_rds(paste0(outdir, out[[68]])) |> tidytable::inv_gc()
# tidy_csv(paths[[69]], names[[69]]) |> readr::write_rds(paste0(outdir, out[[69]])) |> tidytable::inv_gc()
# tidy_csv(paths[[70]], names[[70]]) |> readr::write_rds(paste0(outdir, out[[70]])) |> tidytable::inv_gc()
# tidy_csv(paths[[71]], names[[71]]) |> readr::write_rds(paste0(outdir, out[[71]])) |> tidytable::inv_gc()
# tidy_csv(paths[[72]], names[[72]]) |> readr::write_rds(paste0(outdir, out[[72]])) |> tidytable::inv_gc()
# tidy_csv(paths[[73]], names[[73]]) |> readr::write_rds(paste0(outdir, out[[73]])) |> tidytable::inv_gc()
# tidy_csv(paths[[74]], names[[74]]) |> readr::write_rds(paste0(outdir, out[[74]])) |> tidytable::inv_gc()
# tidy_csv(paths[[75]], names[[75]]) |> readr::write_rds(paste0(outdir, out[[75]])) |> tidytable::inv_gc()
# tidy_csv(paths[[76]], names[[76]]) |> readr::write_rds(paste0(outdir, out[[76]])) |> tidytable::inv_gc()
# tidy_csv(paths[[77]], names[[77]]) |> readr::write_rds(paste0(outdir, out[[77]])) |> tidytable::inv_gc()
# tidy_csv(paths[[78]], names[[78]]) |> readr::write_rds(paste0(outdir, out[[78]])) |> tidytable::inv_gc()
# tidy_csv(paths[[79]], names[[79]]) |> readr::write_rds(paste0(outdir, out[[79]])) |> tidytable::inv_gc()
# tidy_csv(paths[[80]], names[[80]]) |> readr::write_rds(paste0(outdir, out[[80]])) |> tidytable::inv_gc()
# tidy_csv(paths[[81]], names[[81]]) |> readr::write_rds(paste0(outdir, out[[81]])) |> tidytable::inv_gc()
# tidy_csv(paths[[82]], names[[82]]) |> readr::write_rds(paste0(outdir, out[[82]])) |> tidytable::inv_gc()
# tidy_csv(paths[[83]], names[[83]]) |> readr::write_rds(paste0(outdir, out[[83]])) |> tidytable::inv_gc()
#
# ## Load RDS files
# df <- readr::read_rds(paste0(outdir, out[[83]])) |>
#   dplyr::tibble() |>
#   dplyr::mutate(hcpcs = paste0("(", hcpcs, ")")) |>
#   tidyr::unite("type", c(patient, cost, hcpcs), sep = " ") |>
#   dplyr::group_by(specialty, state, type) |>
#   dplyr::summarise(zip_codes = dplyr::n(),
#                    avg_min = mean(min, na.rm = TRUE),
#                    avg_mode = mean(mode, na.rm = TRUE),
#                    avg_max = mean(min, na.rm = TRUE),
#                    avg_range = mean(range, na.rm = TRUE),
#                    .groups = "drop")
#
# # -------------------------------------------------------------------------
# tidy_csv <- function(file, name) {
#
#   results <- tidytable::fread(input = file,
#                               nThread = 4,
#                               keepLeadingZeros = TRUE,
#                               colClasses = c(
#                                 zip_code = "character",
#                                 most_utilized_procedure_code_for_new_patient = "character",
#                             most_utilized_procedure_code_for_established_patient = "character")) |>
#     tidytable::select(zip_code,
#                            new_code       = most_utilized_procedure_code_for_new_patient,
#                            new_price_min  = min_medicare_pricing_for_new_patient,
#                            new_price_max  = max_medicare_pricing_for_new_patient,
#                            new_price_mode = mode_medicare_pricing_for_new_patient,
#                            new_copay_min  = min_copay_for_new_patient,
#                            new_copay_max  = max_copay_for_new_patient,
#                            new_copay_mode = mode_copay_for_new_patient,
#                            est_code       = most_utilized_procedure_code_for_established_patient,
#                            est_price_min  = min_medicare_pricing_for_established_patient,
#                            est_price_max  = max_medicare_pricing_for_established_patient,
#                            est_price_mode = mode_medicare_pricing_for_established_patient,
#                            est_copay_min  = min_copay_for_established_patient,
#                            est_copay_max  = max_copay_for_established_patient,
#                            est_copay_mode = mode_copay_for_established_patient)
#
#
#   new <- tidytable::select(results,
#                            zip_code,
#                            hcpcs = new_code,
#                            tidytable::starts_with("new")) |>
#     tidytable::pivot_longer(tidytable::starts_with("new_"),
#                             names_to = c("patient",
#                                          "cost",
#                                          "stat"),
#                             values_to = "amount",
#                             names_sep = "_") |>
#     tidytable::pivot_wider(names_from = stat,
#                            values_from = amount)
#
#   est <- tidytable::select(results,
#                            zip_code,
#                            hcpcs = est_code,
#                            tidytable::starts_with("est")) |>
#     tidytable::pivot_longer(tidytable::starts_with("est_"),
#                             names_to = c("patient",
#                                          "cost",
#                                          "stat"),
#                             values_to = "amount",
#                             names_sep = "_") |>
#     tidytable::pivot_wider(names_from = stat,
#                            values_from = amount)
#
#   results <- tidytable::bind_rows(new, est) |>
#     tidytable::mutate(range = max - min)
#
#   results <- results |>
#     tidytable::left_join(costoffice::zip_db, by = c("zip_code")) |>
#     tidytable::mutate(county = tidytable::na_if(county, "")) |>
#     tidytable::select(zip_code,
#                       city,
#                       county,
#                       state,
#                       region,
#                       division,
#                       tidytable::everything())
#
#   name <- gsub(".csv", "", name)
#
#   name <- gsub("_", " ", name)
#
#   results$specialty <- name
#
#   results <- results |>
#     tidytable::relocate(specialty) |>
#     tidytable::mutate(
#       patient = tidytable::case_when(
#         patient == "new" ~ "New",
#         patient == "est" ~ "Established",
#         TRUE ~ patient),
#       cost = stringr::str_to_sentence(cost))
#
#   tidytable::inv_gc()
#
#   return(results)
#
# }
#
# .datatable.aware <- TRUE
#
# # -------------------------------------------------------------------------
# dir <- "E:/costoffice_data/costoffice_2022_raw_data/"
# paths <- list.files(dir, pattern = "[.]csv$", full.names = TRUE)
# names <- basename(paths)
# out <- gsub(".csv", ".rds", names)
# outdir <- "E:/costoffice_data/costoffice_2022_clean_data/"
#
# summarise_by_specialty <- function(dir = outdir, name = out) {
#
#   readr::read_rds(paste0(dir, name)) |>
#     dplyr::tibble() |>
#     dplyr::mutate(hcpcs = paste0("(", hcpcs, ")")) |>
#     tidyr::unite("type", c(patient, cost, hcpcs), sep = " ") |>
#     dplyr::group_by(specialty, type) |>
#     dplyr::summarise(n = dplyr::n(),
#                      min = min(min, na.rm = TRUE),
#                      avg_min = mean(min, na.rm = TRUE),
#                      avg_mode = mean(mode, na.rm = TRUE),
#                      avg_max = mean(min, na.rm = TRUE),
#                      max = max(max, na.rm = TRUE),
#                      avg_range = mean(range, na.rm = TRUE),
#                      .groups = "drop")
# }
#
# summarise_by_state <- function(dir = outdir, name = out) {
#
#   readr::read_rds(paste0(dir, name)) |>
#     dplyr::tibble() |>
#     dplyr::mutate(hcpcs = paste0("(", hcpcs, ")")) |>
#     tidyr::unite("type", c(patient, cost, hcpcs), sep = " ") |>
#     dplyr::group_by(state, type) |>
#     dplyr::summarise(n = dplyr::n(),
#                      min = min(min, na.rm = TRUE),
#                      avg_min = mean(min, na.rm = TRUE),
#                      avg_mode = mean(mode, na.rm = TRUE),
#                      avg_max = mean(min, na.rm = TRUE),
#                      max = max(max, na.rm = TRUE),
#                      avg_range = mean(range, na.rm = TRUE),
#                      .groups = "drop")
# }
#
# summarise_by_spec_state <- function(dir = outdir, name = out) {
#
#   readr::read_rds(paste0(dir, name)) |>
#     dplyr::tibble() |>
#     dplyr::mutate(hcpcs = paste0("(", hcpcs, ")")) |>
#     tidyr::unite("type", c(patient, cost, hcpcs), sep = " ") |>
#     dplyr::group_by(specialty, state, type) |>
#     dplyr::summarise(zip_codes = dplyr::n(),
#                      min = min(min, na.rm = TRUE),
#                      avg_min = mean(min, na.rm = TRUE),
#                      avg_mode = mean(mode, na.rm = TRUE),
#                      avg_max = mean(min, na.rm = TRUE),
#                      max = max(max, na.rm = TRUE),
#                      avg_range = mean(range, na.rm = TRUE),
#                      .groups = "drop")
# }
#
# df_specialty <- out |>
#   purrr::map(\(x) summarise_by_specialty(name = x)) |>
#   purrr::list_rbind()
#
# df_state <- out |>
#   purrr::map(\(x) summarise_by_state(name = x)) |>
#   purrr::list_rbind()
#
# df_spec_state <- out |>
#   purrr::map(\(x) summarise_by_spec_state(name = x)) |>
#   purrr::list_rbind()
