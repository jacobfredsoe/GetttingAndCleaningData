## CodeBook.md

### Variables:
-**subjectID:** Identifies the subject who performed the activity for each window sample. Its range is from 1 to 30.
-**activityID:** Identifies the activity performed by the subject. Its range is from 1 to 6. See UCIDataset\activity_labels.txt for details
-**Others:** The features come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. See UCIDataset\features_info.txt for details

### Steps taken to produce the tidy data set:
1) The subjectID and activityID was added to the train and test set
2) The test and train set was merged based on subjectID and activityID and the feature names was added
3) Data from a subset of feature was extracted (those containing 'mean' or 'std')
4) On this subset the mean was calculated for each feature for each subject and each activity
5) The means were saved to a file, called tidyData.txt

