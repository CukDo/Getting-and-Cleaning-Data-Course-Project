# Getting and Cleaning Data Course Project - Domagoj Ćuk

Repo for the submission of the course project for the Johns Hopkins Getting and Cleaning Data course.

### Overview
The aim of the project was to demonstrate the ability to collect data then clean it to produce a tidy data set that can be used for subsequent
analysis. The full description of the data used in the project can be found at [The UCI Machine Learning Repository](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)

[The source data for this project can be found here.](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)

### Save data location
On line 5 of run_analysis.R the path of the working directory that contains the source file is set to "C:/Rdata". 
If you wish to save the source files to a different location, modify the setwd command on the aforementioned line to refect your save location.  

### Project Summary
The following is a summarised description of the project instructions:

Create a R script called run_analysis.R that does the following: 
1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement. 
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive activity names. 
5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject. 

### Additional Information
You can find additional information about the variables, data and transformations in the CodeBook.MD file.

