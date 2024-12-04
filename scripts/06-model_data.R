#### Preamble ####

#Author：zhibin huang
#Date: 29 November 2024
#Contact: hzb.huang@mail.toronto.ca

#### Workspace setup ####
library(tidyverse)
library(rstanarm)
library(tidyr)
library(arrow)
#### Read data ####
analysis_data <- read_parquet("data/02-analysis_data/analysis_data.parquet")
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
    seed = 1234
  )

second_model <- 
  
  glm(
    formula = Confidence ~ time +  Type ,
    data = analysis_data
  )
#### Save model ####
saveRDS(
  first_model,
  file = "./models/first_model.rds"
)
saveRDS(
  second_model,
  file = "./models/second_model.rds"
)

