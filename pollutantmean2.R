pollutantmean2 <- function(directory, pollutant, id = 1:332) {
        listfiles <- list.files(directory, full.names=TRUE)
        dat <- data.frame()
        for(i in id){
                dat <- rbind(dat,read.csv(listfiles[i]))
        }
        mean(dat[,pollutant],na.rm=TRUE)
}