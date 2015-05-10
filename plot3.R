source("downloadAndRead.R")

# the action is split between plot3() and doPlot3()
# in order to be able to include this plot in another plot

doPlot3 <- function(df, xlab, ylab, bty) {
    with(df, plot(DateTime, Sub_metering_1, type="l", col="black", xlab=xlab, ylab=ylab));
    with(df, points(DateTime, Sub_metering_2, type="l", col="red"));
    with(df, points(DateTime, Sub_metering_3, type="l", col="blue"));
    legend("topright", lty="solid", lwd=1, bty=bty, col=c("black", "red", "blue"), legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
}

plot3 <- function() {
    png(filename="plot3.png", width=480, height=480);
    df <- downloadAndRead();
    doPlot3(df, "", "Energy sub metering", "O");
    dev.off();
}
