
#___________________________LAB 2____________________________________

# Преджде, чем начать работу надо установить необходимые пакеты
# Установить пакет ggplot2 для визуализации данных
install.pacakges("ggplot2")

######################################################################                 
# 1. Построение scatter plot
# Использовать базовую функцию plot()
plot(mtcars$wt, mtcars$mpg)

# Использовать пакет ggplot2
# Вызывать пакет ggplot2
library(ggplot2)
# Использовать функцию qplot                 
qplot(mtcars$wt, mtcars$mpg)

# Если два вектора в одном фрейме данных
qplot(wt, mpg, data=mtcars)
# эквивалено:
ggplot(mtcars, aes(x=wt, y=mpg)) + geom_point()
#########################################################################


# 2.2 Построение a Line Graph
# Использовать базовую функцию plot()
plot(pressure$temperature, pressure$pressure, type="l")
                 
# Добавить точек и линий
plot(pressure$temperature, pressure$pressure, type="l")
points(pressure$temperature, pressure$pressure)
lines(pressure$temperature, pressure$pressure/2, col="red")
points(pressure$temperature, pressure$pressure/2, col="red")

# Использовать пакет ggplot2
library(ggplot2)
qplot(pressure$temperature, pressure$pressure, geom="line")

# Если два вектора в одном фрейме данных
qplot(temperature, pressure, data=pressure, geom="line")
# эквивален:
ggplot(pressure, aes(x=temperature, y=pressure)) + geom_line()
# линии и точки вместе
qplot(temperature, pressure, data=pressure, geom=c("line", "point"))
# эквивален:
ggplot(pressure, aes(x=temperature, y=pressure)) + geom_line() + geom_point()
#############################################################################


#2.3 Построение Bar Graph
# Использовать базовую функцию barplot()
barplot(BOD$demand, names.arg=BOD$Time)

# Использовать пакет ggplot2
library(ggplot2)
qplot(BOD$Time, BOD$demand, geom="bar", stat="identity")
# преобразование x в фактор
qplot(factor(BOD$Time), BOD$demand, geom="bar", stat="identity")

# Если два вектора в одном фрейме данных
qplot(Time, demand, data=BOD, geom="bar", stat="identity")
# эквивален:
ggplot(BOD, aes(x=Time, y=demand)) + geom_bar(stat="identity")
##############################################################################


# 2.4 Поспроение Histogram
#  Использовать базовую функцию  hist()
hist(mtcars$mpg)
# Указать количество bins с breaks
hist(mtcars$mpg, breaks=10)

# Использовать пакет ggplot2
qplot(mtcars$mpg)
# Если два вектора в одном фрейме данных
library(ggplot2)
qplot(mpg, data=mtcars, binwidth=4)
# эквивален:
ggplot(mtcars, aes(x=mpg)) + geom_histogram(binwidth=4)
###############################################################################


# 2.5 Поспроение Box Plot
# Использовать базовую функцию  plot()
plot(ToothGrowth$supp, ToothGrowth$len)

# Если два вектора в одном фрейме данныхe
# Formula syntax
boxplot(len ~ supp, data = ToothGrowth)
# Put interaction of two variables on x-axis
boxplot(len ~ supp + dose, data = ToothGrowth)

# Использовать пакет ggplot2
library(ggplot2)
qplot(ToothGrowth$supp, ToothGrowth$len, geom="boxplot")
qplot(ToothGrowth$supp, ToothGrowth$len, geom="boxplot")

# Если два вектора в одном фрейме данных
qplot(supp, len, data=ToothGrowth, geom="boxplot")
# эквивален:
ggplot(ToothGrowth, aes(x=supp, y=len)) + geom_boxplot()
##################################################################################

#___________________________LAB 2_________________________________________________





