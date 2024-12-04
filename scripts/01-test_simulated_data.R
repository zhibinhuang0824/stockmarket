#### Preamble ####

#Author：zhibin huang
#Date: 29 November 2024
#Contact: hzb.huang@mail.toronto.ca


#### Workspace setup ####
library(tidyverse)

analysis_data <- read_csv("data/00-simulated_data/simulated_data.csv")

# Test if the data was successfully loaded
if (exists("analysis_data")) {
  message("Test Passed: The dataset was successfully loaded.")
} else {
  stop("Test Failed: The dataset could not be loaded.")
}


#### Test data ####

# Check if the dataset has 59 rows
if (nrow(analysis_data) == 59) {
  message("Test Passed: The dataset has 59 rows.")
} else {
  stop("Test Failed: The dataset does not have 59 rows.")
}

# Check if the dataset has 3 columns
if (ncol(analysis_data) == 3) {
  message("Test Passed: The dataset has 3 columns.")
} else {
  stop("Test Failed: The dataset does not have 3 columns.")
}
