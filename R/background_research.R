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
