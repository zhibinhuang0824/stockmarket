
#### Workspace setup ####
library(tidyverse)

#### Clean data ####
#load raw data
data <- read_csv("data/01-raw_data/raw_data.csv", skip = 1)
#clean column names
colnames(data) <- c("Date",
                    "Institutional",
                    "Standard Error",
                    "Individual",
                    "Standard Error"
)
#select needed columns
data <- data[,c(1,2,4)]
#given Date format
data$Date <- parse_date( paste0("01/",data$Date), format = "%d/%m/%Y")
#convert numeric format
data$Individual <- as.numeric(data$Individual)
#missing values
data <- data %>% drop_na()
#only use data from 2020
data <- data %>% filter(Date >= as.Date("2000-01-01"))

#### Save data ####
write.csv(data, file = "data/02-analysis_data/analysis_data.csv")
