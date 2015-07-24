Script Description
==================
run_analysis.R is an R function which can be run in R Studio from the working directory. 
To run the code type run_analysis()

Function steps
1. Downloads the source data zip file(if it has not already been run)
2. Unzips the file into the working directory
3. Creates data tables for the files listed below in the code book
4. Aggregates all test data, eg variables, subjects and activities into a single data set.
5. Aggregates all training data, eg variables, subjects and activities into a single data set.
6. Combines all training with all testing data.
7. Removes "BodyBody" values that are not referenced in the experiment. 
8. Removes all variables that are not mean or standard deviation calculations.
9. Changes the activity values to named activities, eg WALKING, SITTING, etc.
10. Renames the columns and adds description.
11. Groups the data by individual (subject) and activity to give mean values.
12. Outputs the results into a tidy summary file, saved as a .txt file that writes into the working directory.


Code Book 
=================
Original data: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

The test and training data have been aggregated. Descriptive data files have been also aggregated. Files aggregated to derive the data:
UCI HAR Dataset/features.txt
UCI HAR Dataset/test/X_test.txt
UCI HAR Dataset/test/y_test.txt
UCI HAR Dataset/test/subject_test.txt
UCI HAR Dataset/train/X_train.txt
UCI HAR Dataset/train/y_train.txt
UCI HAR Dataset/train/subject_train.txt

The variables selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 
Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 
Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 
These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

tBodyAcc-XYZ
tGravityAcc-XYZ
tBodyAccJerk-XYZ
tBodyGyro-XYZ
tBodyGyroJerk-XYZ
tBodyAccMag
tGravityAccMag
tBodyAccJerkMag
tBodyGyroMag
tBodyGyroJerkMag
fBodyAcc-XYZ
fBodyAccJerk-XYZ
fBodyGyro-XYZ
fBodyAccMag
fBodyAccJerkMag
fBodyGyroMag
fBodyGyroJerkMag

The set of variables that are included from these signals are: 
mean(): Mean value
std(): Standard deviation

PLEASE NOTE: additional variables that are not mentioned in the original feature descriptions (UCI HAR Dataset/features_info.txt)  have been removed:
fBodyBodyAccJerkMag
fBodyBodyGyroMag
fBodyBodyGyroJerkMag

The file tidy.txt is a grouped summary (by subject (30) and by activity (6 types). It gives the mean value for each variable for the particular grouping (180 in total).

The variable names have been expanded into full form descriptive names in the tidy.txt file.

