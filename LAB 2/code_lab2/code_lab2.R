
#___________________________LAB 2____________________________________

# Преджде, чем начать работу надо установить необходимые пакеты
# Установить пакет ggplot2 для визуализации данных
install.pacakges("ggplot2"

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
# Convert the x variable to a factor, so that it is treated as discrete
qplot(factor(BOD$Time), BOD$demand, geom="bar", stat="identity")

# Если два вектора в одном фрейме данных
# Bar graph of values. This uses the BOD data frame, with the
#"Time" column for x values and the "demand" column for y values.
qplot(Time, demand, data=BOD, geom="bar", stat="identity")
# эквивален:
ggplot(BOD, aes(x=Time, y=demand)) + geom_bar(stat="identity")
##############################################################################


# 2.4 Creating a Histogram
# Using hist()
hist(mtcars$mpg)
# Specify approximate number of bins with breaks
hist(mtcars$mpg, breaks=10)

# Using ggplot2
qplot(mtcars$mpg)

# Using ggplot2 if the vector is in a data frame
library(ggplot2)
qplot(mpg, data=mtcars, binwidth=4)
# This is equivalent to:
ggplot(mtcars, aes(x=mpg)) + geom_histogram(binwidth=4)
###############################################################################


# 2.5 Creating a Box Plot
# Using plot()
plot(ToothGrowth$supp, ToothGrowth$len)

# If the two vectors are in the same data frame
# Formula syntax
boxplot(len ~ supp, data = ToothGrowth)
# Put interaction of two variables on x-axis
boxplot(len ~ supp + dose, data = ToothGrowth)

# Using ggplot2
library(ggplot2)
qplot(ToothGrowth$supp, ToothGrowth$len, geom="boxplot")
qplot(ToothGrowth$supp, ToothGrowth$len, geom="boxplot")

# Using ggplot2 If the two vectors are already in the same data frame
qplot(supp, len, data=ToothGrowth, geom="boxplot")
# This is equivalent to:
ggplot(ToothGrowth, aes(x=supp, y=len)) + geom_boxplot()
##################################################################################

#___________________________LAB 2_________________________________________________





