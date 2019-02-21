
### Overview

A description for the variables, the data, and any transformations made to clean up the data based course project requirements.

### Detailed Data Structures

[INPUT]
1. `features`: Names of collected/filtered information from smartphone.
```
- from: features.txt file
- type: df with 561 obs. and 2 var.
```
2. `activities`: A map of activity's id and names.
```
- from: activity_labels.txt file
- type: df with 561 obs. and 2 var.
```
3. `train`: Collected experiment data for 21 volunteers out of 30 for training purposes.
```
- from: X_train.txt file
- type: df with 7352 obs. and 561 var.
```
* `train_subjects`: Denoting the id of the volunteer related to each of observations within `X_train.txt`.
```
- from: subject_train.txt file
- type: df with 7352 obs. and 1 var.
```
* `train_activities`: Denoting the id of the activity related to each of the observations within `X_train.txt`.
```
- from: y_train.txt file
- type: df with 7352 obs. and 2 var.
```
* `test`: Collected experiment data for 9 volunteers out of 30 for test purposes.
```
- from: X_test.txt file
- type: df with 2947 obs. and 561 var.
```
* `test_subjects`: Denoting the id of the volunteer related to each of observations within `X_test.txt`.
```
- from: subject_test.txt file
- type: df with 2947 obs. and 1 var.
```
* `test_activities`: Denoting the id of the activity related to each of the observations within `X_test.txt`.
```
- from: y_test.txt file
- type: df with 2947 obs. and 2 var.
```
[TRANSFORMATION]
* `merged_traintest`: Combination of train and test datasets.
```
- type: df with 10299 obs. and 653 var.
```

* `selected_traintest`: A filtered dataset based on relevant columns to mean and standard deviation.
```
- type: df with 10299 obs. and 88 var.
```
[OUTPUT]
* `result`: An independent tidy data based on average of all variables by each subject-activity couple
```
- type: df with 180 obs. and 88 var.
```

More detailes about the variables, you can refer to `features_info.txt` file.

### Processing Steps

1. Both train & test original datasets were read and named based on features set.
```
- train (7352 obs. with 561 var.)
- test (2947 obs. with 561 var.)
```
2. Appropriate headers/columns (activity and subject) added to named train & test datasets.
```
- train (7352 obs. with 563 var.)
- test (2947 obs. with 563 var.)
```
3. Both train & test datasets had been merged into a single set.
```
- merge (10299 obs. with 563 var.)
```
4. A set of variables related to mean and standard deviantion were picked from the merged set.
```
- select (10299 obs. with 88 var.)
```
5. Finally, a tidy data had been generated with the average of each variable groped by (subject, activity) couple and saved it as a CSV file.
```
- select (180 obs. with 88 var.)
```
