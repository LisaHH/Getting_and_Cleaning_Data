# Getting_and_Cleaning_Data
Repository for Getting and Cleaning Data Assignment

The following explains how all of the scripts work and how they are connected

Scripts in this repository (in the order in which they function):
•	“Download_Unzip.R”
•	“run_analysis.R”
•	“to_txt.R”

“Download_Unzip.R”
1.	Downloads the dataset (with all its components) to your working directory
2.	Unzips the dataset

“run_analysis.R”
1.	Reads the downloaded data into R (train dataset, test dataset, activity labels, subject numbers, feature variables)
2.	Adds the activity numbers and subject numbers to each observation as new columns  in the dataframes
3.	Renames the new columns as “Subject” and “Activity”
4.	Merges the train and test dataframes
5.	Sorts the merged dataset according to subject number and activity number
6.	Extracts only the measurements on mean and standard deviation for each measurement
7.	Applies the descriptive activity names to the activity column
8.	Applies the descriptive variable feature names  to the measurement columns
9.	Creates a second independent tidy dataset (“new”) with the average of each variable for each activity and each subject

“to_txt.R”
•	Creates a txt file from the final tidy data set (saved to your working directory)

