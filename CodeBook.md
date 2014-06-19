Source of original data: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip . 
Original description: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

The attached R script (run_analysis.R) performs the following to clean up the data:

1. Merges the training and the test sets to create one data set.
train/X_train.txt with test/X_test.txt -- the result is a 10299 x 561 data frame.

train/subject_train.txt with test/subject_test.txt -- the result is a 10299 x 1 data frame with subject IDs,

train/y_train.txt with test/y_test.txt -- the result is also a 10299 x 1 data frame with activity IDs.

2. Reads file features.txt and extracts only the measurements on the mean and standard deviation for each measurement.
The result is a 10299 x 66 data frame containing measurements on the mean and standard deviation in the [-1, 1] range

3. Reads activity_labels.txt and applies descriptive names to the activities:

laying
sitting
standing
walking
walkingdownstairs
walkingupstairs

4. The script also appropriately labels the data set with descriptive names: all feature names (attributes) and activity names are converted to lower case, underscores and brackets () are removed.
Then it merges the features and activity labels data frames by subject IDs.

The result is saved as merged_clean_data.txt, a 10299x68 data frame such that the first column contains subject IDs, the second column activity names, and the last 66 columns are measurements. Subject IDs are integers between 1 and 30. Names of the attributes are similar to the following:

tbodyacc-mean-x	
tbodyacc-mean-y	
tbodyacc-mean-z	
tbodyacc-std-x	
tbodyacc-std-y	
tbodyacc-std-z

5. Finally, the script creates a 2nd, independent tidy data set with the average of each measurement for each activity and each subject.
The result is saved as tidy_averages.txt, a 180x68 data frame, where as before, the first column contains subject IDs, the second column contains activity names. The averages for each of the 66 attributes are in columns 3...68. There are 30 subjects and 6 activities, thus 180 rows in this data set with averages.
