mergeData <- function() {
        ## Read data from directory
        ## Read Test data
        subjectTest <- read.table("./UCI HAR Dataset/test/subject_test.txt")
        ## Change column name for subjects
        names(subjectTest) <- c("subject")
        XTest <- read.table("./UCI HAR Dataset/test/X_test.txt")
        YTest <- read.table("./UCI HAR Dataset/test/y_test.txt")
        ## Change column name for activities
        names(YTest) <- c("activity")
        ## Merge all Test data
        dataTest <- cbind(subjectTest,XTest,YTest)
        
        ## Read Train data
        subjectTrain <- read.table("./UCI HAR Dataset/train/subject_train.txt")
        ## Change column name for subjects
        names(subjectTrain) <- c("subject")
        XTrain <- read.table("./UCI HAR Dataset/train/X_train.txt")
        YTrain <- read.table("./UCI HAR Dataset/train/y_train.txt")
        ## Change column name for activities
        names(YTrain) <- c("activity")
        ## Merge all Train data
        dataTrain <- cbind(subjectTrain,XTrain,YTrain)
        
        ## Merge in one data set
        dataTotal <- rbind(dataTest,dataTrain)
        
        ## Return the complete data set
        dataTotal
}