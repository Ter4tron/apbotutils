## code to prepare `DATASET` dataset goes here
row.name <- c("family", "color", "size", "mult", "dotsizer",
              "edgepad", "legend.mover", "y.text.size", "errwidth"
              )
row.value <- c("sans", "black", "18", "1.96", "14",
                   "0.4", "5", "4", "0.2")

Constants <- data.frame(row.name, row.value)
Constants

usethis::use_data(Constants, overwrite = TRUE)
