## Getting and Cleaning Data Course Project. Downloads Human Activity Recognition Using Smartphones Dataset.
## Clean and summarize it by subject and activity. Write the result to the disk

library(data.table)

datadir <- "UCI HAR Dataset"
zipfile <- "UCI HAR Dataset.zip"

resultname <- "tidydata.txt"

## 1. Merges the training and the test sets to create one data set.
#################################################################################

# unzip the datafile if the data directory doesn't exist. If the zipfile doesn't exist, download it
if(!file.exists(datadir)) {
    if(!file.exists(zipfile)) {
        download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip", 
                      zipfile, mode ="wb")
    }
    unzip(zipfile)
}

# read data
features <- fread(file.path(datadir,"features.txt"))
activity_labels <- fread("UCI HAR DataSet/activity_labels.txt")

train_activities <- fread(file.path(datadir, "train/Y_train.txt"))
train_subjects <- fread(file.path(datadir, "train/subject_train.txt"))
train_data <- fread(file.path(datadir, "train/X_train.txt"))

test_activities <- fread(file.path(datadir, "test/Y_test.txt"))
test_subjects <- fread(file.path(datadir, "test/subject_test.txt"))
test_data <- fread(file.path(datadir, "test/X_test.txt"))

# rename columns
names(activity_labels) <- c("id", "activity")

names(train_activities) <- "activityId"
names(train_subjects) <- "subject"
names(train_data) <- features$V2

names(test_activities) <- "activityId"
names(test_subjects) <- "subject"
names(test_data) <- features$V2

# construct train and test datatables by column binding subject, activity and features
train <- cbind(train_subjects, train_activities, train_data)
test <- cbind(test_subjects, test_activities, test_data)

# row bind the train and test datatables to obtain full data
dt <- rbind(train,test)

## 2. Extracts only the measurements on the mean and standard deviation for each measurement.
#################################################################################

# grep column names which have mean() or std()
features_out <- features$V2[grep("(mean|std)\\(\\)", features$V2)]

#full feature set includes also subject and activity id
features_out <- c("subject", "activityId", features_out)

# subset with the column names
dt <- dt[,features_out, with = FALSE]

## 3. Uses descriptive activity names to name the activities in the data set
#################################################################################

# rename activityId to activity to subset the merged data
features_out[2] <- "activity"

# set data.table keys to join activity names to the data
setkey(activity_labels, id)
setkey(dt, activityId)

# join activity labels and subset wanted columns
dt <- dt[activity_labels][,features_out, with = FALSE]

## 4. Appropriately labels the data set with descriptive variable names.
#################################################################################

# replace abbreviated names with more descriptive
# Decided to let time and frequency domain and standard deviation to remain in abbreviated forms
# t, f and std respectively for readability's sake
names(dt) <- gsub("mean", "Mean", names(dt))
names(dt) <- gsub("std", "Std", names(dt))
names(dt) <- gsub("Acc", "Acceleration", names(dt))
names(dt) <- gsub("Mag", "Magnitude", names(dt))
# remove -, ( and )
names(dt) <- gsub("[-\\(\\)]", "", names(dt))
#remove duplicatd Body in original data
names(dt) <- gsub("BodyBody", "Body", names(dt))


## 5. From the data set in step 4, creates a second, independent tidy data set with the average 
##    of each variable for each activity and each subject.
#################################################################################

# calculate means for each column by subject and activity
setkey(dt,subject,activity)
means <- dt[, lapply(.SD, mean), by=key(dt)]

# write the result to the disk
write.table(means, resultname , quote = FALSE, row.names = FALSE)
