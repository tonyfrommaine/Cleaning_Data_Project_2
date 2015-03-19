## Project 2 for Cleaning Data
##
##
## First get all the data for Training and Testing including the Activity and Features
## Get the Variable names for Activity & Features
activityLabels <- read.table("./UCI HAR Dataset/activity_labels.txt"); 
features <- read.table("./UCI HAR Dataset/features.txt");

## Get the Training data 
trainingData <- read.table("./UCI HAR Dataset/train/X_train.txt");
trainingActivity <- read.table("./UCI HAR Dataset/train/y_train.txt");
trainingSubject <- read.table("./UCI HAR Dataset/train/subject_train.txt");

## Get theTesting data 
testingData <- read.table("./UCI HAR Dataset/test/X_test.txt");
testingActivity <- read.table("./UCI HAR Dataset/test/y_test.txt");
testingSubject <- read.table("./UCI HAR Dataset/test/subject_test.txt");

