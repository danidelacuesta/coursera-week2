pollutantmean <- function(directory, pollutant, id = 1:332) {
        files_full <- list.files(directory, full.names=TRUE)
        tmp <- lapply(files_full[id], read.csv)
        data <- do.call(rbind, tmp)
        mean(data[,pollutant],na.rm=TRUE)
}