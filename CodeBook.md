#CodeBook

## The Original Dataset

Human Activity Recognition Using Smartphones Dataset
Version 1.0

The full description is available at http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones


## Study Desing

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. See 'features_info.txt' for more details. 

For each record it is provided:

- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
- Triaxial Angular velocity from the gyroscope. 
- A 561-feature vector with time and frequency domain variables. 
- Its activity label. 
- An identifier of the subject who carried out the experiment.

## Feature Selection 

The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

tBodyAcc-XYZ
tGravityAcc-XYZs
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

Features are normalized and bounded within [-1,1]

The original dataset included set of variables for these signals, but for the course project only following were selected:

- mean(): Mean value
- std(): Standard deviation

## CodeBook

For the purposes of the course project of Getting and Cleaning data the variables were selected and renamed and the result was summarized by calculating means for each variable by subject and activity. Renaming of the features consisted of following replacements:

- mean -> Mean
- std -> STD 
- Acc -> Acceleration
- Mag -> Magnitude
- BodyBody -> Body (to fix duplicate Body in certain feature names)
- Removal of -, ( and )

The resulting dataset includes 180 observations (30 subjects x 6 activity types) of 68 variables

Variable | Description
-------- | -----------
subject | subject id, between 1 and 30
activity | activity type. Values: WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING
tBodyAccelerationMeanX | Means of corresponding variables in the original data, values are normalized to be between -1 and 1
tBodyAccelerationMeanY |
tBodyAccelerationMeanZ |
tBodyAccelerationStdX |
tBodyAccelerationStdY |
tBodyAccelerationStdZ |
tGravityAccelerationMeanX |
tGravityAccelerationMeanY |
tGravityAccelerationMeanZ |
tGravityAccelerationStdX |
tGravityAccelerationStdY |
tGravityAccelerationStdZ |
tBodyAccelerationJerkMeanX |
tBodyAccelerationJerkMeanY |
tBodyAccelerationJerkMeanZ |
tBodyAccelerationJerkStdX |
tBodyAccelerationJerkStdY |
tBodyAccelerationJerkStdZ |
tBodyGyroMeanX |
tBodyGyroMeanY |
tBodyGyroMeanZ |
tBodyGyroStdX |
tBodyGyroStdY |
tBodyGyroStdZ |
tBodyGyroJerkMeanX |
tBodyGyroJerkMeanY |
tBodyGyroJerkMeanZ |
tBodyGyroJerkStdX |
tBodyGyroJerkStdY |
tBodyGyroJerkStdZ |
tBodyAccelerationMagnitudeMean |
tBodyAccelerationMagnitudeStd |
tGravityAccelerationMagnitudeMean |
tGravityAccelerationMagnitudeStd |
tBodyAccelerationJerkMagnitudeMean |
tBodyAccelerationJerkMagnitudeStd |
tBodyGyroMagnitudeMean |
tBodyGyroMagnitudeStd |
tBodyGyroJerkMagnitudeMean |
tBodyGyroJerkMagnitudeStd |
fBodyAccelerationMeanX |
fBodyAccelerationMeanY |
fBodyAccelerationMeanZ |
fBodyAccelerationStdX |
fBodyAccelerationStdY |
fBodyAccelerationStdZ |
fBodyAccelerationJerkMeanX |
fBodyAccelerationJerkMeanY |
fBodyAccelerationJerkMeanZ |
fBodyAccelerationJerkStdX |
fBodyAccelerationJerkStdY |
fBodyAccelerationJerkStdZ |
fBodyGyroMeanX |
fBodyGyroMeanY |
fBodyGyroMeanZ |
fBodyGyroStdX |
fBodyGyroStdY |
fBodyGyroStdZ |
fBodyAccelerationMagnitudeMean |
fBodyAccelerationMagnitudeStd |
fBodyAccelerationJerkMagnitudeMean |
fBodyAccelerationJerkMagnitudeStd |
fBodyGyroMagnitudeMean |
fBodyGyroMagnitudeStd |
fBodyGyroJerkMagnitudeMean |
fBodyGyroJerkMagnitudeStd |

## License:

Use of this dataset in publications must be acknowledged by referencing the following publication [1] 

[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012

This dataset is distributed AS-IS and no responsibility implied or explicit can be addressed to the authors or their institutions for its use or misuse. Any commercial use is prohibited.

Jorge L. Reyes-Ortiz, Alessandro Ghio, Luca Oneto, Davide Anguita. November 2012.