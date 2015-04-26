#Code Book for Get and Clean Data Project
## by April Reeve

### Output File
The output file "measured.activity.csv" contains 10299 Observations with 2 Factors and 83 measures for each Observation

Factors:
* Activity - description of one of 6 possible activities: WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING
* subjectNum - identifier of the Subject studied; integer between 1 and 30

Mean and standard deviation measures for each of these signals
* tBodyAcc-XYZ
* tGravityAcc-XYZ
* tBodyAccJerk-XYZ
* tBodyGyro-XYZ
* tBodyGyroJerk-XYZ
* tBodyAccMag
* tGravityAccMag
* tBodyAccJerkMag
* tBodyGyroMag
* tBodyGyroJerkMag
* fBodyAcc-XYZ
* fBodyAccJerk-XYZ
* fBodyGyro-XYZ
* fBodyAccMag
* fBodyAccJerkMag
* fBodyGyroMag
* fBodyGyroJerkMag

Plus additional mean measures:
* gravityMean
* tBodyAccMean
* tBodyAccJerkMean
* tBodyGyroMean
* tBodyGyroJerkMean


### Input Files
The input data files were received in a zip file from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
This zip file contained directories with 2947 observations of test data and 7352 observations of train data 
plus additional files describing the input.

The test and train data each contained 561 measure variables with the identification of the subject and activity of each observation found on separate files.

### Transformation
* Descriptive variable names (Column headings) were added to the Test and Train data, idenifying each measure, using the list in the features.txt file
* Additional Columns indicating the Subject and Activity of each observation were added to / combined with the Test and Train data
* A description of the Activity of each observation was added to the Test and Train data by merging the observations files with the list in the activity_labels.txt file
* The Test and Train data sets were merged into one table using the rbind function
* Mean and standard deviation measurements as well as the Subject and Activity columns were extracted using the select function