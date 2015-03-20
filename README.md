-README
Files contained are in support of Getting and Cleaning Data Project 2.
Directions from Class follows:
##------------------------------------------------------------------------------##
##             Project 2 for Cleaning Data                                      ##
##------------------------------------------------------------------------------##
## You should create one R script called run_analysis.R that does               ## 
##  the following.                                                              ##
## 1.Merges the training and the test sets to create one data set.              ##
## 2.Extracts only the measurements on the mean and standard deviation for      ##
##   each measurement.                                                          ##
## 3.Uses descriptive activity names to name the activities in the data set     ##
## 4. Appropriately labels the data set with descriptive variable names.        ##
## 5.From the data set in step 4, creates a second, independent tidy            ##
##   data set with the average of each variable for each activity and           ##
##   each subject.                                                              ##
##------------------------------------------------------------------------------##
## Source data file:
## https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
##
## Output file is "final_dataset.txt"

The program run_Analysis.R should be run assuming the Samsung files above have
been downlaoded and unzipped into the working directory.  The program will 
automatically check for dplyr and install if needed.

Program follows the following steps (see inline documentation)
1. Get all the files
2. Set all the column names
3. Prep the data and merge together
4. Subset the data for std deviations and means
5. Clean up the column names of the remainig columns
6. Get the average and output to the text file

See codebook for full list output variables.