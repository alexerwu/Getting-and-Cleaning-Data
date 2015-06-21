# You should create one R script called run_analysis.R that does the following. 
# 1) Merges the training and the test sets to create one data set.
# 2) Extracts only the measurements on the mean and standard deviation for each measurement. 
# 3) Uses descriptive activity names to name the activities in the data set
# 4) Appropriately labels the data set with descriptive variable names. 
# 5) From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

# 1) Merges the training and the test sets to create one data set.
# load dplyr library
library(dplyr)

# set working directory to /Users/alexerwu/Documents/courses/data_science/data/UCI HAR Dataset
setwd("/Users/alexerwu/Documents/courses/data_science/data/UCI HAR Dataset")

# read UCI HAR Dataset txt files as table objects
activity_label <- read.table("activity_labels.txt")
features <- read.table("features.txt")

# set working directory to /Users/alexerwu/Documents/courses/data_science/data/UCI HAR Dataset/test/Inertial Signals
setwd("/Users/alexerwu/Documents/courses/data_science/data/UCI HAR Dataset/test/Inertial Signals")

# read test/Inertial Signals txt files as table objects
body_acc_x_test <- read.table("body_acc_x_test.txt")
body_acc_y_test <- read.table("body_acc_y_test.txt")
body_acc_z_test <- read.table("body_acc_z_test.txt")

body_gyro_x_test <- read.table("body_gyro_x_test.txt")
body_gyro_y_test <- read.table("body_gyro_y_test.txt")
body_gyro_z_test <- read.table("body_gyro_z_test.txt")

total_acc_x_test <- read.table("total_acc_x_test.txt")
total_acc_y_test <- read.table("total_acc_y_test.txt")
total_acc_z_test <- read.table("total_acc_z_test.txt")

# set working directory to /Users/alexerwu/Documents/courses/data_science/data/UCI HAR Dataset/test
setwd("/Users/alexerwu/Documents/courses/data_science/data/UCI HAR Dataset/test")

# read test txt files as table objects
subject_test <- read.table("subject_test.txt")

X_test <- read.table("X_test.txt")

y_test <- read.table("y_test.txt")

# set working directory to /Users/alexerwu/Documents/courses/data_science/data/UCI HAR Dataset/train/Inertial Signals

setwd("/Users/alexerwu/Documents/courses/data_science/data/UCI HAR Dataset/train/Inertial Signals")

# read train/Inertial Signals txt files as table objects
body_acc_x_train <- read.table("body_acc_x_train.txt")
body_acc_y_train <- read.table("body_acc_y_train.txt")
body_acc_z_train <- read.table("body_acc_z_train.txt")

body_gyro_x_train <- read.table("body_gyro_x_train.txt")
body_gyro_y_train <- read.table("body_gyro_y_train.txt")
body_gyro_z_train <- read.table("body_gyro_z_train.txt")

total_acc_x_train <- read.table("total_acc_x_train.txt")
total_acc_y_train <- read.table("total_acc_y_train.txt")
total_acc_z_train <- read.table("total_acc_z_train.txt")

# set working directory to /Users/alexerwu/Documents/courses/data_science/data/UCI HAR Dataset/train
setwd("/Users/alexerwu/Documents/courses/data_science/data/UCI HAR Dataset/train")

# read train txt files as table objects
subject_train <- read.table("subject_train.txt")

X_train <- read.table("X_train.txt")

y_train <- read.table("y_train.txt")

#### Inventory tables ####
# subject_train: Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30.
# X_train: Training set.
# y_train: Training labels.

# subject_test: Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30.
# X_test: Test set.
# y_test: Test labels.

# merge text and train tables as "...merged" table
body_acc_x_merged <- merge(body_acc_x_train, body_acc_x_test)
body_acc_y_merged <- merge(body_acc_y_train, body_acc_y_test)
body_acc_z_merged <- merge(body_acc_z_train, body_acc_z_test)

body_gyro_x_merged <- merge(body_gyro_x_train, body_gyro_x_test)
body_gyro_y_merged <- merge(body_gyro_y_train, body_gyro_y_test)
body_gyro_z_merged <- merge(body_gyro_z_train, body_gyro_z_test)

total_acc_x_merged <- merge(total_acc_x_train, total_acc_x_test)
total_acc_y_merged <- merge(total_acc_y_train, total_acc_y_test)
total_acc_z_merged <- merge(total_acc_z_train, total_acc_z_test)

subject_merged <- merge(subject_train, subject_test)

training_merged <- merge(X_train, y_train, all=TRUE)

#### merge activity labels with training set & labels ####

# rename activity label variables to activity_index = V1 and activity_desc = V2
activity_label_renamed <- rename(activity_label, activity_index = V1, activity_desc = V2)

# rename y_train activity_index = V1
y_train_renamed <- rename(y_train, activity_index = V1)

# rename subject_train V1 to subject_id and assign to subject_train_renamed
subject_train_renamed <- rename(subject_train, subject_id = V1)

# cbind y_train_renamed label to X_train data
train_cbind <- cbind(y_train_renamed, X_train)

#cbind train_cbind with subject_train_renamed to provide subject_id to train set and assign as train_complete
train_complete <- cbind(subject_train_renamed, train_cbind)

# merge train_complete to activity_label_renamed
train_merged <- merge(activity_label_renamed, train_complete)

# write train_merged data set
write.table("train_merged", file="train_merged.txt", row.name=FALSE)