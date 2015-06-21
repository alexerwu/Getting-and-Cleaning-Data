# You should create one R script called run_analysis.R that does the following. 
# 1) Merges the training and the test sets to create one data set.
# 2) Extracts only the measurements on the mean and standard deviation for each measurement. 
# 3) Uses descriptive activity names to name the activities in the data set
# 4) Appropriately labels the data set with descriptive variable names. 
# 5) From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

# 1) Merges the training and the test sets to create one data set.
# load dplyr library

# set working directory to /Users/alexerwu/Documents/courses/data_science/data/UCI HAR Dataset


# read UCI HAR Dataset txt files as table objects


# set working directory to /Users/alexerwu/Documents/courses/data_science/data/UCI HAR Dataset/test/Inertial Signals


# read test/Inertial Signals txt files as table objects


# set working directory to /Users/alexerwu/Documents/courses/data_science/data/UCI HAR Dataset/test


# read test txt files as table objects

# set working directory to /Users/alexerwu/Documents/courses/data_science/data/UCI HAR Dataset/train/Inertial Signals


# read train/Inertial Signals txt files as table objects


# set working directory to /Users/alexerwu/Documents/courses/data_science/data/UCI HAR Dataset/train


# read train txt files as table objects


#### Inventory tables ####
# subject_train: Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30.
# X_train: Training set.
# y_train: Training labels.

# subject_test: Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30.
# X_test: Test set.
# y_test: Test labels.


#### merge activity labels with training set & labels ####

# rename activity label variables to activity_index = V1 and activity_desc = V2

# rename y_train activity_index = V1

# rename subject_train V1 to subject_id and assign to subject_train_renamed

# cbind y_train_renamed label to X_train data

#cbind train_cbind with subject_train_renamed to provide subject_id to train set and assign as train_complete

# merge train_complete to activity_label_renamed

#### write train_merged to txt file ####

# write train_merged data set