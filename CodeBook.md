## Variable included in this dataset

The variables included in the tablemeans.txt dataset are calculated from the UCI HAR Dataset.
Specifically, these data are created from the means and standard deviations(both in each direction)
provided in that dataset.
For information about how that dataset was created see "UCI HAR Dataset/features_info.txt"

'-XYZ' is used to denote 3-axial signals in the x, y and z directions.

#### Labels:
* subject: identifies the subject who performed the activity. Its range is 1 to 30
* activity: identifies the activity performed. Options are "walking", "walking up", "walking down", "sitting", "standing" and "laying"

#### Features:
This data set contains the mean of each of these features over each subject and activity. 
Note that before the mean is calculated all of these data have been normalised to lie between -1 and 1
and so the means of these data will have an even smaller range. The units of these measurements are 
therefore unclear.

The features in this dataset are 
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

The means of the following have been calculated for each feature
* mean(): the mean value of the feature
* std(): the standard deviation of the feature

(yes, we are calculating the mean of a mean, and the mean of a standard deviation).


