---
title: "Getting and cleaning data course project - Code book"
output: html_document
---

### Description of the tidy data set

#### Overview
The tidy data set, which is the output of the "run_analysis.R" script, is composed of 180 observations (rows) and 81 variables (columns). Each row is a unique combination of the variables "subject" and "activity" while each column represents the average of one of the features of the original data set.  
This data set is tidy because it follows the three basic principles of a tidy data set, namely:

* each variable in one column;
* each different observation (in this case a combination of variables) in one row
* one table for variables of the same nature

#### Differences from the original data set
As for the instructions of the assignment, only a subset of the features of the original data set has been retained. More specifically, in order to keep only the variables which represented an average or a standard deviation, only the variables whose names contained the substring "mean" or "std" were selected. In my opinion, this was the most error-proof method to choose the subset of variables without risking the exclusion of important characteristics.        
The variables have been renamed to increase their readability. For this reason their names are longer but easier to read: for example, "Acc" of the original dataset has become "Acceleration", "Gyro" has become "Gyroscope" and so on. Time domain variables were denoted by the prefix "time", frequency domain variables by the prefix "frequency".
The "activity" column stores the names of the activities (not the code numbers of the original data set), labelled after the indications in the "activity_labels" file of the downloaded material.  


### The variables
The first two variables ("subject" and "activity") are of qualitative nature - or "factors" in R language: the "subject" column contains the numeric id of the subjects of the experiment (from 1 to 30); the "activity" column stores the six activities which each subject has taken part in.  
As for the other 79 numeric variables, from the original data set only the variables which were an average or a standard deviation of a measure were selected. Each one of these variable is the average calculated for each subject-activity combination. Since in the original data set the features were normalized to be bounded between -1 and 1, the variables in this data set too will obviously have this same characteristic.  
For the meaning of each feature, see the "features_info" and the readme text files in the original zipped material, as they contain the explanation of the nature of the experiments and the measures that were obtained.

### Additional notes
For info on how to run the script see the ReadMe file in this same repository.


