
# download dataset if not exist
# read the dates 2007-02-01 and 2007-02-02 into a data frame
# return the data frame

downloadAndRead <- function() {
    library(RCurl);
    file <- "household_power_consumption.txt";
    reducedFile <- "household_power_consumption_reduced.txt";
    url <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip";
    zip <- "household_power_consumption.zip";
    if (!file.exists(reducedFile)) {
        download.file(url, zip, method="curl");
        unzip(zip);
        unlink(zip);
        print(paste0("Downloaded dataset and read: ", file));
        df <- read.table(file, sep=";", header=TRUE, na.strings="?");
        unlink(file);
        print(paste0("Reduce data"));
        df <- df[df[, 1] %in% c("1/2/2007", "2/2/2007"), ];
        write.table(df, file=reducedFile);
        print(paste0("Saved a reduced dataset: ", reducedFile));
    }
    else {
        print(paste0("Read an existing reduced dataset: ", reducedFile));
        df <- read.table(reducedFile);
    }


    df$DateTime<-strptime(paste(df$Date, df$Time, sep=" "), "%d/%m/%Y %H:%M:%S");
    return(df);
}
