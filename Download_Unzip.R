##Set your working directory:
setwd("Your working directory path here")

##Save your working directory in a variable named "wd"
wd<-getwd()

##Save the url in a variable named "fileUrl"
fileUrl<-"https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"

##Download the file to your working directory
download.file(fileUrl,destfile= paste(wd,"/Dataset.zip", sep=""))

##Unzip the file
unzip("Dataset.zip")