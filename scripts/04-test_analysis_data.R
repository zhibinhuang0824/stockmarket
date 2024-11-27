#### Preamble ####
# Purpose: Tests... [...UPDATE THIS...]
# Author: Rohan Alexander [...UPDATE THIS...]
# Date: 26 September 2024 [...UPDATE THIS...]
# Contact: rohan.alexander@utoronto.ca [...UPDATE THIS...]
# License: MIT
# Pre-requisites: [...UPDATE THIS...]
# Any other information needed? [...UPDATE THIS...]


#### Workspace setup ####
library(tidyverse)
library(testthat)

analysis_data <- read_csv("data/02-analysis_data/analysis_data.csv")


#### Test data ####
# Test that the dataset has 151 rows - there are 151 divisions in Australia
test_that("dataset has 283 rows", {
  expect_equal(nrow(analysis_data), 283)
})

# Test that the dataset has 4 columns
test_that("dataset has 4 columns", {
  expect_equal(ncol(analysis_data), 4)
})

# Test that the 'Institutional' column is numeric type
test_that("'Institutional' is double", {
  expect_type(analysis_data$Institutional, "double")
})

# Test that the 'Date' column is double type
test_that("'Date' is double", {
  expect_type( analysis_data$Date, "double")
})

# Test that there are no missing values in the dataset
test_that("no missing values in dataset", {
  expect_true(all(!is.na(analysis_data)))
})
