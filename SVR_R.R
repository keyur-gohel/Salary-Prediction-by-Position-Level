# SVR

# Data Preprocessing 

# Importing Dataset
dataset = read.csv('Position_Salaries.csv')
dataset = dataset[2:3]

#Fitting SVR To Dataset
library(e1071)
regressor = svm(formula = Salary ~ .,
                data = dataset,
                type = 'eps-regression')

# Prediction Value With SVR
y_pred = predict(regressor, data.frame(6.5))

# Visualising SVR Model
library(ggplot2)
ggplot() +
  geom_point(aes(x = dataset$Level, y = dataset$Salary),
             colour = 'red') +
  geom_line(aes(x = dataset$Level, y = predict(regressor, newdata = dataset)),
            colour = 'blue') +
  ggtitle('Truth or Bluff (SVR)') +
  xlab('Level') +
  ylab('Salary')

# Visualising SVR Model (Smother Curve and Higher Resolution)
x_grid = seq(min(dataset$Level), max(dataset$Level), 0.1)
ggplot()+
  geom_point(aes(x = dataset$Level, y = dataset$Salary),
             colour = 'red') +
  geom_line(aes(x = x_grid, y = predict(regressor, newdata = data.frame(Level = x_grid))),
            colour = 'blue') +
  ggtitle('Truth or Bluff!! (SVR Model)') +
  xlab('Level') +
  ylab('Salary')

  