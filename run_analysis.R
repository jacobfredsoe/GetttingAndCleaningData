### Reading in the data ###
# Generel information
activity_labels = read.table("./UCIDataset/activity_labels.txt")
features = read.table("./UCIDataset/features.txt")

# Test data
x_test = read.table("./UCIDataset/test/X_test.txt")
y_test = read.table("./UCIDataset/test/Y_test.txt")
subject_test = read.table("./UCIDataset/test/subject_test.txt")

# Train data
x_train= read.table("./UCIDataset/train/X_train.txt")
y_train = read.table("./UCIDataset/train/Y_train.txt")
subject_train = read.table("./UCIDataset/train/subject_train.txt")


### Formating of data ###
library(dplyr)
# Add SubjectID and ActivityID to test set
x_test = mutate(x_test, SubjectID = unlist(subject_test), ActivityID = factor(unlist(y_test), labels = activity_labels$V2))

# Add SubjectID and ActivityID to train set
x_train = mutate(x_train, SubjectID = unlist(subject_train), ActivityID = factor(unlist(y_train), labels = activity_labels$V2))

# Merge the test and train set, based on SubjectID and ActivityID
mergedData = join(x_test, x_train, by = c("SubjectID", "ActivityID"), type = "full")
colnames(mergedData)[1:(ncol(x_test)-2)] = as.character(features$V2) #Renaming the columns to fit with the feature, and 

# Extract the mean and standard deviation data
meanCol = grep("mean", colnames(mergedData)) # Columns with mean
stdCol = grep("std", colnames(mergedData)) # Columns with std
meanStdCol = c("SubjectID", "ActivityID", colnames(mergedData)[sort(c(meanCol, stdCol))]) # Combined with subject and activity

# A subset that contains on the data from the means and standard deviations
meanStdData = mergedData[,meanStdCol]

### Calculations on the data ###
# Initiating the data frame to hold the data
results = data.frame()

# Loop though each subject and calculate the mean for each activity
for(Id in sort(unique(meanStdData$SubjectID))) {
  
  # Select only the data for the subject in question
  subjectData = filter(meanStdData, SubjectID == Id)
  
  # Use apply to calculate the colMeans for all data except activityID and subject ID for each type of activity
  subjectActivityData = data.frame(t(sapply(unique(subjectData$ActivityID), function(activity) colMeans(select(filter(subjectData, ActivityID == activity), -contains("ID")), na.rm = TRUE))))
  
  # Add the subjectID and activityID back
  subjectActivityData = cbind(SubjectID = rep(Id, nrow(subjectActivityData)), ActivityID = factor(unique(subjectData$ActivityID)), subjectActivityData)
  
  # Save the result in the data frame
  results = rbind(results, subjectActivityData)
}

### Save data to file ###
write.table(results, "tidyData.txt", row.names = FALSE)



