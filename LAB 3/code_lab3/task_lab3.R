
#___________Задания для Лабораторной работы № 3__________________________

##########################################################################

# Задание 1: загрузка набора данных AirPassengers и необходимых пакетов для работы, 
# деления набора данных на train data и test data
# прогнозирования
library(ggplot2)
library(forecast)

x <- AirPassengers

length(x)
k <- time(x)[100]
# деления набора данных на train data и test data

trainx <- window(x, end=k-1)
testx <- window(x, start= k)
#########################################################################

# Задание 2: Использование метода Benchmark forecasting - naive для прогнозирования

fc <- snaive(trainx)
fc
autoplot(fc)

# Задание 3: Использование метода Использование Exponential smoothing для прогнозирования

fitets <- ets(trainx)
fcfitets
autoplot(fcfitets)

# Задание 4: Использование метода Использование Exponential smoothing для прогнозирования
arimats <- auto.arima(trainx)
fcarimats <- forecast(arimats)
fcarimats
autoplot(fcarimats)

#______________________LAB 3_________________________________________________________


