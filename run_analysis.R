#############################################################################################################
############################################################################################################# 
##                                                                                                         ##
## Coursera Getting and Cleaning Data Course Project                                                       ##
## Andrew Roberts                                                                                          ##
## January 26, 2015                                                                                        ##
##                                                                                                         ##
## run_analysis.R File Description:                                                                        ##
##                                                                                                         ##
## This script will perform the following steps on the UCI HAR Dataset downloaded from                     ## 
## https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip                  ##
## - Merge the training and the test sets to create one data set.                                          ##
## - Extract only the measurements on the mean and standard deviation for each measurement.                ##
## - Use descriptive activity names to name the activities in the data set                                 ##
## - Appropriately label the data set with descriptive activity names.                                     ##
## - Create a second, independent tidy data set with the average of each variable for each activity and    ##
##      each subject.                                                                                      ##
##                                                                                                         ##
#############################################################################################################
#############################################################################################################

###########
#  Setup  #
###########

##Initialize libraries
library(data.table)
library(dplyr)

##Set working directory to location of unzipped data files
setwd('./UCI HAR Dataset/')

######################################################################################
#  Read in datasets and select only desired variables (mean and standard deviation)  #
######################################################################################

##Read in features data frame to get labels for test/train dataset variables
features <- fread("features.txt",select=c(2),col.names = c("labels"))

##Determine which variables identify a mean or standard deviation (std)
varSub <- grep("mean\\(|std\\(", features$labels) 

##Create vector containing only labels for the subset of variables we want to keep (mean and standard deviation)
varLabelSub <- features[varSub,labels]

##Read in test and train measurement data SELECTING ONLY the variables IN varSub
test <- fread("./test/X_test.txt",select=varSub,col.names=varLabelSub) 
train <- fread("./train/X_train.txt",select=varSub,col.names=varLabelSub) 

##Read in test and train subject data
test_subject <- fread("./test/subject_test.txt",col.names=c("subjectID"))  
train_subject <- fread("./train/subject_train.txt",col.names=c("subjectID"))

##Read in activities dataset to get labels for activities
activities <- fread("activity_labels.txt",col.names=c("activity","ActivityDesc")) 

##Read in activity data for test and train
test_activities <- fread("./test/y_test.txt",col.names=c("activity")) 
train_activities <- fread("./train/y_train.txt",col.names=c("activity"))

#################################
#   Merge/Combine Data Frames   #
#################################

## Merge test and train data frames with subject and activity data
test_merge <- cbind(cbind(test_subject,test_activities),test) 
train_merge <- cbind(cbind(train_subject,train_activities),train)

## Concatenate test and train data frames
all <- rbind(test_merge,train_merge)

## Merge activity descriptions into all data frame
all_desc <- merge(all,activities,by="activity")
all_desc <- subset(all_desc,select=-activity) ## Drop "activity" column

###############################
#   Clean Up Variable Names   #
###############################

## Clean up variable names to make more descriptive
for (i in 1:length(names(all_desc))) {
       names(all_desc)[i] = gsub("\\(\\)","",names(all_desc)[i])
       names(all_desc)[i] = gsub("std","StDev",names(all_desc)[i])
       names(all_desc)[i] = gsub("mean","Mean",names(all_desc)[i])
       names(all_desc)[i] = gsub("^t","Time",names(all_desc)[i])
       names(all_desc)[i] = gsub("^f","Freq",names(all_desc)[i])
       names(all_desc)[i] = gsub("[Bb]ody[Bb]ody","Body",names(all_desc)[i])
       names(all_desc)[i] = gsub("Mag","Magnitude",names(all_desc)[i])
       names(all_desc)[i] = gsub("Acc","Accelerometer",names(all_desc)[i])
       names(all_desc)[i] = gsub("Gyro","Gyroscope",names(all_desc)[i])
       names(all_desc)[i] = gsub("-","",names(all_desc)[i])
}

#######################################################
#  Create Summary Data Frame and Write to Text File   #
#######################################################

## Create summary data frame of mean of each variable grouped by subject and activity
all_means <- aggregate(. ~ subjectID + ActivityDesc, all_desc, mean)

all_means <- all_means[order(all_means$subjectID,all_means$ActivityDesc),]

## Create "tidydata.txt" file with contents of all_means summary data frame
write.table(all_means, file="tidydata.txt",row.name=FALSE)