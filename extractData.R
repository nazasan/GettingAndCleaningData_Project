extractData <- function(data) {
        ## Read the features.txt file to xtract only the measurements of mean and 
        ## standard desviation
        features <- read.table("./UCI HAR Dataset/features.txt")
        
        ## Find variables whith mean() and std() in the name
        pattern1 <- 'mean()'
        pattern2 <- 'std()'
        selectFeatures <- data.frame()
        
        for(i in 1:561){
                if(grepl(pattern1,features[i,2])) {
                        temp <- features[i,]
                        selectFeatures <- rbind(selectFeatures,temp)
                }
                else if(grepl(pattern2,features[i,2])) {
                        temp <- features[i,]
                        selectFeatures <- rbind(selectFeatures,temp)
                }
        }
        
        ## Select the 1 column (subject)
        ## Measurements selected and last column (activity)
        lindex <- c(1,selectFeatures$V1+1,563)
        selectData <- data[,lindex]
        
        ## Change column names
        lnames <- data.frame(lapply(selectFeatures$V2, as.character), stringsAsFactors=FALSE)
        names(selectData) <- c("subject",lnames,"activity")
        
        ## Change activity names
        ## 1 WALKING
        ## 2 WALKING_UPSTAIRS
        ## 3 WALKING_DOWNSTAIRS
        ## 4 SITTING
        ## 5 STANDING
        ## 6 LAYING
        selectData$activity[selectData$activity==1] <- 'WALKING'
        selectData$activity[selectData$activity==2] <- 'WALKING_UPSTAIRS'
        selectData$activity[selectData$activity==3] <- 'WALKING_DOWNSTAIRS'
        selectData$activity[selectData$activity==4] <- 'SITTING'
        selectData$activity[selectData$activity==5] <- 'STANDING'
        selectData$activity[selectData$activity==6] <- 'LAYING'
        
        ## Return the data
        selectData
}