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
##------------------------------------------------------------------------------##
## First get all the data needed including                                      ##
## Training and Testing and the Activity and Features                           ##
##------------------------------------------------------------------------------##
##
## Install and load plyr for later
require(plyr);
##
## Function to facilitate calling later in program                              
## if reload is required.                                                       
getFiles <- function(){
        ## Get the Variable names for Activity & Features
        activityLabels <<- read.table("./data/activity_labels.txt"); 
        features <<- read.table("./data/features.txt");
        ## Get the Training data 
        trainingData <<- read.table("./data/X_train.txt");
        trainingActivity <<- read.table("./data/y_train.txt");
        trainingSubject <<- read.table("./data/subject_train.txt");
        ## Get theTesting data 
        testingData <<- read.table("./data/X_test.txt");
        testingActivity <<- read.table("./data/y_test.txt");
        testingSubject <<- read.table("./data/subject_test.txt");
        }
getFiles();
##------------------------------------------------------------------------------##
## Merge the raw data                                                           ##
##------------------------------------------------------------------------------##
## Step 1. Attach the names to columns from the features and add column name for        
## subject and activity
colnames(trainingData) <- features$V2;
colnames(trainingSubject) <- "subject";
colnames(trainingActivity) <- "activity";
colnames(testingData) <- features$V2;
colnames(testingSubject) <- "subject";
colnames(testingActivity) <- "activity";
##
## Step 2. Bind the subject, activity and data for training and testing data
allData <- rbind(cbind(trainingSubject,trainingActivity,trainingData),
                 cbind(testingSubject,testingActivity,testingData));
##
## Step3. Create a new data frame that contains subject, activity, and
## these matching columns
matchedCols <- c(1,2, grep("std|mean[^meanFreq]", colnames(allData)));
subActData <- allData[,matchedCols];
##
## Step 4. Factor based on activities and assign real names to the levels
subActData$activity <- as.factor(subActData$activity);
levels(subActData$activity) <- activityLabels[,2];  


##------------------------------------------------------------------------------##
##  Clean up the names to make tidier                                           ##
##------------------------------------------------------------------------------##
## Step 1. Take out the parenthesis and dashes
names(subActData) <- gsub("\\(|\\)", "", names(subActData));
names(subActData) <- gsub("\\-", "", names(subActData));
## Step 2. Take out the leading descriptors and replace with time or frequency to delineate
## for tidy data
names(subActData) <- gsub("^t", "Time:", names(subActData));
names(subActData) <- gsub("^f", "Frequency:", names(subActData));
## Step 3. Although some are intuitive enough, replace shorthand with English names.
names(subActData) <- gsub("Acc", "Acceleration", names(subActData));
names(subActData) <- gsub("Gyro", "Gyroscope", names(subActData));
names(subActData) <- gsub("Mag", "Magnitude", names(subActData));
names(subActData) <- gsub("mean", "Mean", names(subActData));
names(subActData) <- gsub("X$", "X-Axis", names(subActData));
names(subActData) <- gsub("Y$", "Y-Axis", names(subActData));
names(subActData) <- gsub("Z$", "Z-Axis", names(subActData));
names(subActData) <- gsub("std", "Standard Deviation", names(subActData));

##------------------------------------------------------------------------------##
##  Create and write the output file                                            ##
##------------------------------------------------------------------------------##
## Use plyr to create the tidy data set and write.table  to a txt file
avg_file <- ddply(subActData, c("subject","activity"), numcolwise(mean));
write.table(avg_file, file = "final_dataset.txt",row.name=FALSE);

##------------------------------------------------------------------------------##
## This statement below is optional to ensure that the write.table did what it  ##
## was supposed to do.                                                          ##
## Uncomment and execute to read in the table and check data.                   ##
## Keep commented                                                               ##
## out for the actual real execution.                                           ##
##------------------------------------------------------------------------------##
## check_file <- read.table("final_dataset.txt",header=TRUE)

