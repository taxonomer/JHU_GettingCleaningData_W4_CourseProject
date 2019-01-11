# Course Project Code Book - JHU Data Science - Getting and Cleaning Data 

## Source Data

The input data was sourced from the [Human Activity Recognition Using Smartphones Data Set](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones) experiment.

Quick Links
The following link may help comprehend the objective and methodology of the experiment 
1. [Experiment demonstration video](https://www.youtube.com/watch?v=XOEN9W05_4A)
2. [The dataset](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)
3. [The dataset description](http://archive.ics.uci.edu/ml/machine-learning-databases/00240/UCI%20HAR%20Dataset.names)

### Experiment Data Collection Methodology

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, the researchers captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain.


### Input Variables

1. Subject -> (class=integer) A nominal code of 1:30 corresponding to the experiment subjects (persons). The data is sourced from 2 separate files (train/subject_train.txt;test/subject_test.txt)

2. Activity -> (class=integer) A nominal code of 1:6 corresponding to the experiment activity of the subject. The coding used is 1 = 'Walking', 2 = 'Walking Upstairs', 3 = 'Walking Downstairs', 4 = 'Sitting', 5 = 'Standing', 6 = 'Laying'. The data is sourced from 2 separate files (train/y_train.txt; train/y_test.txt)

3. Value -> (class=numeric) A 561 vector which are values for the time-domain signals and the frequency domain signals.


### Data Tidying Up Procedures

1. Setup Environment 

* Clear the R Studio workspace (list, variables, data) and R console
* Update R packages

2. Download data from external source

* Download data (through R) from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
* Unzip downloaded data

3. Import Downloaded Data
* Subject Data (Train and Test)
* Activity Data (Train and Test)
* Value (Train and Test)
* Labels and Codes (Features, Activity_Labels)

4. Merge and Append Datasets
* Merge Train Subject Data, Activity Data, and Value Data 
* Merge Test Subject Data, Activity Data, and Value Data 
* Append Train and Test Data
* Update variable names

5. Assign Variable Names
* 'subject' for subject data
* 'activity' for activity data
* the vector elements of the second column of features.txt for values data
* 'source' for data source trace

6. Select Columns
* subject
* activity
* measures on mean and standard deviation
* source

7. Replace Activity Code with Activity Name 
* activity name is sourced from activity_code data set

8. Generate mean for each measure variables grouping by:
* activity name
* subject

9. Export tidy data as text file




