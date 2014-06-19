# Source of data for the project:
# https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

cd <- FALSE
if(!file.exists("features.txt")) {
    setwd("./UCI HAR Dataset")
    cd <- TRUE
}

# 1. Merges the training and the test sets to create one data set.

tmp1 <- read.table("./train/X_train.txt")
tmp2 <- read.table("./test/X_test.txt")
X <- rbind(tmp1, tmp2)

tmp1 <- read.table("./train/subject_train.txt")
tmp2 <- read.table("./test/subject_test.txt")
S <- rbind(tmp1, tmp2)

tmp1 <- read.table("./train/y_train.txt")
tmp2 <- read.table("./test/y_test.txt")
Y <- rbind(tmp1, tmp2)

# 2. Extracts only the measurements on the mean and standard deviation for each measurement.

features <- read.table("./features.txt")
features_index <- grep("-mean\\(\\)|-std\\(\\)", features[, 2])
X <- X[, features_index]
names(X) <- features[features_index, 2]
names(X) <- gsub("\\(|\\)", "", names(X))
names(X) <- tolower(names(X)) 

# 3. Uses descriptive activity names to name the activities in the data set

activities <- read.table("./activity_labels.txt")
activities[, 2] = gsub("_", "", tolower(as.character(activities[, 2])))
Y[,1] = activities[Y[,1], 2]
names(Y) <- "activity"

# 4. Appropriately labels the data set with descriptive variable names. 

names(S) <- "subject"
tidy_data <- cbind(S, Y, X)
write.table(tidy_data, "../data/tidy_data.txt")

# 5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject. 

uniqueSubjects = unique(S)[,1]
numSubjects = length(unique(S)[,1])
numActivities = length(activities[,1])
numCols = dim(tidy_data)[2]
result = tidy_data[1:(numSubjects*numActivities), ]

row = 1
for (s in 1:numSubjects) {
	for (a in 1:numActivities) {
		result[row, 1] = uniqueSubjects[s]
		result[row, 2] = activities[a, 2]
		tmp <- tidy_data[tidy_data$subject==s & tidy_data$activity==activities[a, 2], ]
		result[row, 3:numCols] <- colMeans(tmp[, 3:numCols])
		row = row+1
	}
}
write.table(result, "../data/tidy_averages.txt")
if(cd==TRUE) setwd("../")
