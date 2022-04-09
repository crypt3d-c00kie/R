# Importing Database
dataset = read.csv("Admission_Predict.csv")
View(dataset)

# Data Processing
gre = dataset[,2] #considers all the row and the second column
coa = dataset[,9]
data = data.frame(gre,coa)
View(data)

# Importing library
library(caTools)

# Generating Random Numbers
set.seed(6969)

# Data Split
split = sample.split(data$coa, SplitRatio = 0.8)
View(split)

# Training and Testing Data
train = subset(data, split= TRUE)
test = subset(data, split = FALSE)

# Regression
regressor = lm(coa-gre, data=train) #lm = linear modelling (~) y=mx+c

# Predict
y_pred = predict(regressor, newdata = test)

# Plot
plot(test$gre, test$coa, type = 'p', col='blue', xlab = 'GRE', ylab = 'COA')
lines(test$gre, y_pred, type = 'o', col='red')

