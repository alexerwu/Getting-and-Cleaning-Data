# You should create one R script called run_analysis.R that does the following. 
# 1) Merges the training and the test sets to create one data set.
# 2) Extracts only the measurements on the mean and standard deviation for each measurement. 
# 3) Uses descriptive activity names to name the activities in the data set
# 4) Appropriately labels the data set with descriptive variable names. 
# 5) From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

# 1) Merges the training and the test sets to create one data set.
# load dplyr library
library(dplyr)

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

X_merged <- merge(X_train, X_test)

y_merged <- merge(y_train, y_test)


