## Coursera - Data Science Specialization
## Getting and Cleaning Data Module
## Peer-graded Assignment: Getting and Cleaning Data Course Project
## Vasil Yordanov - 19.05.2017

## This assingment collects data from several different files and combines it into a single data frame
## which can be later used for statistical analysis

## setting the project folder
setwd("~/GitHub/GettingCleaningData_final")

## setting the paths of the files
testData_Path <- "data/UCI HAR Dataset/test/X_test.txt"
testSubject_Path <- "data/UCI HAR Dataset/test/subject_test.txt"
testActivity_Path <- "data/UCI HAR Dataset/test/y_test.txt"

trainData_Path <- "data/UCI HAR Dataset/train/X_train.txt"
trainSubject_Path <- "data/UCI HAR Dataset/train/subject_train.txt"
trainActivity_Path <- "data/UCI HAR Dataset/train/y_train.txt"

columLabes_Path <- "data/UCI HAR Dataset/features.txt"
activityLabels_Path <- "data/UCI HAR Dataset/activity_labels.txt"

## reading and assigning the data
columnLabes <- as.character(read.table(columLabes_Path, sep = " ", header = FALSE)[,2])

## reading and combining all variables for the train data
trainData_Frame <- read.table(trainData_Path, header = FALSE, col.names = columnLabes)
trainSubject <- read.table(trainSubject_Path, header = FALSE, col.names = c('subject'), colClasses = "factor")
trainActivity <- read.table(trainActivity_Path, header = FALSE, col.names = c('activity'), colClasses = "factor")
trainData_Frame <- cbind(trainData_Frame, trainSubject, trainActivity)

## reading and combining all variables for the test data
testData_Frame <- read.table(testData_Path, header = FALSE, col.names = columnLabes)
testSubject <- read.table(testSubject_Path, header = FALSE, col.names = c('subject'), colClasses = "factor")
testActivity <- read.table(testActivity_Path, header = FALSE, col.names = c('activity'), colClasses = "factor")
testData_Frame <- cbind(testData_Frame, testSubject, testActivity)

## binding both data frames
Data_Frame <- rbind(trainData_Frame, testData_Frame)

## loading external package
library(dplyr)

## converting the standard data frame into dplyr data frame
Data_Frame <- tbl_df(Data_Frame)

## droping the variables we do not need (we keep only mean, std, activity and subject)
Data_Frame <- select(Data_Frame, contains("mean"), contains("std"), contains("activity"), contains("subject"))

## creating new data frame in which I have calculated the average for each variable for each activity and each subject
second_Data_Frame <- Data_Frame %>% 
                     group_by(activity, subject) %>%
                     summarise_each(funs(mean))

## reading the "human friendly" labels of the activities
activityLabels <- as.character(read.table(activityLabels_Path, header = FALSE)[,2])

## substituting the levels of the factor variable activity with it's "human friendly" labels
for(i in 1:6){
    levels(second_Data_Frame$activity) <- sub(as.character(i), activityLabels[i], levels(second_Data_Frame$activity))
}

## writing the second data frame into a text file
resultDataFramePath <- "data/result.txt"
write.table(second_Data_Frame, resultDataFramePath, row.name = FALSE)