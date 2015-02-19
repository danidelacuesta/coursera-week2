complete <- function(directory, id = 1:332) {
        ## 'directory' is a character vector of length 1 indicating
        ## the location of the CSV files
        
        ## 'id' is an integer vector indicating the monitor ID numbers
        ## to be used
        
        ## Return a data frame of the form:
        ## id nobs
        ## 1  117
        ## 2  1041
        ## ...
        ## where 'id' is the monitor ID number and 'nobs' is the
        ## number of complete cases
        files_full <- list.files(directory, full.names=TRUE)
        tmp <- lapply(files_full[id], read.csv)
        data <- do.call(rbind, tmp)
        output <- data.frame(id=id,nobs=1:length(id))
        for(i in 1:length(id)){
                data_tmp <- data[which(data[,"ID"]==id[i]),]
                good <- complete.cases(data_tmp)
                output[i,2] <- nrow(data_tmp[good,])
        }
        print(output)
}
