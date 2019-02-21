#Loading required packages
library(dplyr)

#Reading Common Dataset
activities <- read.table("./data/activity_labels.txt", header = FALSE)
features <- read.table("./data/features.txt", header = FALSE)

feature_names <- features$V2

#Reading Train/Test Dataset
train <- read.table("./data/train/X_train.txt", header = FALSE)
train <- tbl_df(train)

test <- read.table("./data/test/X_test.txt", header = FALSE)
test <- tbl_df(test)

#Naming Train Dataset + Activity
train_subjects <- read.table("./data/train/subject_train.txt", header = FALSE)
train_activities <- read.table("./data/train/y_train.txt", header = FALSE)
colnames(train) <- feature_names
train <- cbind(train, activity = train_activities$V1)
train <- cbind(train, subject = train_subjects$V1)

#Naming Test Dataset + Activity
test_subjects <- read.table("./data/test/subject_test.txt", header = FALSE)
test_activities <- read.table("./data/test/y_test.txt", header = FALSE)
colnames(test) <- feature_names
test <- cbind(test, activity = test_activities$V1)
test <- cbind(test, subject = test_subjects$V1)

#Merge Train & Test into a single dataset
merged_traintest <- rbind(train, test)

#Extract mean and standard deviation measurements
selected_columns <- grep("mean|std", 
                         colnames(merged_traintest), 
                         ignore.case = TRUE, 
                         value = TRUE)

selected_traintest <- merged_traintest[, c(selected_columns, "activity", "subject")]

#From independent tidy data based on average of all variables by each subject-activity
result <- selected_traintest %>% group_by(subject, activity) %>% summarize_all("mean")
result

#Save the tidy data as a txt file
write.table(result, "tidy.txt", row.names = FALSE)
