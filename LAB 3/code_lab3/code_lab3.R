
#______________________________________LAB 2____________________________________

# Преджде, чем начать работу надо установить необходимые пакеты
# Установить пакет ggplot2 для визуализации данных
install.pacakges("ggplot2")
# Установить пакет Mcomp для иллюстрационных наборов данных (3003 временных рядов) 
install.pacakges("Mcomp")
# Установить пакет forecast для прогнозирования
install.pacakges("forecast")
# вызывать эти пакеты для работы
library(M3comp)
library(ggplot2)
library(forecast)

#################################################################################
# 1. Использование Benchmark forecasting

timeseries <- M3[[1]]$x
fc <- snaive(timeseries)
autoplot(fc)

# 1.1 Вычислить residuals и построить их ACF
es <- residuals(fc)
ggtsdisplay(res, plot.type="scatter")

#################################################################################
# 2. Использование Exponential smoothing

timeseries <- M3[[2000]]$x
fitets <- ets(timeseries)
fcfitets <- forecast(fitets)
autoplot(fcfitets)

##################################################################################
# 3. Использование ARIMA models

timeseries <- M3[[2000]]$x
arimats <- auto.arima(timeseries)
fcarimats <- forecast(arimats)
autoplot(fcarimats)

###################################################################################

#______________________________________LAB 2_______________________________________
