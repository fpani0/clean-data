# Week 4 Cleaning Data Assignment

This submission explains how the run_analysis.R works in accordance to the instructions per Coursera week 4 assignment for Cleaning Data.  The script is broken down into 5 parts as per the instructions.  

**Input** The input for the script is the dataset as downloaded from the website https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip and extracted as is in the work directory.

**Output** The script returns a file called question5-output.txt which is the output from question #5 of the assignment.  It will also return the following along the states. 

- **Question 1** Merges the training and the test sets to create one data set.  Returns dataframe mergeData with resuts.
- **Question 2** Extract only the measurements on the mean and standard deviation for each measurement. Returns dataframe extracttData
- **Question 3** Uses descriptive activity names to name the activities in the data set.  Writes descriptive activity names to extractData.
- **Question 4** Appropriately labels the data set with descriptive variable names.  Writes descriptive variable names to extractData.
- **Question 5** From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.  Returns extractData.
