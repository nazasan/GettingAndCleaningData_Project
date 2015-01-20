run_analysis <- function() {
        library(plyr)
        ## Call to the merge function
        Oridata <- mergeData()
        ## Call to the extract function
        FilterData <- extractData(Oridata)
        
        ## Creates a second, independent tidy data set with the average of each variable 
        ## for each activity and each subject.
        # Run the functions mean on the value of "change" for each group, 
        # broken down by subject and activity
        AvgData <- ddply(FilterData, .(subject, activity), colwise(mean))
        
        ## Export the final data to a txt file
        write.table(AvgData,file="AvgData.txt",row.names=FALSE)
}