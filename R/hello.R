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


hello_erin <- function() {
  print("Hello")
}
hello_erin()


##function to remove missing values

remove_missing <- function(data) {
  if (!is.data.frame(data)) {
    stop("Input must be a data frame")
  }
  tidied_data <- na.omit(data)
  return(tidied_data)
}

remove_missing(data)



##code to replace spaces in variable names to underscores

clean_column_names <- function(data) {

  if (!is.data.frame(data)) {
    stop("Input must be a data frame")
  }
  data %>%
    rename_with(~ gsub(" ", "_", .x))
}

clean_column_names(data)
