Week 04 Project Course
===========

This project demonstrates how to collect, work with, and clean a dataset. It prepares a tidy data that can be used later for analysis. Based on an experiment of human activity recognition made by Davide Anguita, Alessandro Ghio and Luca Oneto from University of Genova with Xavier Parra and Jorge L. Reyes-Ortiz Universitat Politecnica de Catalunya. 30 volunteers performed different activities (6 types) while wearing a smartphone. The smartphone captured various data about their movements.

The captured data were collected from the accelerometers and gyroscope using the Samsung Galaxy S smartphone. A full description of the captured data and activities are available at the following site:

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

### Dataset Source

It can be downloaded from the following link:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

### Assumptions

1. Work directory has been to the same directory where the script (run_analysis.R) is available.
2. Data sets (from source) are downloaded and placed inside a directory called data at work directory level.

### Prerequisites

To be able to execute the script, you need to perform the following:

1. Download the dataset zip file from source.
2. Unzip the compressed file.
3. Create a folder called data at the same level where (run_analysis.R) script is available.
4. Move the extracted files* into data folder so you can have something similar to the hierarchy below.
5. Set the working directory at script level and run it.

### Hierarchy

```
FOLDER_HIERARCHY          DESCRIPTION

run_analysis.R            Script
tidy.csv                  Output
data                      Folder
|_ activity_labels.txt    Links the class labels with their activity name.
|_ features.txt           List of all features
|_ train                  Sub-folder
|  |_ subject_train.txt   Identifies the subject who performed the activity within train set
|  |_ X_train.txt         Training set.
|  |_ y_train.txt         Training labels set.
|_ test                   Sub-folder
   |_ subject_test.txt    Identifies the subject who performed the activity within test set
   |_ X_test.txt          Test set.
   |_ y_test.txt          Test labels set.   
   
```

### Script

The script performs the next actions in order to produce a tidy dataset.

1. Load the data.
2. Merges the training and the test sets into one single dataset.
3. Extracts measurements relevant to mean and standard deviation for each measurement.
4. Uses descriptive activity names to name the activities in the data set.
5. Appropriately labels the data set with descriptive variable names.
6. Creates an independent tidy dataset with the average of each variable based on activity-subject couple.

The output of the R script is saved as a TXT file, called [tidy.txt](tidy.txt).

More details about the data and the analysis could be found in the [code book](CODEBOOK.md).

(*)  : Only the involved datasets had been illustrated from the extracted zip file
