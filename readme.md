#run_analysis.R

##Background
This script is written to satisfy the course project for the Getting and Cleaning Data course on Coursera.

##Assignment
Create one R script called run_analysis.R that does the following:
* Merges the training and the test sets to create one data set.
* Extracts only the measurements on the mean and standard deviation for each measurement.
* Uses descriptive activity names to name the activities in the data set
* Appropriately labels the data set with descriptive variable names.
* Creates a second, independent tidy data set with the average of each variable for each activity and each subject.

##Data
The data for this assignment can be downloaded at:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

##Script Description
1. The script initiates the packages that will be used (data.table and dplyr).
2. The script allows the user to change the working directory to the directory in which the data files were unzipped.
3. The script reads in the second column of data from features.txt from `features.txt` and labels it names it `labels`.
4. The script selects only the mean and standard deviation variables from the features vector.
5. The script reads in the measurement data from `X_test.txt` and `X_train.txt` files, selecting only the columns with the variables identified in step 4.
6. The script reads in the subject data from `subject_test.txt` and `subject_train.txt`.
7. The script reads in the activity descriptions from `activity_labels.txt`.
8. The script reads in the activity data from `y_test.txt` and `y_train.txt`.
9. The script merges the subject, activity, and measurement data for both the test and train data.
10. The script appends the train data to the test data to create one data frame.
11. The script merges the activity descriptions into the data frame and drops the activity column.
12. The script cleans up the variable names to make them more descriptive.
13. The script creates a new data frame with the average of each variable for each activity and each subject.
14. The script sorts the new data frame by subject ID and activity description.
15. The script write `tidydata.txt`, a file containing the new summary tidy data set.