#### Preamble ####
# Purpose: Simulates a dataset of Australian electoral divisions, including the 
  #state and party that won each division.
# Author: Rohan Alexander
# Date: 26 September 2024
# Contact: rohan.alexander@utoronto.ca
# License: MIT
# Pre-requisites: The `tidyverse` package must be installed
# Any other information needed? Make sure you are in the `starter_folder` rproj


#### Workspace setup ####
library(tidyverse)
set.seed(853)


#### Simulate data ####


# Create a dataset by randomly assigning 
analysis_data <- tibble(
  Date =  rev( seq(as.Date("2020-01-01") ,as.Date("2024-11-01"),by = "month") ), 
  Institutional  = rnorm( length(seq(as.Date("2020-01-01") ,as.Date("2024-11-01"),by = "month") ), 76.35, 8.83),#use numbers from summary statistics
   Individual = rnorm( length(seq(as.Date("2020-01-01") ,as.Date("2024-11-01"),by = "month") ), 75.24, 6.4)
)


#### Save data ####
write_csv(analysis_data, "data/00-simulated_data/simulated_data.csv")
