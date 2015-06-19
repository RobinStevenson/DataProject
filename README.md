## Code description

run_analysis.R extracts data from the UCI HAR dataset and merges and tidies a subset of the data.

The data has been downloaded from
 https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
on 11 June 2015.

For the code to run correctly the data must be unzipped as is into a folder named "data"
in the same directory as run_analysis.R

run_analysis.R required the "plyr" package

### Code function

This code extracts and manipulates the data in the subfolder ./data/UCI HAR Dataset/
Data from test/X_test.txt and Train/X_Train.txt files are extracted using the read.table function. 
The activity labels are extracted from test/y_text.txt and Train/y_Train.txt using the read.table function. 
The subject labels are extracted from test/subject_test.txt and Train/subject_Train.txt using the read.table function. 

The code merges (row bind) the test and train datasets into a single data frame, extracts the columns corresponding to
means (in each direction) and standard deviations (in each direction), i.e. columns 1 through to 6. 
The activity labels, and subject labels, for the test and train sets are also merged and then added to 
the data frame (column bind)

The data is then grouped by subject label and activity label, and then the mean of each group for each
variable (mean in each direction and standard deviation in each direction) is calculated. These means 
are written to "tablemeans.txt" in the same directory as the run_analysis.R script.