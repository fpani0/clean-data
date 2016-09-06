library(dplyr)


##  QUESTION #1 - Merge the training and the test sets to create one data set (result is mergeData)
## load data into frames
  X_test <- read.table("UCI HAR Dataset/test/X_test.txt")
  X_train <- read.table("UCI HAR Dataset/train/X_train.txt")

  mergeData <- rbind(X_test, X_train)

##  QUESTION #2 - Extract only the measurements on the mean and standard deviation for each measurement (result is extractData)
  features <- read.table("UCI HAR Dataset/features.txt")
  i <- grep("mean|std", features$V2)
  extractData <- mergeData[, i]


## QUESTION #3 - Uses descriptive activity names to name the activities in the data set
  activity_labels <- read.table("UCI HAR Dataset/activity_labels.txt") 
  y_test <- read.table("UCI HAR Dataset/test/y_test.txt")
  y_train <- read.table("UCI HAR Dataset/train/y_train.txt")
  ymerge <- rbind(y_test, y_train)
  activityId <- activity_labels$V2[ymerge$V1[]]
  extractData <- cbind(activityId = activityId, extractData)

## QUESTION #4 - Appropriately labels the data set with descriptive variable names. 
   k <- 1
   for (j in i) {
     k <- k + 1
     pattern <- gsub("[()]", "", features$V2[j])
     pattern <- gsub("-", "", pattern)
     pattern <- gsub("std", "Std", pattern)
     pattern <- gsub("mean", "Mean", pattern)
     pattern <- gsub(",", "", pattern)
     colnames(extractData)[k] <- pattern
   }

## QUESTION #5 - From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
  subject_test <- read.table("UCI HAR Dataset/test/subject_test.txt")
  subject_train <- read.table("UCI HAR Dataset/train/subject_train.txt")
  subject_merge <- rbind(subject_test, subject_train)
  extractData <- cbind(subjectId = subject_merge$V1, extractData)


## Add extra columns for subjectId for the person, activityId for activity code for what is being measured and dataType, the test or train data
   dataTypeList <- rep("test",nrow(X_test))
   X_test <- cbind(subjectId = subject_test$V1, activityId = y_test$V1, dataType = dataTypeList, X_test)
   dataTypeList <- rep("train",nrow(X_train))
   X_train <- cbind(subjectId = subject_train$V1, activityId = y_train$V1, dataType = dataTypeList, X_train)
   
## Return average for subject and then activity
   library(data.table)
   mavg <- setDT(extractData)[, lapply(.SD, mean), by=.(subjectId, activityId), .SDcols=extractData[, 3:81]]
   write.table(mavg, 'question5-output.txt', row.name=FALSE)
   setDF(mavg) # convert back to dataframe

