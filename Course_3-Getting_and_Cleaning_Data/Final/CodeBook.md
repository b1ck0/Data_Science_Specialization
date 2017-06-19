# Description of the provided data set

The data set is divided into two sub-sets:
* training data set - 7352 observations
* testing data set - 2947 observations

## Data Set Structure

* **activity_labels.txt** - data frame containing classification of the factor variable describing the activity into y_test.txt/y_train.txt

* **features.txt** - data frame containing the labels for all variables written in X_test.txt/X_train.txt

* **subject_test.txt/subject_train.txt** - data frame containing subject identifier corresponding to the data written in X_test.txt/X_train.txt

* **X_test.txt/X_train.txt** - data frame containing all measurment data

* **y_test.txt/y_train.txt** - data frame containing activity identifier corresponding to the data written in X_test.txt/X_train.txt

# Data Transformations

The tidy data set contains 10299 observations (combines the training and test data sets) with 88 variables. The description of the variables is as follows:
* activity (Factor w/ 6 levels) - identifying the activity for each observation (extracted from **y_test.txt/y_train.txt**) 
* subject (Factor w/ 30 levels) - identifuing the subject for each observation (extracted from **subject_test.txt/subject_train.txt**) 
* 43 mean variables - all mean varaibles (extracted from **X_test.txt/X_train.txt**)
* 43 strandard deviation variables - all standard deviation variables (extracted from **X_test.txt/X_train.txt**) 
