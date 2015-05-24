# Cleaning-Project
Required Repo for JHU Data Science course Getting and Cleaning Data

# Structure of script
There is one single script called run_analysis.R, as specified in the project requirements.

This single script was created from 5 separate scripts, one for each step of the project.
These 5 scripts can still be seen in run_analysis.R, placed sequentially with comments to separate them.

The 5 scripts were tested successively, then placed in order in run_analysis.

Each of the 5 parts of run_analysis performs the specified tasks for each successive part of the project requirements, which are reproduced here:

  1.  Merges the training and the test sets to create one data set.
  2.  Extracts only the measurements on the mean and standard deviation for each measurement. 
  3.  Uses descriptive activity names to name the activities in the data set
  4.  Appropriately labels the data set with descriptive variable names. 
  5.  From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

A few comments on this.

Step 1 merges all three relevant pairs (train and test) of the data, namely merges the two subject text files, the two y text files, and the two X text files using rbind.  These are then merged columnwise using cbind.

Step 2 extracts from the large data frame produced by step 1, the 68 columns for "subject", "activity" [y files], and 66 columns which are all and only the mean and std columns.  At the end of this step, the resulting data frame is saved in the alternate variable "foo" for ease of use in step 5.

Step 3 replaces integer activity labels with the equivalent verbal activity labels from activity_labels.txt.  This could have been done in a loop, but since there are only six replacements, it is just as easy to do it with explicit lines of code.

Step 4 labels the data columns with intuitive names.  These labels are all character variables.

Step 5 is, unfortunately, work under development.  It is not clear what the state of this will be by the deadline for submission of the assignment.
