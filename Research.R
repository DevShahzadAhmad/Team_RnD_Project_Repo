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

# Max HR
hist(df$Max.HR,
     main = "Histogram of Max HR",
     xlab = "Max HR",
     col = "orange",
     border = "white")

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