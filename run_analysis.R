run_analysis <- function() {
        ## Include plyr library to use ddply function
        library(plyr)
        
        ## Step 1 -> Call to the merge function
        Oridata <- mergeData()
        ## Step 2 -> Call to the extract function
        FilterData <- extractData(Oridata)
        
        ## Step 3 -> New data set
        ## Creates a second, independent tidy data set with the average of each variable 
        ## for each activity and each subject.
        # Run the functions mean for each group, 
        # broken down by subject and activity
        AvgData <- ddply(FilterData, .(subject, activity), colwise(mean))
        
        ## Step 4 -> Export the final data to a txt file
        write.table(AvgData,file="AvgData.txt",row.names=FALSE)
}