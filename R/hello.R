library(devtools)
library(pkgbuild)
has_devel()
check_build_tools()
library(readr)
library(ggplot2)
library(tidyverse)
library(dplyr)

data <- read_csv("~/pk01/R/Advanced r programming dataset(in).csv")


utils::globalVariables(c("x", "y", "SPAD", "chlorophyll"))

## Function 1 : Making column names the same and removing any NA values

tidy_data <- function(data) {

    if (!is.data.frame(data)) {
      stop("Input must be a data frame")
    }

   tidied_data <- data %>%
    na.omit(data)%>%
    janitor::clean_names(case = "snake") ## changes all column names to snake_case (lowercase and spaces replaced with)

  return(tidied_data)
}


cleaned_Data <-tidy_data(data)



## Function 2: Making this dataset available as part of this R package

load_data <- function(data){

  usethis::use_data(data, compress="xz",overwrite = TRUE)

}

load_data(cleaned_Data)



##Function 3: Plotting inputted x vs. y

plot.tidy_data <- function(object, x, y, ...) {

  if (missing(x) || missing(y)) {

    stop("You must specify both x and y for the plot.")

  }

  ggplot(object, aes(x = .data[[x]], y = .data[[y]] )) +
    geom_point() +
    theme_minimal() +
    labs(title = "Tidy Data Plot")
}


plot.tidy_data(cleaned_Data, "SPAD", "chlorophyll")

devtools::check()
