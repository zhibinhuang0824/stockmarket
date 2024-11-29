#### Preamble ####
# Purpose: Models... [...UPDATE THIS...]
# Author: Rohan Alexander [...UPDATE THIS...]
# Date: 11 February 2023 [...UPDATE THIS...]
# Contact: rohan.alexander@utoronto.ca [...UPDATE THIS...]
# License: MIT
# Pre-requisites: [...UPDATE THIS...]
# Any other information needed? [...UPDATE THIS...]


#### Workspace setup ####
library(tidyverse)
library(rstanarm)
library(tidyr)
#### Read data ####
analysis_data <- read_csv("data/02-analysis_data/analysis_data.csv")[,-1]

analysis_data <- analysis_data  %>% pivot_longer(-Date, values_to = "Confidence", names_to =  "Type")
analysis_data$time <-  decimal_date(analysis_data$Date)
### Model data ####
first_model <-
  stan_glm(
    formula = Confidence ~ time +  Type ,
    data = analysis_data,
    family = gaussian(),
    prior = normal(location = 0, scale = 1, autoscale = TRUE),
    prior_intercept = normal(location = 0, scale = 1, autoscale = TRUE),
    prior_aux = exponential(rate = 1, autoscale = TRUE),
    seed = 853
  )


#### Save model ####
saveRDS(
  first_model,
  file = "./models/first_model.rds"
)


