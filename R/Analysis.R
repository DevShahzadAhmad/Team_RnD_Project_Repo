library(tidyverse)

df <- read_csv("Heart_Disease_Prediction.csv")

df$Heart.Disease <- as.factor(df$Heart.Disease)

#Group means
group_means <- summarise(group_by(df, Heart.Disease),
                         mean_max_hr = mean(Max.HR, na.rm = TRUE),
                         sd_max_hr = sd(Max.HR, na.rm = TRUE),
                         n = n())

#Histogram
ggplot(df, aes(x = Max.HR)) +
  geom_histogram(aes(y = ..density..),
                 bins = 20,
                 fill = "lightblue",
                 colour = "black") +
  geom_density(colour = "red", linewidth = 1) +
  theme_minimal() +
  labs(title = "Histogram of Max HR with Density Curve",
       x = "Max HR",
       y = "Density")

#Barplot
ggplot(df, aes(x = Heart.Disease, y = Max.HR, fill = Heart.Disease)) +
  stat_summary(fun = mean, geom = "bar") +
  stat_summary(fun.data = mean_se, geom = "errorbar", width = 0.2) +
  theme_minimal() +
  labs(title = "Mean Max HR by Heart Disease Status",
       x = "Heart Disease",
       y = "Mean Max HR")

#t-test
t.test(Max.HR ~ Heart.Disease, data = df)


