weightmedian <- function(directory,day){
        files <- list.files(directory,full.names=TRUE)
        dat <- data.frame()
        for (i in 1:5){
                dat <- rbind(dat,read.csv(files[i]))
        }
        dat_day <- dat[which(dat[,"Day"] == day),]
        median(dat_day[,"Weight"],na.rm=TRUE)
}