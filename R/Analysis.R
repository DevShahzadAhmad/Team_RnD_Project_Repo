# Load required package
library(tidyverse)

# Read dataset
df <- read_csv("Heart_Disease_Prediction.csv")

# Convert Heart Disease variable to factor
df$Heart.Disease <- as.factor(df$Heart.Disease)


# -------------------------------------------------------
# 1. HISTOGRAM OF MAX HR
# -------------------------------------------------------

ggplot(df, aes(x = Max.HR)) +
  geom_histogram(
    aes(y = ..density..),
    bins = 20,
    fill = "lightblue",
    colour = "black"
  ) +
  geom_density(colour = "red", linewidth = 1) +
  labs(
    title = "Histogram of Max HR with Density Curve",
    x = "Max HR",
    y = "Density"
  ) +
  theme_minimal()


# -------------------------------------------------------
# 2. GROUP MEANS & STANDARD ERROR (for barplot)
# -------------------------------------------------------

group_means <- df %>%
  group_by(Heart.Disease) %>%
  summarise(
    mean_maxhr = mean(Max.HR, na.rm = TRUE),
    se_maxhr   = sd(Max.HR, na.rm = TRUE) / sqrt(n())
  )


# -------------------------------------------------------
# 3. BARPLOT OF MEAN MAX HR BY HEART DISEASE STATUS
# -------------------------------------------------------

ggplot(group_means, aes(x = Heart.Disease, y = mean_maxhr, fill = Heart.Disease)) +
  geom_col(width = 0.6) +
  geom_errorbar(
    aes(ymin = mean_maxhr - se_maxhr, ymax = mean_maxhr + se_maxhr),
    width = 0.2,
    size = 0.8
  ) +
  labs(
    title = "Mean Maximum Heart Rate by Heart Disease Status",
    x = "Heart Disease",
    y = "Mean Max HR (bpm)"
  ) +
  theme_minimal() +
  theme(legend.position = "none")


# -------------------------------------------------------
# 4. INDEPENDENT SAMPLES T-TEST
# -------------------------------------------------------

t.test(Max.HR ~ Heart.Disease, data = df)
