# gettingandcleaningdataproject

 The run_analysis script was created for Getting and Cleaning data course's final project. The script takes the location of data files as the input
 Sample call looks as follows:

filedir <- "/Users/user/CourseProject/gettingandcleaningdataproject/data"
run_analysis(filedir)

 data directory contains the following data files

activity_labels.txt
features.txt
subject_test.txt
subject_train.txt
X_test.txt
X_train.txt
y_test.txt
y_train.txt

 The above data files are available at this link provided in the project page: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

 'directory' is a character vector of length 1 indicating
 the location of the data files
 Script returns the dataframe for final submission of step 5 in the assignment - "From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject."

 Code performs the following actions:
 Loads the various data files
 Add column names to x_test and x_train datasets by using Features dataset
 Add column names to subject_test, subject_train
 Add column names to y_test, y_train
 
 Combine (rbind) x_test, x_train
 Combine (rbind) y_test, y_train
 Combine (rbind) subject_test, subject_train
 
 Combine (cbind) ycomb, xcomb
 Combine (cbind) subcomb, all

 Merge the "all" dataset with activity_labels by joining on activity_id

 Load dplyr library

 Create vector s1, to get all the column names that contain "mean" values
 Create vector s2, to get all the column names that contain "std" values
 Create vector s3, to add and sort s1 and s2

 Using the 3 vectors select only those columns that are needed for final submission
 Group by activity_id and subject_id
 Summarize to get averages of all the mean and std columns to create the final dataset for submission

 If all goes well the script should create the following output data file:
projectsubmission.txt