# Note for the Peer Reviewer:
# Please install the necessary packages when running the below script

# 1. SET ENVIRONMENT
    remove(list=ls())
    cat("\014")

    R.version.string
    update.packages(ask = FALSE)
    
    library(stringr)
    library(dplyr)
    
# 2. DOWNLOAD DATA FROM EXTERNAL DATA SOURCE
    getwd()
    ds_url <- 'http://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip'
    ds_zipname <- 'UCI HAR Dataset.zip'
    
    if(!file.exists('.//UCI HAR Dataset')){
        download.file(ds_url, ds_zipname, method='curl')
        unzip(ds_zipname)
    }
    
# 3. IMPORT DOWNLOADED DATA
    #Subject Data
    subject_train <- read.table('./UCI HAR Dataset/train/subject_train.txt')
    subject_test <- read.table('./UCI HAR Dataset/test/subject_test.txt')
    
    #Activity Data
    activity_train <- read.table('./UCI HAR Dataset/train/y_train.txt')
    activity_test <- read.table('./UCI HAR Dataset/test/y_test.txt')
    
    #Value
    value_train <- read.table('./UCI HAR Dataset/train/X_train.txt')
    value_test <- read.table('./UCI HAR Dataset/test/X_test.txt')
    
    #Labels and Codes
    features <- read.table('./UCI HAR Dataset/features.txt')
    activity_code <- read.table('./UCI HAR Dataset/activity_labels.txt')
    
# 4. MERGE AND APPEND DATASETS 
    #Append Train and Test
    har <- rbind(
        #Train - Merge -  subject, activity, value
        cbind(subject_train, activity_train, value_train,source= 'train'),
        #Test - Merge - subject, activity, value
        cbind(subject_test, activity_test, value_test,source= 'test')
    )
# 5. ASSIGN VARIABLE NAMES
    colnames(har) <- c('subject','activity',as.character(features[,2]),'source')
 
# 6. SELECT RELEVANT COLUMNS
    #Select only the columns subject, activity, source, and measures on mean and standard deviation
    har <- har[,grepl('subject|activity|mean|std|source',colnames(har))]
    
# 7. REPLACE ACTIVITY CODE WITH ACTIVITY NAME
    har$activity <- factor(har$activity, levels = activity_code[,1], labels=activity_code[,2])

# 8. GENERATE AVERAGE OF MEASURES BY ACTIVITIES & SUBJECTS
    har_act_sub_means <- har %>% 
                            select(activity,subject,'tBodyAcc-mean()-X':'fBodyBodyGyroJerkMag-meanFreq()',-source) %>% 
                            group_by(activity, subject) %>% 
                            summarise_all(funs(mean)) %>% 
                            arrange(activity, subject)
    
# 9. EXPORT TIDY DATA (MEANS OF MEASURES ON EACH ACTIVITIES & SUBJECTS)
    write.table(har_act_sub_means,'tidydata.txt',row.names = FALSE, quote = FALSE)
    