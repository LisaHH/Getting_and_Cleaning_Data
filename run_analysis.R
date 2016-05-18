##Save your working directory in a variable named "wd"
wd<-getwd()

##Read in the feature variables (columns?) for both sets
cn<-read.table(paste(wd, "/UCI HAR Dataset/features.txt",sep=""))

##Read in the training set

##Read in the activity labels for the training set
train.cn<-read.table(paste(wd, "/UCI HAR Dataset/train/y_train.txt",sep=""))

##Read in the subject names/numbers for the training set
train.rn<-read.table(paste(wd, "/UCI HAR Dataset/train/subject_train.txt",sep=""))

##Read in the training set into a variable named "train", with the feature variables as the column names
train<-read.table(paste(wd,"/UCI HAR Dataset/train/X_train.txt", sep=""), col.names=cn[,2] )

##Add the activity labels for each observation as a new column to the dataset
train2<-cbind(train.cn,train)

##Add the subject number for each observation as a new column to the dataset
train3<-cbind(train.rn,train2)

## Name the subject column as "Subject"
colnames(train3)[1]<-"Subject"

## Name the activity column as "Activity"
colnames(train3)[2]<-"Activity"

##Repeat the same procedure for the Test dataset

##Read in the activity labels for the test set
test.cn<-read.table(paste(wd, "/UCI HAR Dataset/test/y_test.txt",sep=""))

##Read in the subject names/numbers for the test set
test.rn<-read.table(paste(wd, "/UCI HAR Dataset/test/subject_test.txt",sep=""))

##Read in the test set into a variable named "test", with the feature variables as the column names
test<-read.table(paste(wd,"/UCI HAR Dataset/test/X_test.txt", sep=""), col.names=cn[,2] )

##Add the activity labels for each observation as a new column to the dataset
test2<-cbind(test.cn,test)

##Add the subject number for each observation as a new column to the dataset
test3<-cbind(test.rn,test2)

## Name the subject column as "Subject"
colnames(test3)[1]<-"Subject"

## Name the activity column as "Activity"
colnames(test3)[2]<-"Activity"

##Merge the training and test dataset into one
All<-rbind(train3,test3)

##Sort the merged set according to the subject number and the activity number
All2<-All[order(All$Subject,All$Activity),]

##Extract only the measurements on the mean and standard deviation for each measurement
All3<-All2[,c(1,2,3:8,43:48,83:88,123:128,163:168,203:204,216:217,229:230,242:243,255:256,268:273,
              347:352,426:431,505:506,518:519,531:532,544:545)]

##Read in the activity labels
act<-read.table(paste(wd, "/UCI HAR Dataset/activity_labels.txt",sep=""))

##Apply the activity names to the "Activity" column labels
All3$Activity<-as.character(All3$Activity)

All3$Activity[All3$Activity=="1"]<-"Walking"
All3$Activity[All3$Activity=="2"]<-"Walking_Upstairs"
All3$Activity[All3$Activity=="3"]<-"Walking_Downstairs"
All3$Activity[All3$Activity=="4"]<-"Sitting"
All3$Activity[All3$Activity=="5"]<-"Standing"
All3$Activity[All3$Activity=="6"]<-"Laying"

##Giving descriptive variable names to the dataset

##Load dplyr package
library(dplyr)

##New dataset with means:
new<-All3 %>% group_by(Subject,Activity)%>% summarise_each(funs(mean))
