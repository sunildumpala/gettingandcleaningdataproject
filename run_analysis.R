run_analysis <- function(directory) {
  ## 'directory' is a character vector of length 1 indicating
  ## the location of the data files
  ## Script returns the dataframe for final submission of step 5 in the assignment - "From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject."
  
  ## Code performs the following actions:
  ## Loads the various data files
  ## Add column names to x_test and x_train datasets by using Features dataset
  ## Add column names to subject_test, subject_train
  ## Add column names to y_test, y_train
  ## 
  ## Combine (rbind) x_test, x_train
  ## Combine (rbind) y_test, y_train
  ## Combine (rbind) subject_test, subject_train
  ## 
  ## Combine (cbind) ycomb, xcomb
  ## Combine (cbind) subcomb, all
  ##
  ## Merge the "all" dataset with activity_labels by joining on activity_id
  ##
  ## Load dplyr library
  ##
  ## Create vector s1, to get all the column names that contain "mean" values
  ## Create vector s2, to get all the column names that contain "std" values
  ## Create vector s3, to add and sort s1 and s2
  ##
  ## Using the 3 vectors select only those columns that are needed for final submission
  ## Group by activity_id and subject_id
  ## Summarize to get averages of all the mean and std columns to create the final dataset for submission
  ##
  old.dir <- getwd()
  setwd(directory[1])
  listOfFiles <- dir()
  data <- directory[1]
  print (data)
  subject_test <- read.table(paste(data, "/subject_test.txt", sep = ""))
  subject_train <- read.table(paste(data,"/subject_train.txt", sep = ""))
  x_test <- read.table(paste(data, "/X_test.txt", sep = ""))
  x_train <- read.table(paste(data, "/x_train.txt", sep = ""))
  y_test <- read.table(paste(data, "/y_test.txt", sep = ""))
  y_train <- read.table(paste(data, "/y_train.txt", sep = ""))
  activity_labels <- read.table(paste(data, "/activity_labels.txt", sep = ""))
  features <- read.table(paste(data, "/features.txt", sep = ""))
  
  #print(dim(subject_test))
  #print(dim(subject_train))
  #print(dim(x_test))
  #print(dim(x_train))
  #print(dim(y_test))
  #print(dim(y_train))
  #print(dim(activity_labels))
  #print(dim(features))
  
  names(features) <- c("id", "featurename")
  names(x_test) <- features$featurename
  names(x_train) <- features$featurename
  names(subject_test) <- c("subject_id")
  names(subject_train) <- c("subject_id")
  names(y_test) <- c("activity_id")
  names(y_train) <- c("activity_id")
  names(activity_labels) <- c("activity_id", "activity_desc")
  
  xcomb <- rbind(x_test, x_train)
  ycomb <- rbind(y_test, y_train)
  subcomb <- rbind(subject_test, subject_train)
  all <- cbind(ycomb, xcomb)
  all <- cbind(subcomb, all)
  print(dim(all))
  allwithactivitylabel <- merge(all, activity_labels, by="activity_id")
  print(dim(allwithactivitylabel))
  library(dplyr)
  
  s1 <- grep("mean", names(allwithactivitylabel))
  s2 <- grep("std", names(allwithactivitylabel))
  s3 <- sort(c(1,2,s1,s2,564))
  
  finaltab <- allwithactivitylabel[,s3]
  
  group_activity_subject <- group_by(finaltab, activity_id, subject_id)
  
  final_summarized_tab <- summarize(group_activity_subject, avgtBodyAccmeanX=mean(`tBodyAcc-mean()-X`),avgtBodyAccmeanY=mean(`tBodyAcc-mean()-Y`),avgtBodyAccmeanZ=mean(`tBodyAcc-mean()-Z`),avgtBodyAccstdX=mean(`tBodyAcc-std()-X`),avgtBodyAccstdY=mean(`tBodyAcc-std()-Y`),avgtBodyAccstdZ=mean(`tBodyAcc-std()-Z`),avgtGravityAccmeanX=mean(`tGravityAcc-mean()-X`),avgtGravityAccmeanY=mean(`tGravityAcc-mean()-Y`),avgtGravityAccmeanZ=mean(`tGravityAcc-mean()-Z`),avgtGravityAccstdX=mean(`tGravityAcc-std()-X`),avgtGravityAccstdY=mean(`tGravityAcc-std()-Y`),avgtGravityAccstdZ=mean(`tGravityAcc-std()-Z`),avgtBodyAccJerkmeanX=mean(`tBodyAccJerk-mean()-X`),avgtBodyAccJerkmeanY=mean(`tBodyAccJerk-mean()-Y`),avgtBodyAccJerkmeanZ=mean(`tBodyAccJerk-mean()-Z`),avgtBodyAccJerkstdX=mean(`tBodyAccJerk-std()-X`),avgtBodyAccJerkstdY=mean(`tBodyAccJerk-std()-Y`),avgtBodyAccJerkstdZ=mean(`tBodyAccJerk-std()-Z`),avgtBodyGyromeanX=mean(`tBodyGyro-mean()-X`),avgtBodyGyromeanY=mean(`tBodyGyro-mean()-Y`),avgtBodyGyromeanZ=mean(`tBodyGyro-mean()-Z`),avgtBodyGyrostdX=mean(`tBodyGyro-std()-X`),avgtBodyGyrostdY=mean(`tBodyGyro-std()-Y`),avgtBodyGyrostdZ=mean(`tBodyGyro-std()-Z`),avgtBodyGyroJerkmeanX=mean(`tBodyGyroJerk-mean()-X`),avgtBodyGyroJerkmeanY=mean(`tBodyGyroJerk-mean()-Y`),avgtBodyGyroJerkmeanZ=mean(`tBodyGyroJerk-mean()-Z`),avgtBodyGyroJerkstdX=mean(`tBodyGyroJerk-std()-X`),avgtBodyGyroJerkstdY=mean(`tBodyGyroJerk-std()-Y`),avgtBodyGyroJerkstdZ=mean(`tBodyGyroJerk-std()-Z`),avgtBodyAccMagmean=mean(`tBodyAccMag-mean()`),avgtBodyAccMagstd=mean(`tBodyAccMag-std()`),avgtGravityAccMagmean=mean(`tGravityAccMag-mean()`),avgtGravityAccMagstd=mean(`tGravityAccMag-std()`),avgtBodyAccJerkMagmean=mean(`tBodyAccJerkMag-mean()`),avgtBodyAccJerkMagstd=mean(`tBodyAccJerkMag-std()`),avgtBodyGyroMagmean=mean(`tBodyGyroMag-mean()`),avgtBodyGyroMagstd=mean(`tBodyGyroMag-std()`),avgtBodyGyroJerkMagmean=mean(`tBodyGyroJerkMag-mean()`),avgtBodyGyroJerkMagstd=mean(`tBodyGyroJerkMag-std()`),avgfBodyAccmeanX=mean(`fBodyAcc-mean()-X`),avgfBodyAccmeanY=mean(`fBodyAcc-mean()-Y`),avgfBodyAccmeanZ=mean(`fBodyAcc-mean()-Z`),avgfBodyAccstdX=mean(`fBodyAcc-std()-X`),avgfBodyAccstdY=mean(`fBodyAcc-std()-Y`),avgfBodyAccstdZ=mean(`fBodyAcc-std()-Z`),avgfBodyAccmeanFreqX=mean(`fBodyAcc-meanFreq()-X`),avgfBodyAccmeanFreqY=mean(`fBodyAcc-meanFreq()-Y`),avgfBodyAccmeanFreqZ=mean(`fBodyAcc-meanFreq()-Z`),avgfBodyAccJerkmeanX=mean(`fBodyAccJerk-mean()-X`),avgfBodyAccJerkmeanY=mean(`fBodyAccJerk-mean()-Y`),avgfBodyAccJerkmeanZ=mean(`fBodyAccJerk-mean()-Z`),avgfBodyAccJerkstdX=mean(`fBodyAccJerk-std()-X`),avgfBodyAccJerkstdY=mean(`fBodyAccJerk-std()-Y`),avgfBodyAccJerkstdZ=mean(`fBodyAccJerk-std()-Z`),avgfBodyAccJerkmeanFreqX=mean(`fBodyAccJerk-meanFreq()-X`),avgfBodyAccJerkmeanFreqY=mean(`fBodyAccJerk-meanFreq()-Y`),avgfBodyAccJerkmeanFreqZ=mean(`fBodyAccJerk-meanFreq()-Z`),avgfBodyGyromeanX=mean(`fBodyGyro-mean()-X`),avgfBodyGyromeanY=mean(`fBodyGyro-mean()-Y`),avgfBodyGyromeanZ=mean(`fBodyGyro-mean()-Z`),avgfBodyGyrostdX=mean(`fBodyGyro-std()-X`),avgfBodyGyrostdY=mean(`fBodyGyro-std()-Y`),avgfBodyGyrostdZ=mean(`fBodyGyro-std()-Z`),avgfBodyGyromeanFreqX=mean(`fBodyGyro-meanFreq()-X`),avgfBodyGyromeanFreqY=mean(`fBodyGyro-meanFreq()-Y`),avgfBodyGyromeanFreqZ=mean(`fBodyGyro-meanFreq()-Z`),avgfBodyAccMagmean=mean(`fBodyAccMag-mean()`),avgfBodyAccMagstd=mean(`fBodyAccMag-std()`),avgfBodyAccMagmeanFreq=mean(`fBodyAccMag-meanFreq()`),avgfBodyBodyAccJerkMagmean=mean(`fBodyBodyAccJerkMag-mean()`),avgfBodyBodyAccJerkMagstd=mean(`fBodyBodyAccJerkMag-std()`),avgfBodyBodyAccJerkMagmeanFreq=mean(`fBodyBodyAccJerkMag-meanFreq()`),avgfBodyBodyGyroMagmean=mean(`fBodyBodyGyroMag-mean()`),avgfBodyBodyGyroMagstd=mean(`fBodyBodyGyroMag-std()`),avgfBodyBodyGyroMagmeanFreq=mean(`fBodyBodyGyroMag-meanFreq()`),avgfBodyBodyGyroJerkMagmean=mean(`fBodyBodyGyroJerkMag-mean()`),avgfBodyBodyGyroJerkMagstd=mean(`fBodyBodyGyroJerkMag-std()`),avgfBodyBodyGyroJerkMagmeanFreq=mean(`fBodyBodyGyroJerkMag-meanFreq()`))
  
  
  write.table(final_summarized_tab, row.name = FALSE, file = "projectsubmission.txt")
  setwd(old.dir)
  final_summarized_tab
}