# Polynomial Regression

# Data Preprocessing
dataset = read.csv('Position_Salaries.csv')
dataset = dataset[2:3]

# No need for train and test split
# No need for feature scaling

# Fitting linear model to data
l_reg = lm(formula = Salary ~ .,
           data = dataset)

# Fitting polynomial regresssion to data
dataset$Level2 = (dataset$Level)^2
dataset$Level3 = (dataset$Level)^3
dataset$Level4 = (dataset$Level)^4
dataset$Level5 = (dataset$Level)^5
p_reg = lm(formula = Salary ~ .,
           data = dataset)

# Visualising the Linear Regression
library(ggplot2)
ggplot() +
  geom_point(aes(x = dataset$Level, y = dataset$Salary),
             colour = 'red') + 
  geom_line(aes(x = dataset$Level, y = predict(l_reg, newdata = dataset)),
            colour = 'blue') +
  ggtitle('Truth oe Bluff(Linear Regression)') +
  xlab('Level') +
  ylab('Salary')
  

# Visualising the polynomial Regression
ggplot() +
  geom_point(aes(x = dataset$Level, y = dataset$Salary),
             colour = 'red') + 
  geom_line(aes(x = dataset$Level, y = predict(p_reg, newdata = dataset)),
            colour = 'blue') +
  ggtitle('Truth oe Bluff(polynomial Regression)') +
  xlab('Level') +
  ylab('Salary')

# Predicting value with Linear Regresson
l_pred = predict(l_reg, data.frame(Level = 6.5))

# Predicting value with polynomial Regresson
p_pred = predict(p_reg, data.frame(Level = 6.5,
                                   Level2 = 6.5^2,
                                   Level3 = 6.5^3,
                                   Level4 = 6.5^4,
                                   Level5 = 6.5^5))