
# Load packages
library(M3comp)
library(ggplot2)
library(forecast)

# Benchmark forecasting

timeseries <- M3[[1]]$x
fc <- snaive(timeseries)
autoplot(fc)

# Exponential smoothing

timeseries <- M3[[2000]]$x
fitets <- ets(timeseries)
fcfitets <- forecast(fitets)
autoplot(fcfitets)

# ARIMA models

timeseries <- M3[[2000]]$x
arimats <- auto.arima(timeseries)
fcarimats <- forecast(arimats)
autoplot(fcarimats)
