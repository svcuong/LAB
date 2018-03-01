
#___________________ Задания для Лабораторной работы № 2___________________________________________

###################################################################################################
# Задание 1: Загрузка набора данных (Labour Training Evaluation Data) из источника данных:
#url<https://raw.githubusercontent.com/vincentarelbundock/Rdatasets/master/csv/DAAG/nsw74psid1.csv>

library(RCurl)
myfile <- getURL('https://raw.githubusercontent.com/vincentarelbundock/Rdatasets/master/csv/DAAG/nsw74psid1.csv', ssl.verifyhost=FALSE, ssl.verifypeer=FALSE)
mydat <- read.csv(textConnection(myfile), header=T)
head(mydat)

# Задание 1.1: Построение scatter plot для columns age и re74 из mydat с использованием базовой функции
plot(mydat$age, mydat$re74)

# Задание 1.2: Построение scatter plot для columns age и re74 из mydat с использованием пакета ggplot2
library(ggplot2)
qplot(mydat$age, mydat$re74)

# или:
qplot(age, re74, data=mydat)

# или:
ggplot(mydat, aes(x=age, y=re74)) + geom_point()

# Задание 1.3: Построение Box Plot для re74 от black из mydat с использованием базовой функции plot()
plot(as.factor(mydat$black), mydat$re74)
# или:
boxplot(re74 ~ black, data = mydat)

# Задание 1.4: Построение Box Plot для re74 от black из mydat с использованием пакета ggplot2
library(ggplot2)
qplot(as.factor(mydat$black), mydat$re74, geom="boxplot")
# или:
ggplot(mydat, aes(x=as.factor(black), y=re74)) + geom_boxplot()

# Задание 1.5: Вычисление количества элементов с black =0 и black =0. Создание фрейма данных из релуьтатов 
# вычисления с 2 columns black и count, и построение bar graph для этого фрейма.
black <- as.factor(c(0, 1))
count0 <- length(subset(mydat, black == 0)$black)
count1 <- length(subset(mydat, black == 1)$black)
count <- c(count0, count1)
df <- data.frame(black, count)
df
barplot(df$count, names.arg=df$black)

#################################################################################################################

# Задание 2: Загрузка набора данных AirPassengers из источника данных: 
# url <https://raw.githubusercontent.com/vincentarelbundock/Rdatasets/master/csv/datasets/AirPassengers.csv>
myfile <- getURL('https://raw.githubusercontent.com/vincentarelbundock/Rdatasets/master/csv/datasets/AirPassengers.csv', ssl.verifyhost=FALSE, ssl.verifypeer=FALSE)
mydat <- read.csv(textConnection(myfile), header=T)
head(mydat)

#Задание 2.1: построение Line Graph зависимости AirPassengers от time для этого набора данных с использованием
# базовой функции.
plot(mydat$time, mydat$AirPassengers, type = "l")

#Задание 2.2:построение Line Graph зависимости AirPassengers от time для этого набора данных с использованием
# пакета ggpot2
library(ggplot2)
qplot(mydat$time, mydat$AirPassengers, geom="line")
# или:
qplot(time, AirPassengers, data=mydat, geom="line")
# или:
ggplot(mydat, aes(x=time, y=AirPassengers)) + geom_line()

#####################################################################################################################

#___________________ Задания для Лабораторной работы № 2___________________________________________
