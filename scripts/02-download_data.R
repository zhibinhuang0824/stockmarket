#### Preamble ####
# Purpose: Downloads and saves the data from [...UPDATE THIS...]
# Author: Rohan Alexander [...UPDATE THIS...]
# Date: 11 February 2023 [...UPDATE THIS...]
# Contact: rohan.alexander@utoronto.ca [...UPDATE THIS...]
# License: MIT
# Pre-requisites: [...UPDATE THIS...]
# Any other information needed? [...UPDATE THIS...]


#### Workspace setup ####
#library(opendatatoronto)
library(tidyverse)
# [...UPDATE THIS...]

#### Download data from icf_stock_market_confidence_index_table####

the_raw_data <- read.csv("https://shiller-data-public.s3.amazonaws.com/icf_stock_market_confidence_index_table.csv")

#### Save data ####
# change the_raw_data to whatever name you assigned when you downloaded it.
write.csv(the_raw_data, "data/01-raw_data/raw_data.csv", row.names = T) 

         
