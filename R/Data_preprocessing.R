#importing data set

dataSet<-read.csv('Data.csv')
View(dataSet)

###############################
#Nan values handling

#age and salary columns are observed to have nan values
#below code checks whether age is nan or not and if nan then replaces with mean of the dataset

#age
dataSet$Age = ifelse(is.na(dataSet$Age),
                    ave(dataSet$Age, FUN = function(x) mean(x, na.rm = TRUE)),
                    dataSet$Age)

#salary
dataSet$Salary = ifelse(is.na(dataSet$Salary),
                     ave(dataSet$Salary, FUN = function(x) mean(x, na.rm = TRUE)),
                     dataSet$Salary)

#the nan values are replaced now



################################
#categorical encoding

#just like python this is supposed to be done where categorical classification helps us to properly perform operation on data
#factor() converts our data to categorical data

dataSet$Country  = factor(dataSet$Country, levels = c('France', 'Spain', 'Germany'),
                          labels = c(1,2,3))


dataSet$Purchased  = factor(dataSet$Purchased, levels = c('Yes', 'No'),
                          labels = c(1,0))



################################
#splitting data set
install.packages('caTools')
library(caTools)
set.seed(10)
split = sample.split(dataSet$Purchased, SplitRatio = 0.8)

#over here 'TRUE' in split indicates that observation goes in training set
#'FALSE' means observation in testing set
train_set = subset(dataSet, split == TRUE)
test_set = subset(dataSet, split == FALSE)
#splitting data set where the split values help to properly split

View(train_set)
View(test_set)


##################################
#feature scaling