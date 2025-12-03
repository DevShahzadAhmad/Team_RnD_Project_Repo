#Saumya

df <- read.csv("Heart_Disease_Prediction.csv")

# All Histograms

# Age
hist(df$Age,
     main = "Histogram of Age",
     xlab = "Age",
     col = "orange",
     border = "white")

# BP
hist(df$BP,
     main = "Histogram of BP",
     xlab = "BP",
     col = "orange",
     border = "white")

# Cholesterol
hist(df$Cholesterol,
     main = "Histogram of Cholesterol",
     xlab = "Cholesterol",
     col = "orange",
     border = "white")

hist(df$Cholesterol,
     breaks = 20,
     prob = TRUE,
     main = "Histogram of Cholesterol with Density Curve",
     xlab = "Cholesterol",
     col = "lightblue",
     border = "white")

lines(density(df$Cholesterol, na.rm = TRUE),
      col = "red",
      lwd = 2)

# Max HR
hist(df$Max.HR,
     main = "Histogram of Max HR",
     xlab = "Max HR",
     col = "orange",
     border = "white")

hist(df$Max.HR,
     breaks = 20,
     prob = TRUE,
     main = "Histogram of Max HR with Density Curve",
     xlab = "Max HR",
     col = "lightblue",
     border = "white")

lines(density(df$Max.HR),
      col = "red",
      lwd = 2)

# ST depression
hist(df$ST.depression,
     main = "Histogram of ST Depression",
     xlab = "ST Depression",
     col = "orange",
     border = "white")

# First 5 rows
head(df, 5)

#Total no. of rows
nrow(df)

#Setting Heart Disease as a factor
df$Heart.Disease <- as.factor(df$Heart.Disease)

#Mean of Max HR against Heart Disease
tapply(df$Max.HR, df$Heart.Disease, mean, na.rm = TRUE)

#Mean of Cholesterol against Heart Disease
tapply(df$Cholesterol, df$Heart.Disease, mean, na.rm = TRUE)

#t-tests

t.test(Max.HR ~ Heart.Disease, data = df)

t.test(Cholesterol ~ Heart.Disease, data = df)