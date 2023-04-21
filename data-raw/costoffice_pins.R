## code to prepare `costoffice_pins` dataset goes here

costoffice_board <- pins::board_folder(here::here("pkgdown/assets/pins_board"))

costoffice_board |> pins::pin_write(co_v1,
                                    type = "qs",
                                    title = "Cost Office Full Dataset",
                                    description = "Physician Office Visit Costs Dataset")

pins::write_board_manifest(costoffice_board)

#usethis::use_data(costoffice_pins, overwrite = TRUE)
