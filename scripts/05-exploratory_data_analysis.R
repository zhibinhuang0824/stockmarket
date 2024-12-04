#### Preamble ####

#Author：zhibin huang
#Date: 29 November 2024
#Contact: hzb.huang@mail.toronto.ca


#### Workspace setup ####
library(tidyverse)
library(tidyr)
library(arrow)
#### Read data ####
#line time series
analysis_data <- read_parquet("data/02-analysis_data/analysis_data.parquet")
analysis_data <- analysis_data  %>% pivot_longer(-Date, values_to = "Confidence", names_to =  "Type")
analysis_data$time <-  decimal_date(analysis_data$Date)
analysis_data |> 
  ggplot(aes(x = Date, y = Confidence, color = Type )) +
  geom_point(alpha = 0.8, size = 3) +
  geom_line() + 
  theme_minimal() +
  labs(x = "Date",
       y = "Confidence Index of Stock Market")

#boxplot
analysis_data |> 
  ggplot(aes(x = Type, y = Confidence, color = Type )) +
  geom_boxplot() +
  theme_minimal() +
  labs(x = "Type of item",
       y = "Confidence Index of Stock Market")
#show summary table
library(modelsummary)
modelsummary::datasummary(Confidence ~ Type*(mean+sd+min+max + median) , data = analysis_data )

