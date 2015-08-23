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

 1. Loads the various data files
 2. Add column names to x_test and x_train datasets by using Features dataset
 3. Add column names to subject_test, subject_train
 4. Add column names to y_test, y_train
 5. Combine (rbind) x_test, x_train
 6. Combine (rbind) y_test, y_train
 7. Combine (rbind) subject_test, subject_train
 8. Combine (cbind) ycomb, xcomb
 9. Combine (cbind) subcomb, all
 10. Merge the "all" dataset with activity_labels by joining on activity_id
 11. Load dplyr library
 12. Create vector s1, to get all the column names that contain "mean" values
 13. Create vector s2, to get all the column names that contain "std" values
 14. Create vector s3, to add and sort s1 and s2
 15. Using the 3 vectors select only those columns that are needed for final submission
 16. Group by activity_id and subject_id
 17. Summarize to get averages of all the mean and std columns to create the final dataset for submission

 If all goes well the script should create the following output data file:
projectsubmission.txt