corr <- function(directory, threshold = 0) {
        ## 'directory' is a character vector of length 1 indicating
        ## the location of the CSV files
        
        ## 'threshold' is a numeric vector of length 1 indicating the
        ## number of completely observed observations (on all
        ## variables) required to compute the correlation between
        ## nitrate and sulfate; the default is 0
        
        ## Return a numeric vector of correlations
        compcases <- complete(directory,1:332)
        compcases_thres <- compcases[which(compcases[,"nobs"] > threshold),]
        files_full <- list.files(directory, full.names=TRUE)
        if(nrow(compcases_thres)>0){
                v <- c(1:nrow(compcases_thres))
                for(i in 1:nrow(compcases_thres)){
                        dataset <- read.csv(files_full[compcases_thres[i,1]])
                        x <- dataset$"sulfate"
                        y <- dataset$"nitrate"
                        v[i] <- cor(x,y,use="complete.obs")
                }
        }else{
                v <- vector("numeric", length = 0) 
        }
        return(v)
}
