## README.md

### Data obtained from:

Human Activity Recognition Using Smartphones Dataset  
Version 1.0  

Jorge L. Reyes-Ortiz, Davide Anguita, Alessandro Ghio, Luca Oneto.  
Smartlab - Non Linear Complex Systems Laboratory  
DITEN - Università degli Studi di Genova.  
Via Opera Pia 11A, I-16145, Genoa, Italy.  
activityrecognition@smartlab.ws  
www.smartlab.ws  

### Purpose
To create a dataset by first combining the test and train datasets and then 
subsetting the mean and standard deviation for each feature. Then a tidy dataset
is created from the average of each variable for each activity and each subject.

### Files contained in this repository:
- **README.md:** This file, describing the other files
- **CodeBook.md:** Description of the variables, the data, and any transformations done to the data
- **run_analysis.R**: R script that produces the tidyData.txt
- **tidyData.txt:** Tidy data produced by the run_analysis.R
- **UCIDataset\activity_labels.txt:** Links the class labels with their activity name
- **UCIDataset\features.txt:** List of all features
- **UCIDataset\features_info.txt:** Description of all the features
- **UCIDataset\test\subject_test.txt:** Each row identifies the subject who performed the activity for each window sample
- **UCIDataset\test\X_test.txt:** Test set
- **UCIDataset\test\Y_test.txt:** Test labels
- **UCIDataset\train\subject_train.txt:** Each row identifies the subject who performed the activity for each window sample
- **UCIDataset\train\X_train.txt:** Training set
- **UCIDataset\train\Y_train.txt:** Training labels
