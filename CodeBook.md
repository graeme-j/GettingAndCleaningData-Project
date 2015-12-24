# Codebook
Graeme Jamieson  
December 23, 2015  

The dataset produced from this analysis comes from a study where 30 individuals, aged 19-49, strapped a Galaxy S II smartphone to their waist and performed 6 activities.  

These activities were:  

  * WALKING
  * WALKING UPSTAIRS
  * WALKING DOWNSTAIRS
  * SITTING
  * STANDING
  * LAYING
  
A number of different measurements were recorded using the accelerometer and gyroscope. If the measurement begins with a 't' then it refers to a time measurement and if it begins with an 'f' then it is a frequency.  

They are:  

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
 
and the variables that were estimated from these measurements were the:  

* mean(): Mean value
* std(): Standard deviation
* there are many others which I will omit as they will not be used for this analysis

After preprocessing our final clean dataset is 10299 rows by 68 columns.  
The first column is the Activity defined above and the second column is the subject number which represents the ID of the participant.

For more detailed information from the author of these datasets visit: [Human Activity Recognition Using Smartphones](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)

##Pre-processing the data
There were a number of steps taken to transform the raw data into the tidy data set. These are performed by the script run_analysis.R.  

These steps are:  

1. Load the activity data, the subject data and the measurement data for the training and test sets
    + the subject data had 1 column containing the participant ID of that record
    + the activity data had 1 column representing the ID of the activity performed. This was joined to the activity description data containing two columns, the first representing the activity ID and the second the activity description as defined above.
    + The measurement data had one column for each of estimated means and std of each of the measurements taken (listed above). Each row was a measurement for a specific activity performed by a specific person
  
2. Attach the subject ID and the Activity ID to the Measurement data using R's cbind() for both the test and the training data.
3. Combine the training and test sets using R's rbind()
4. Attach the columns names take from the features.txt file provided in the same data source as the measurement data.
    + manually assign the columns names to the "Activity" and "subject"
5. Remove all columns that are not a mean or a std based on the column name.
6. Replace the activity ID with the activity description

The dataset is now tidy and can be easily used for analysis.
