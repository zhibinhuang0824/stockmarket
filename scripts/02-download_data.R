#### Preamble ####

#Author：zhibin huang
#Date: 29 November 2024
#Contact: hzb.huang@mail.toronto.ca


#### Workspace setup ####
library(tidyverse)

#### Download data from icf_stock_market_confidence_index_table####

the_raw_data <- read.csv("https://shiller-data-public.s3.amazonaws.com/icf_stock_market_confidence_index_table.csv")

#### Save data ####
# change the_raw_data to whatever name you assigned when you downloaded it.
write.csv(the_raw_data, "data/01-raw_data/raw_data.csv", row.names = T) 

         
