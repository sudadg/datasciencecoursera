
library(plyr)


##############Downloading the zip files for the mentioned location ######################
#NewURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
#download.file(NewURL,destfile = "data.zip")



#Step 1
#Reading Train files (X_train.txt,Y_train and subject_train.txt) and asigning to variable

x_train <- read.table("train/X_train.txt")
y_train <- read.table("train/y_train.txt")
sub_train <- read.table("train/subject_train.txt")


#Reading test files (X_test.txt,Y_test.txt and subject_test.txt) and asigining to variable

x_test <- read.table("test/X_test.txt")
y_test <- read.table ("test/Y_test.txt")
sub_test <- read.table("test/subject_test.txt")


#Merging respective train and test data.

x_data <- rbind(x_train,x_test)
y_data <- rbind(y_train,y_test)
sub_data <- rbind(sub_train,sub_test)



#Step 2
# Extracts only the measurement on  the mean and standard

features <- read.table("features.txt")
#features[,2]
mean_std <- grep("-(mean|std)\\(\\)", features[,2])
#head(mean_std)
x_data <- x_data[,mean_std]
#head(x_data)

names(x_data) <- features[mean_std,2]

#names(x_data)


#Step 3
#Uses descriptive activity names to name the activities in 

activity <- read.table("activity_labels.txt")

#head(sub_data)

y_data[,1] <- activity[y_data[,1],2]

names(y_data) <- "activity"


#Step 4
#Appropriately labels the data set with descriptive activity  names. 

names(sub_data) <- "subject"



# Step5. 
#Creates a second, independent tidy data set with the average of 
# each variable for each activity and each subject.

tot_data <- cbind(x_data,y_data,sub_data)
#dim(tot_data)
averages_data <- ddply(tot_data, .(subject, activity), function(x) colMeans(x[, 1:66]))
write.table(averages_data,"averages_data.txt", row.name=FALSE)





