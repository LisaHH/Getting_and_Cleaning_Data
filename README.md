# Getting_and_Cleaning_Data
##Repository for Getting and Cleaning Data Assignment
<br />
####Scripts in this repository (in the order in which they function):
* Download_Unzip.R
* run_analysis.R
* to_txt.R
<br  />


#####Download_Unzip.R
* Downloads the dataset (with all its components) to the working directory
* Unzips the dataset
<br  />


#####run_analysis.R
* Reads the downloaded data into R (train dataset, test dataset, activity labels, subject numbers, feature variables)
* Adds the activity numbers and subject numbers to each observation as new columns in the dataframes
* Renames the new columns as "Subject" and "Activity"
* Merges the train and test dataframes
* Sorts the merged dataframe according to the subject number and activity number
* Extracts only the measurements on mean and standard variation for each measurement
* Spplies the descriptive activity names to the activity numbers
* Applies the descriptive variable feauture names to the measurement columns
* Creates a second independent tidy dataset ("new") with the average of each variable for each activity and each subject
<br  />


#####to_txt.R
* Creates a txt file fom the final tidy dataset (saved to the working directory)
