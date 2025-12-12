# Saumya
# Heart Disease Dataset - Exploratory Data Analysis

# Load the dataset
df <- read.csv("Heart_Disease_Prediction.csv")

# Quick data check
cat("Dataset loaded successfully!\n")
cat("Total number of rows:", nrow(df), "\n")
cat("Total number of columns:", ncol(df), "\n\n")

# Display first 5 rows
cat("First 5 rows of the dataset:\n")
head(df, 5)

# === Histograms for Continuous Variables ===

# Age
hist(df$Age,
     main = "Histogram of Age",
     xlab = "Age (years)",
     col = "orange",
     border = "white")

# Blood Pressure
hist(df$BP,
     main = "Histogram of Blood Pressure",
     xlab = "BP (mm Hg)",
     col = "orange",
     border = "white")

# Cholesterol
hist(df$Cholesterol,
     main = "Histogram of Cholesterol",
     xlab = "Cholesterol (mg/dl)",
     col = "orange",
     border = "white")

# Maximum Heart Rate
hist(df$Max.HR,
     main = "Histogram of Maximum Heart Rate",
     xlab = "Max HR (bpm)",
     col = "orange",
     border = "white")

# ST Depression
hist(df$ST.depression,
     main = "Histogram of ST Depression",
     xlab = "ST Depression (mm)",
     col = "orange",
     border = "white")


# Shahzad

# Code for the research on the presentation
library(tidyverse)
heart <- read.csv("Heart_Disease_Prediction.csv")
head(heart)



# Encode dependent variable: Absence = 0, Presence = 1
heart$HeartDisease_num <- ifelse(heart$Heart.Disease == "Presence", 1, 0)

# Select numeric predictors
numeric_vars <- heart %>%
  select(Age, BP, Cholesterol, Max.HR, ST.depression, HeartDisease_num)

# Compute correlation matrix
cor_matrix <- cor(numeric_vars, use = "complete.obs")

# Print matrix
print(cor_matrix)
