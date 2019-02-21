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

#Naming Train Dataset + Subject & Activity Variables
train_subjects <- read.table("./data/train/subject_train.txt", header = FALSE)
train_activities <- read.table("./data/train/y_train.txt", header = FALSE)
colnames(train) <- feature_names
train_activities_factors <- factor(train_activities$V1, labels = activities$V2)
train <- cbind(train, Activity = train_activities_factors)
train <- cbind(train, Subject = train_subjects$V1)

#Naming Test Dataset + Subject & Activity Variables
test_subjects <- read.table("./data/test/subject_test.txt", header = FALSE)
test_activities <- read.table("./data/test/y_test.txt", header = FALSE)
colnames(test) <- feature_names
test_activities_factors <- factor(test_activities$V1, labels = activities$V2)
test <- cbind(test, Activity = test_activities_factors)
test <- cbind(test, Subject = test_subjects$V1)

#Merge Train & Test into a single dataset
merged_traintest <- rbind(train, test)

#Extract mean and standard deviation measurements
selected_columns <- grep("mean|std", 
                         colnames(merged_traintest), 
                         ignore.case = TRUE, 
                         value = TRUE)

selected_traintest <- merged_traintest[, c(selected_columns, "Activity", "Subject")]

#Re-Naming for selected dataset varibales
headers <- names(selected_traintest)
headers <- gsub("-", "", headers)
headers <- gsub("\\(", "", headers)
headers <- gsub("\\)", "", headers)
headers <- gsub(",", "", headers)
headers <- gsub("Acc", "Accelerometer", headers)
headers <- gsub("Gyro", "Gyroscope", headers)
headers <- gsub("mean", "Mean", headers)
headers <- gsub("std", "StandardDeviation", headers)
headers <- gsub("Mag", "Magnitude", headers)
headers <- gsub("BodyBody", "Body", headers)
headers <- gsub("angle", "Angle", headers)
headers <- gsub("gravity", "Gravity", headers)
headers <- gsub("^t{1}", "Time", headers)
headers <- gsub("^f{1}", "Frequency", headers)
names(selected_traintest) <- headers

#From independent tidy data based on average of all variables by each subject-activity
result <- selected_traintest %>% group_by(Subject, Activity) %>% summarize_all("mean")
result

#Save the tidy data as a txt file
write.table(result, "tidy.txt", row.names = FALSE)
