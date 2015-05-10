source("downloadAndRead.R")

# the action is split between plot1() and doPlot1()
# in order to be able to include this plot in another plot

doPlot1 <- function(df, xlab, ylab) {
    hist(df$Global_active_power, col="red", main="Global Active Power", xlab=xlab, ylab=ylab, breaks=12);
}

plot1 <- function() {
    df <- downloadAndRead();
    png(filename="plot1.png", width=480, height=480);
    doPlot1(df, "Global Active Power (kilowatts)", "Frequency");
    dev.off();
}
