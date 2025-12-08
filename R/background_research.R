# Load required packages
library(tidyverse)

# Load dataset
df <- read.csv("data/Heart_Disease_Prediction.csv")

# Inspect dataset structure
str(df)

# Check the first few rows
head(df)

# Summary of all variables
summary(df)

# Count missing values in each column
colSums(is.na(df))

# Compare summary statistics of MaxHR by heart disease group
heart %>%
  group_by(HeartDisease) %>%
  summarise(
    n = n(),
    mean_MaxHR = mean(Max.HR),
    median_MaxHR = median(Max.HR),
    sd_MaxHR = sd(Max.HR),
    min_MaxHR = min(Max.HR),
    max_MaxHR = max(Max.HR)
  )
