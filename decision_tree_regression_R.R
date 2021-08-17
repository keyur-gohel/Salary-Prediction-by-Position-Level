# Decision Tree Regression

# Data Preprocessing
# Importing Dataset
dataset = read.csv('Position_Salaries.CSV')
dataset = dataset[2:3]

# Splitting the dataset into the Training set and Test set
# # install.packages('caTools')
# library(caTools)
# set.seed(123)
# split = sample.split(dataset$Salary, SplitRatio = 2/3)
# training_set = subset(dataset, split == TRUE)
# test_set = subset(dataset, split == FALSE)

# Feature Scaling
# training_set = scale(training_set)
# test_set = scale(test_set)


# Modeling
# Fitting Decesion Tree Regression To Dataset
library(rpart)
regressor = rpart(formula = Salary ~ .,
                  data = dataset,
                  control = rpart.control(minsplit = 1))


# Predicting
# Predict Values With Decesion Tree Regressor
y_pred = predict(regressor, data.frame(Level = 6.5))


# VIsualisation
# Visualisation Decision Tree Regression (smoth curve and High resolution)
library(ggplot2)
x_grid = seq(min(dataset$Level), max(dataset$Level), 0.01)
ggplot() +
  geom_point(aes(x = dataset$Level, y =dataset$Salary),
             colour = 'red') +
  geom_line(aes(x = x_grid, y = predict(regressor, newdata = data.frame(Level = x_grid))),
            colour = 'blue') +
  ggtitle('Truth or Bluff!! (Decision Tree)') +
  xlab('Level') +
  ylab('Salary')
