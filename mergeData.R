mergeData <- function() {
        library(data.table)
        ## Read data from directory
        ## Read Test data
        subjectTest <- read.table("./UCI HAR Dataset/test/subject_test.txt")
        names(subjectTest) <- c("subject")
        ##subjectTest <-as.data.table(subjectTest)
        XTest <- read.table("./UCI HAR Dataset/test/X_test.txt")
        ##XTest <-as.data.table(subjectTest)
        YTest <- read.table("./UCI HAR Dataset/test/y_test.txt")
        names(YTest) <- c("activity")
        ##YTest <-as.data.table(subjectTest)
        dataTest <- cbind(subjectTest,XTest,YTest)
        ##dataTest <-as.data.table(dataTest)
        ## Read Train data
        subjectTrain <- read.table("./UCI HAR Dataset/train/subject_train.txt")
        names(subjectTrain) <- c("subject")
        ##subjectTrain <-as.data.table(subjectTest)
        XTrain <- read.table("./UCI HAR Dataset/train/X_train.txt")
        ##XTrain <-as.data.table(subjectTest)
        YTrain <- read.table("./UCI HAR Dataset/train/y_train.txt")
        names(YTrain) <- c("activity")
        ##YTrain <-as.data.table(subjectTest)
        dataTrain <- cbind(subjectTrain,XTrain,YTrain)
        ##dataTrain <-as.data.table(dataTrain)
        ## Merge in one data set
        dataTotal <- rbind(dataTest,dataTrain)
        dataTotal
}