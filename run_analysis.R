run_analysis <- function(directory) {
  ## 'directory' is a character vector of length 1 indicating
  ## the location of the data files
  
  
  ## Return a data frame of the form:
  ## id nobs
  ## 1  117
  ## 2  1041
  ## ...
  ## where 'id' is the monitor ID number and 'nobs' is the
  ## number of complete cases
  
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
  print(dim(subject_test))
  print(dim(subject_train))
  print(dim(x_test))
  print(dim(x_train))
  print(dim(y_test))
  print(dim(y_train))
  print(dim(activity_labels))
  print(dim(features))
  setwd(old.dir)
}