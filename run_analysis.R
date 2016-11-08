#Prepare some data 
setwd("~/Desktop/learning/assignment5/git_remote/GettingandCleaningDataCourseProject")
library(RCurl)
download.file(destfile = "dataset.zip","https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip",
              method="curl")
unzip("dataset.zip")

#1. Merges the training and the test sets to create one data set.
features <- read.table("UCI HAR Dataset/features.txt",header = FALSE, sep = " ")

## Read the train : subject, x, y
train_subject <- read.table("UCI HAR Dataset/train/subject_train.txt",header = FALSE,col.names = "subject")
train_x <- read.table("UCI HAR Dataset/train/X_train.txt",header = FALSE,col.names = features[,2])
train_y <- read.table("UCI HAR Dataset/train/y_train.txt",header = FALSE,col.names = "activity")

## Read the test:subject , x, y
test_subject <- read.table("UCI HAR Dataset/test/subject_test.txt",header = FALSE,col.names = "subject")
test_x <- read.table("UCI HAR Dataset/test/X_test.txt",header = FALSE,col.names = features[,2])
test_y <- read.table("UCI HAR Dataset/test/y_test.txt",header = FALSE,col.names = "activity")

## Merge the data
##One dataset 
train_dataSet <- cbind(train_y,train_subject,train_x)
test_dataSet <- cbind(test_y,test_subject,test_x)

dataSet <- rbind(train_dataSet,test_dataSet)

#2. Extracts only the measurements on the mean and standard deviation for each measurement.
## Find the mean and sdt column in features
cols_choose <- grep(("-mean\\(\\)|-std\\(\\)"),features[,2])

extracted_dataSet <-dataSet[,c(562,563,cols_choose)]

#3. Uses descriptive activity names to name the activities in the data set
## Read the activity 
activity_labels <- read.table("UCI HAR Dataset/activity_labels.txt")
dataSet[,"activity"] <- activity_labels[dataSet[,"activity"],2]

#4. Appropriately labels the data set with descriptive variable 
colNames <- names(dataSet)
colNames <-gsub("Acc", " Accelerometer", colNames)
colNames <-gsub("Gyro", " Gyroscope", colNames)
colNames <-gsub("Mag", " Magnitude", colNames)
colNames <-gsub("Jerk", " Jerk", colNames)
colNames <-gsub("^t", "Time", colNames)
colNames <-gsub("^f", "Frequency", colNames)
colNames <-gsub("mean[(][)]", "Mean", colNames)
colNames <-gsub("std[(][)]", "StandardDeviation", colNames)
colNames <-gsub("activity", "Activity", colNames)
colNames <-gsub("subjectId", "Subject.Id", colNames)
names(dataSet) <- make.names(colNames)

#5. From the data set in step 4, creates a second, independent tidy data set 
# with the average of each variable for each activity and each subject.
library(plyr)
dataset_tinyset<-aggregate(. ~subject + Activity, dataSet, mean)
dataset_tinyset<-dataset_tinyset[order(dataset_tinyset$subject,dataset_tinyset$Activity),]

write.table(dataset_tinyset, "tidy_dataset.txt",row.names = FALSE)    

