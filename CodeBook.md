# Getting and Cleaning Data Course Project

## Get the Data
* Download the file and named as dataset.zip
* Unzip the file
* List of files under folder UCI HAR Dataset
    + [1] "activity_labels.txt"                         
    + [2] "features_info.txt"                           
    + [3] "features.txt"                                
    + [4] "README.txt"                                  
    + [5] "test/Inertial Signals/body_acc_x_test.txt"   
    + [6] "test/Inertial Signals/body_acc_y_test.txt"   
    + [7] "test/Inertial Signals/body_acc_z_test.txt"   
    + [8] "test/Inertial Signals/body_gyro_x_test.txt"  
    + [9] "test/Inertial Signals/body_gyro_y_test.txt"  
    + [10] "test/Inertial Signals/body_gyro_z_test.txt"  
    + [11] "test/Inertial Signals/total_acc_x_test.txt"  
    + [12] "test/Inertial Signals/total_acc_y_test.txt"  
    + [13] "test/Inertial Signals/total_acc_z_test.txt"  
    + [14] "test/subject_test.txt"                       
    + [15] "test/X_test.txt"                             
    + [16] "test/y_test.txt"                             
    + [17] "train/Inertial Signals/body_acc_x_train.txt" 
    + [18] "train/Inertial Signals/body_acc_y_train.txt" 
    + [19] "train/Inertial Signals/body_acc_z_train.txt" 
    + [20] "train/Inertial Signals/body_gyro_x_train.txt"
    + [21] "train/Inertial Signals/body_gyro_y_train.txt"
    + [22] "train/Inertial Signals/body_gyro_z_train.txt"
    + [23] "train/Inertial Signals/total_acc_x_train.txt"
    + [24] "train/Inertial Signals/total_acc_y_train.txt"
    + [25] "train/Inertial Signals/total_acc_z_train.txt"
    + [26] "train/subject_train.txt"                     
    + [27] "train/X_train.txt"                           
    + [28] "train/y_train.txt"     

## Files in folder ‘UCI HAR Dataset’ that will be used are:
* features.txt': List of all features.
* activity_labels.txt: Links the class labels with their activity name

#### SUBJECT FILES
* test/subject_test.txt
* train/subject_train.txt: Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30.

#### ACTIVITY FILES
* test/X_test.txt: Test set.
* train/X_train.txt: Training set.

#### DATA FILES
* test/y_test.txt: Test labels.
* train/y_train.txt: Training labels.

* features.txt - Names of column variables in the dataSet
* activity_labels.txt - Links the class labels with their activity name.

## Read data from the targed files
* "subject" col names from SUBJECT FILES
* "activity" col names from DATA FILES 
* "feature[,2]" col names from feature.txt and assigned for ACTIVITY FILES

## Merge the data and test into one dataset
### Merge all activity, data file, subject into on train dataset 
> str(train_dataSet)  
 'data.frame':	7352 obs. of  563 variables:  
 $ activity                            : int  5 5 5 5 5 5 5 5 5 5 ..
 $ subject                             : int  1 1 1 1 1 1 1 1 1 1 ..
 $ tBodyAcc.mean...X                   : num  0.289 0.278 0.28 0.279 0.277 ..
 $ tBodyAcc.mean...Y                   : num  -0.0203 -0.0164 -0.0195 -0.0262 -0.0166 ..
 $ tBodyAcc.mean...Z                   : num  -0.133 -0.124 -0.113 -0.123 -0.115 ..
 $ tBodyAcc.std...X                    : num  -0.995 -0.998 -0.995 -0.996 -0.998 ..
 $ tBodyAcc.std...Y                    : num  -0.983 -0.975 -0.967 -0.983 -0.981 ..
 
### Merge all activity, data file, subject into on test dataset 
> str(test_dataSet)  
'data.frame':	2947 obs. of  563 variables:  
 $ activity                            : int  5 5 5 5 5 5 5 5 5 5 ..
 $ subject                             : int  2 2 2 2 2 2 2 2 2 2 ..
 $ tBodyAcc.mean...X                   : num  0.257 0.286 0.275 0.27 0.275 ..
 $ tBodyAcc.mean...Y                   : num  -0.0233 -0.0132 -0.0261 -0.0326 -0.0278 ..
 $ tBodyAcc.mean...Z                   : num  -0.0147 -0.1191 -0.1182 -0.1175 -0.1295 ..
 $ tBodyAcc.std...X                    : num  -0.938 -0.975 -0.994 -0.995 -0.994 ..
 $ tBodyAcc.std...Y                    : num  -0.92 -0.967 -0.97 -0.973 -0.967 ..
 $ tBodyAcc.std...Z                    : num  -0.668 -0.945 -0.963 -0.967 -0.978 ..
 $ tBodyAcc.mad...X                    : num  -0.953 -0.987 -0.994 -0.995 -0.994 ..

### Merge train and set dataset into one dataset 
 > str(dataSet)  
'data.frame':	10299 obs. of  563 variables:  
 $ activity                            : int  5 5 5 5 5 5 5 5 5 5 ..
 $ subject                             : int  1 1 1 1 1 1 1 1 1 1 ..
 $ tBodyAcc.mean...X                   : num  0.289 0.278 0.28 0.279 0.277 ..
 $ tBodyAcc.mean...Y                   : num  -0.0203 -0.0164 -0.0195 -0.0262 -0.0166 ..
 $ tBodyAcc.mean...Z                   : num  -0.133 -0.124 -0.113 -0.123 -0.115 ..
 $ tBodyAcc.std...X                    : num  -0.995 -0.998 -0.995 -0.996 -0.998 ..
 $ tBodyAcc.std...Y                    : num  -0.983 -0.975 -0.967 -0.983 -0.981 ..



