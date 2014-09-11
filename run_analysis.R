##You should create one R script called run_analysis.R that does the following. 
run_analysis <- function () { 
#Merges the training and the test sets to create one data set.
#Extracts only the measurements on the mean and standard deviation for each
#  measurement. 
#Uses descriptive activity names to name the activities in the data set
#Appropriately labels the data set with descriptive variable names. 
#From the data set in step 4, creates a second, independent tidy data set 
#  with the average of each variable for each activity and each subject.
setwd("./UCI HAR Dataset")
#Read the features 
features <- read.table("features.txt",sep=" ",quote="",header=FALSE)
names(features) <- c("FeatureID", "Feature")
#Identify the Features that are Mean and Standard Deviations
meanfeats <- features[grep("mean()", features$Feature,fixed=TRUE),]
stdfeats <- features[grep("std()", features$Feature, fixed=TRUE),]
relfeats <- rbind(meanfeats,stdfeats)
    
#Read the activity id and labels 
acts <- read.table("activity_labels.txt",sep=" ",quote="",header=FALSE)
names(acts) <- c("actID","activity_name")

#Read the Test Data 
testx <- read.table("./test/x_test.txt",sep="",header=FALSE)
testy <- read.table("./test/y_test.txt",sep="",header=FALSE)
subtest <- read.table("./test/subject_test.txt",sep="",header=FALSE)
testdf <- cbind(subtest,testy, testx)
#Read the Training Data 
trainx <- read.table("./train/X_train.txt",sep="",header=FALSE)
trainy <- read.table("./train/y_train.txt",sep="",header=FALSE)
subtrain <- read.table("./train/subject_train.txt",sep="",header=FALSE)
traindf <- cbind(subtrain,trainy, trainx)

#Combine both and give appropriate column names 
alldf <- rbind(testdf,traindf)
names(alldf) <- c("Subject","actID", as.character(features$Feature))
#Translate Activity ID to Activity - Merge with acts 
newalldf <- merge(alldf,acts, by.x="actID",by.y="actID",all.x=TRUE)
#Select only the mean and standard deviations columns and include activity-name
#  and subject 
selcols <- c(c("Subject","activity_name"),as.character(relfeats$Feature))
selectedDF <- subset(newalldf, select = selcols)
finaldf <- aggregate(.~Subject+activity_name, selectedDF,mean )
write.table(finaldf, file="final_tidy_dataset.txt",row.names=FALSE)
setwd("..")
} 