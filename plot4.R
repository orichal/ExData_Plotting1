source("downloadAndRead.R");
source("plot2.R");
source("plot3.R");

doPlot4 <- function(df) {
    par(mfcol = c(2, 2));
    doPlot2(df, "", "Global Active Power");
    doPlot3(df, "", "Energy sub metering", "n");
    with(df, plot(DateTime, Voltage, type="l", xlab="datetime", ylab="Voltage"));
    with(df, plot(DateTime, Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power"));
}

plot4 <- function() {
    png(filename="plot4.png", width=480, height=480);
    df <- downloadAndRead();
    doPlot4(df);
    dev.off();
}

