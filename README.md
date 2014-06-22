gettingandcleaningdata
======================

courseproject

The aim of of the code is to achieve the following goal:
1)Merges the training and the test sets to create one data set.
2)Extracts only the measurements on the mean and standard deviation for each measurement. 
3)Uses descriptive activity names to name the activities in the data set
4)Appropriately labels the data set with descriptive variable names. 
5)Creates a second, independent tidy data set with the average of each variable for each activity and each subject. 

Firstly, I read the test dataset and train dataset by read.csv command, respectively. After, the subject and acitivity 
type are appended to the left side of test dataframe or train dataframe just created by cbind command.
Then I merge this two dataframe by rbind command to be "data".

After that, I get the names 561 features and combine them with subject and activity to form a vector and this was assigned
to be the column nanmes of the merged dataframe "data".

With this information I use grep to extract the columns that have measurements for std and mean and obtain the dataframe
"datafinal", that is one of the tidy dataset I have uploaded.

With the "datafinal" data.frame, I need to use gsub to accomplish the goal " using descriptive activity names to name 
the activities in the data set".

After these, I created the dataMelt by melt command and generated independent tidy data set with the average of each variable
for each activity (dataactivityMean)  and each subject(datasubjectMean) by dcast command based on dataMelt. 

