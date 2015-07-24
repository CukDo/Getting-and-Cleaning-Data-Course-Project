## Getting and Cleaning Data Course Project - Domagoj Ćuk

### Basic Description
Additional information about the variables, data and transformations used in the course project for Getting and Cleaning Data.

### Raw Data
A full description of the data used in this project can be found at [The UCI Machine Learning Repository](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)

[The source data for this project can be found here.](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)

### Data Set Description
The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain.

### Attribute Information
For each record in the dataset the following information was provided: 
1) Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration. 
2) Triaxial Angular velocity from the gyroscope. 
3) A 561-feature vector with time and frequency domain variables. 
4) Appropriate activity labels. 
5) Identification of the subject who did the experiment.

### 1. Merge the training and test data into a single data set, set labels
After setting the source directory for the files, read into tables the data located in
- activity_labels.txt
- features.txt
- X_train.txt
- y_train.txt
- subject_train.txt
- X_test.txt
- Y_test.txt
- subject_test.txt

Merge the train data, then merge the test data, finally merging the train and test data into a final data set.
Set the label for the merged data set from the features.txt in addtion to subjectID and activity ID.

## 2. Extract only the measurements on the mean and standard deviation for each measurement. 
Subset the final,merged, data set by only extracting columns containing the desired measurements (mean, standard deviation), and columns that identify the subject and activity.

## 3. Use descriptive activity names
Join the final, merged data set with the vector of activity labels in order to include descriptive activity names.

## 4. Appropriately label the data set with descriptive activity names.
Use of gsub function to replace excess patterns and to clean up and clarify the data labels.

## 5. Create a second, independent tidy data set with the average of each variable for each activity and each subject. 
Using the ddply function from the plyr package, a second, tidy, data set is produced that contains the average of each variable for each activity and subject.

