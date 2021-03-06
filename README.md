# README
Graeme Jamieson  
December 23, 2015  

This Repo contains an R script called run_analysis.R which is used to clean up and create a tidy dataset from the [Human Activity Recognition Using Smartphones Datasets](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones).  

To run this script follow these instructions:  

1. Download the dataset from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip  
2. Extract the contents to your working directory so that the run_analysis.R file sits in the same directory (your working directory) as the folder "UCI HAR Dataset".  
3. You can then run the run_analysis.R script to create two text files.  
    + The first "tidy_data.txt" is a tidy dataset with descriptive variables and a row for each record a participant had for each activity. It will be saved in your working directory. 
    + The second table "tidy_summarized_data.txt" is a summary table which will have 1 row for each activity and participant combination with the average for each measurement reported. This will be saved in your working directory.   

Refer to the CodeBook.md for more detailed information on the data
