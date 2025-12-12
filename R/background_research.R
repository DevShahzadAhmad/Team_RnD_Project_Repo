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

# Convert Heart Disease to factor for clarity
df <- df %>%
  mutate(
    HeartDisease = factor(Heart.Disease,
                          levels = c("Absence", "Presence")),
    Sex = factor(Sex, labels = c("Female", "Male"))
  )

# Compare summary statistics of MaxHR by heart disease group
df %>%
  group_by(HeartDisease) %>%
  summarise(
    n = n(),
    mean_MaxHR = mean(Max.HR),
    median_MaxHR = median(Max.HR),
    sd_MaxHR = sd(Max.HR),
    min_MaxHR = min(Max.HR),
    max_MaxHR = max(Max.HR)
  )

#A histogram of maximum heart rate with an overlaid kernel density curve.
mu <- mean(df$Max.HR)
sigma <- sd(df$Max.HR)

ggplot(df, aes(x = Max.HR)) +
  geom_histogram(bins = 20,
                 fill = "grey80",
                 colour = "black",
                 aes(y = after_stat(density))) +
  stat_function(fun = dnorm,
                args = list(mean = mu, sd = sigma),
                colour = "blue",
                linewidth = 1) +
  labs(title = "Distribution of Maximum Heart Rate",
       x = "Maximum Heart Rate (bpm)",
       y = "Density") +
  theme_classic()
