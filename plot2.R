source("downloadAndRead.R")

# the action is split between plot2() and doPlot2()
# in order to be able to include this plot in another plot

doPlot2 <- function(df, xlab, ylab) {
    with(df, plot(DateTime, Global_active_power, type="l", xlab=xlab, ylab=ylab));
}

plot2 <- function() {
    png(filename="plot2.png", width=480, height=480);
    df <- downloadAndRead();
    doPlot2(df, "", "Global Active Power (kilowatts)");
    dev.off();
}
