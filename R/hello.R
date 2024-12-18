# Hello, world!
#
# This is an example function named 'hello'
# which prints 'Hello, world!'.
#
# You can learn more about package authoring with RStudio at:
#
#   https://r-pkgs.org
#
# Some useful keyboard shortcuts for package authoring:
#
#   Install Package:           'Ctrl + Shift + B'
#   Check Package:             'Ctrl + Shift + E'
#   Test Package:              'Ctrl + Shift + T'

hello <- function() {
  print("Hello, world!")
}
#test 1

#hello.r


library(readr)
library(ggplot2)
library(tidyverse)
library(dplyr)

data <- read_csv("~/R programming project/pk01/R/Advanced r programming dataset.csv")





## Function 1
tidy_data <- function(data) {
  if (!is.data.frame(data)) {
    stop("Input must be a data frame")
  }
  tidied_data <- data %>%
    na.omit(data)%>%
    rename_with(~ gsub(" ", "_", .x))

  return(tidied_data)
}

cleaned_Data <-tidy_data(data)

## Function 2

usethis::use_data(cleaned_Data, compress="xz",overwrite = TRUE)



##Function 3

plot.tidy_data <- function(object, x, y, ...) {
  if (missing(x) || missing(y)) {
    stop("You must specify both x and y for the plot.")
  }
  ggplot(object, aes(x = .data[[x]], y = .data[[y]] )) +
    geom_point() +
    theme_minimal() +
    labs(title = "Tidy Data Plot")
}

plot.tidy_data(cleaned_Data, "chlorophyll", "SPAD")



