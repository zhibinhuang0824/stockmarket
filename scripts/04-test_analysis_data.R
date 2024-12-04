#### Preamble ####

#Author：zhibin huang
#Date: 29 November 2024
#Contact: hzb.huang@mail.toronto.ca


#### Workspace setup ####
library(tidyverse)
library(testthat)
library(arrow)
analysis_data <- read_parquet("data/02-analysis_data/analysis_data.parquet")


#### Test data ####
# Test that the dataset has 151 rows - there are 151 divisions in Australia
test_that("dataset has 283 rows", {
  expect_equal(nrow(analysis_data), 283)
})

# Test that the dataset has 3 columns
test_that("dataset has 3 columns", {
  expect_equal(ncol(analysis_data), 3)
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
