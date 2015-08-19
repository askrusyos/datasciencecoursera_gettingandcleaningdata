#Import the features list, the test dataset and the activities of the subjects in the test set
features = read.table("UCI HAR Dataset/features.txt")
test_data = read.table("./UCI HAR Dataset/test/X_test.txt")
test_labels = read.table("./UCI HAR Dataset/test/y_test.txt")
#Identify the variables in the test data frame with the feature list
names(test_data) = features[,2]
#Attach the column of activities to the data frame and name its variable accordingly
test_dataset = cbind(test_data, test_labels[,1])
names(test_dataset)[562] = "activity"
rm(test_data, test_labels) 
#Import the training data and repeat the steps done for the test set.
training_data = read.table("./UCI HAR Dataset/train/X_train.txt")
training_labels = read.table("./UCI HAR Dataset/train/y_train.txt")
names(training_data) = features[,2]
training_dataset = cbind(training_data, training_labels[,1])
names(training_dataset)[562] = "activity"
rm(training_data, training_labels)
#Read the subject data, both for test and training dataset.
#Attach the subject data to their datasets.
subject_test = read.table("./UCI HAR Dataset/test/subject_test.txt")
subject_training = read.table("UCI HAR Dataset/train/subject_train.txt")
test_dataset = cbind(test_dataset, subject_test)
training_dataset = cbind(training_dataset, subject_training)
names(training_dataset)[563] = "subject"
names(test_dataset)[563] = "subject"
rm(subject_training, subject_test)
#Now we can merge together the test data and the training data
single_dataset = rbind(test_dataset, training_dataset)  
rm(features, test_dataset, training_dataset)                        # step 1 completed

#Retain only the columns that contain a mean or a standard deviation
indexes_mean = which(grepl("mean", names(single_dataset)))
indexes_std = which(grepl("std", names(single_dataset)))
indexes = c(indexes_mean, indexes_std, 562, 563)
indexes = sort(indexes)
single_dataset_mean_std = single_dataset[,indexes]
rm(indexes_mean, indexes_std, indexes)              
rm(single_dataset)                               # step 2 completed

#Give some human readable names to the variables
names(single_dataset_mean_std) = gsub(x = names(single_dataset_mean_std), pattern = "tBody", replacement = "timeBody") 
names(single_dataset_mean_std) = gsub(x = names(single_dataset_mean_std), pattern = "tGravity", replacement = "timeGravity")
names(single_dataset_mean_std) = gsub(x = names(single_dataset_mean_std), pattern = "fBody", replacement = "frequencyBody") 
names(single_dataset_mean_std) = gsub(x = names(single_dataset_mean_std), pattern = "Acc", replacement = "Acceleration") 
names(single_dataset_mean_std) = gsub(x = names(single_dataset_mean_std), pattern = "Gyro", replacement = "Gyroscope")      # step 4 completed

#Make the tidy dataset by calculating the mean for each subject and each activity
#(Step 5 of the instructions)
dataset_tidy = aggregate(single_dataset_mean_std[,1:79], by = list("subject"=single_dataset_mean_std$subject, "activity"=single_dataset_mean_std$activity), data = single_dataset_mean_std, FUN = mean)
#Give the activities some readable name instead of numbers
dataset_tidy$activity = as.factor(dataset_tidy$activity)
levels(dataset_tidy$activity) = c("walking", "walkingupstairs", "walkingdownstairs","sitting", "standing", "laying" )     # step 3 completed

#Output the tidy dataset
write.table(dataset_tidy, file = "dataset_tidy.txt", row.names = FALSE)