#### Preamble ####

#Author：zhibin huang
#Date: 29 November 2024
#Contact: hzb.huang@mail.toronto.ca

#### Workspace setup ####
library(tidyverse)
set.seed(1234)


#### Simulate data ####

# Create a dataset by randomly assigning 
analysis_data <- tibble(
  Date =  rev( seq(as.Date("2020-01-01") ,as.Date("2024-11-01"),by = "month") ), 
  Institutional  = 
    rnorm( length(seq(as.Date("2020-01-01") ,as.Date("2024-11-01"),by = "month") ), 76.35, 8.83),
  #use numbers from summary statistics
  Individual = rnorm( length(seq(as.Date("2020-01-01") ,as.Date("2024-11-01"),by = "month") ), 75.24, 6.4)
)
#showing a lower interaction with date of confidence index
analysis_data$Institutional [ analysis_data$Date > as.Date("2024-01-01")] <- rnorm(length(analysis_data$ Institutional [ analysis_data$Date > as.Date("2024-01-01")] ),
                                                                                    75.22, 8.25)
analysis_data$Individual [ analysis_data$Date > as.Date("2024-01-01")] <- rnorm(length(analysis_data$Individual[ analysis_data$Date > as.Date("2024-01-01")] ),
                                                                                    73.26, 6.1)
#### Save data ####
write_csv(analysis_data, "data/00-simulated_data/simulated_data.csv")
