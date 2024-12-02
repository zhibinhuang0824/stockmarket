
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
