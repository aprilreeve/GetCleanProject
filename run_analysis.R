## Project - Getting and Cleaning Data
## April Reeve
##
## Read in zipped datasets
#fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
#zipfile <- "measured.activity.zip"
#download.file(fileUrl,destfile=zipfile)
unzip(zipfile,list=TRUE, exdir=".")
#unzip(zipfile,list=FALSE, exdir=".")
##
## Read in Activities - 6 Activities
Activities <- read.table("./UCI HAR Dataset/activity_labels.txt",header=FALSE,col.names=c("ActivityNum", "Activity"))
##
## Read in Features - 561 Column Headers
Features <- read.table("./UCI HAR Dataset/features.txt",header=FALSE,col.names=c("FeatureNum", "Feature"))
##
## Read in Train data - 7352 Observations of 561 variables
train.subject <- read.table("./UCI HAR Dataset/train/subject_train.txt", header=FALSE, col.names=("subjectNum"))
train.activity <- read.table("./UCI HAR Dataset/train/y_train.txt", header=FALSE, col.names=("ActivityNum"))
train.cols <- as.vector(Features$Feature)
train.data <- read.table("./UCI HAR Dataset/train/X_train.txt", header=FALSE, col.names=train.cols)
## Combine Train data into one labeled table - 7352 Observations of 564 variables
train.data$subjectNum <- as.factor(train.subject$subjectNum)
train.data$ActivityNum <- as.factor(train.activity$ActivityNum)
labeled.train.data <- merge(Activities,train.data,Activities,by.x="ActivityNum",by.y="ActivityNum")
##
## Read in Test data - 2947 Observations of 561 variables
test.subject <- read.table("./UCI HAR Dataset/test/subject_test.txt", header=FALSE, col.names=("subjectNum"))
test.activity <- read.table("./UCI HAR Dataset/test/y_test.txt", header=FALSE, col.names=("ActivityNum"))
test.cols <- as.vector(Features$Feature)
test.data <- read.table("./UCI HAR Dataset/test/X_test.txt", header=FALSE, col.names=test.cols)
## Combine Test data into one labeled table - 2947 observations of 564 variables
test.data$subjectNum <- as.factor(test.subject$subjectNum)
test.data$ActivityNum <- as.factor(test.activity$ActivityNum)
labeled.test.data <- merge(Activities,test.data,Activities,by.x="ActivityNum",by.y="ActivityNum")
##
## Combine train and test data to one - 10299 observations of 564 variables
combined.data <- rbind(labeled.train.data, labeled.test.data)
##
## Extract only the measurements on the mean and standard deviation
column.names <- names(combined.data)
# Columns - 85 variables - 2 factors, 83 measures
# 2 Activity, 
# 3:8 tBodyAcc, 43:48 tGravityAcc, 83:88 tBodyAccJerk, 123:128 tBodyGyro, 163:168 tBodyGyroJerk,
# 203:204 tBodyAccMag, 216:217 tGravityAccMag, 229:230 tBodyAccJerkMag, 242:243 tBodyGyroMag, 
# 255:256 tBodyGyroJerkMag, fBodyAcc 268:273, fBodyAcc.meanFreq 296:298, 347:352 fBodyAccJerk, 
# 375:377 fBodyAccJerk.meanFreq, 426:431 fBodyGyro, 454:456 fBodyGyro.meanFreq, 505:506 fBodyAccMag, 
# 515 fBodyAccMag.meanFreq, 531:532 fBodyBodyGyroMag, 541 fBodyBodyGyroMag.meanFreq, 
# 544:545 fBodyBodyGyroJerkMag, 554 fBodyBodyGyroJerkMag.meanFreq, 557:563 Assorted, 
# 564 subjectNum
extracted.data <- select(combined.data, Activity, 
                         3:8, 43:48, 83:88, 123:128, 163:168,
                         203:204, 216:217, 229:230, 242:243, 255:256, 
                         268:273, 296:298, 347:352, 375:377, 426:431, 
                         454:456, 505:506, 515, 531:532, 541, 544:545,
                         554, 557:563, subjectNum)
##
#install.packages("dplyr")
#library(dplyr)
##labeled.train.data <- arrange(inner_join(Activities,train.data),ActivityNum)
##
