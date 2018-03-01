# Лекция #3. Источники данных

# Разнородность источников данных

# Модели и структуры данных. Немного про реляционную алгебру

# Плоские таблицы данных

#Скрипт демонстрации работы с источниками данных

#___________________ LAB 1____________________________________
###############################################################

# 1. Класический вариант загрузки данных (.csv and .txt файлы)


# Загрузка FORA.csv и signal.txt из Working directory
forecast.values <- read.csv("d:\\projects\\R.Lab\\LAB\\LAB 1\\Code_Lab1\\FORA.csv", sep = ",")

#
typeof(forecast.values)


dim(forecast.values)


# Вывод первых строк загруженных данных
head(forecast.values)
tail(forecast.values)

# Просмотр имен столбцов
names(forecast.values)
dimnames(mydat)



#Можно посмотреть загрузку с другими параметрами

data.signal <-read.table("d:\\projects\\R.Lab\\LAB\\LAB 1\\Code_Lab1\\signal.txt",sep = "\t")
head(data.signal)




# 2. Загрузка данных из других пакетов R
# Загрузка набора данных M3 из пакета Mcomp
library("Mcomp")

#http://cran.r-project.org/

data3 <- data(M3, package="Mcomp")

# Получить структуру данных
str(data3)

# 3. Загрузка данных из интернета
# Для этого воспользуемся пакетом RCurl
# Установка пакета Rcurl
install.packages(RCurl)

# вызов пакета Rcurl
library(RCurl)

# получение данных из интернета
data <- getURL('https://raw.githubusercontent.com/vincentarelbundock/Rdatasets/master/csv/datasets/AirPassengers.csv',
               ssl.verifyhost=FALSE, ssl.verifypeer=FALSE)

# Чтение данных
myfile<- read.csv(textConnection(data), sep = ",", header = TRUE)
head(myfile)

#######################################################################
# 4. Получение свойств данных
# посмотреть начальные строки объекта
head(myfile)

# посмотреть последние строки объекта
tail(myfile)

# общая информация об объекте
summary(myfile)

# внутренняя структура объекта
str(myfile)

# размерности объекта
dim(myfile)

# имена размерностей объекта
dimnames(myfile)

# имена объекта
names(myfile)

# число элементов
length(myfile)

#######################################################################

# 5. Работа с Data Frame

# создание нового фрейма данных
name <- c("Nicole Y.", "Jane B.", "Pink T.", "Floyd W.", "Sam S.", "George J.")
weight <- c(60, 68, 71, 87, 67, 93)
height <- c(174, 168, 178, 188, 165, 172)
size <- c("L", "S", "XL", "XXL", "S", "M")
sex <- c("male", "female", "male", "male", "female", "male")
data <- data.frame(name, weight, height, size, sex)
data

# отобрать все колонки кроме 1-ого
data[,-1]
# или
data[,2:4]

# отобрать column weight
data$weight

#Отобрать только данные, относящиеся к женщинам
data[data$sex == "female",]


#Вычисление числа строк, удовлетворяющих условиям

length(subset(data, weight > 80)$weight)
length(data[data$weight > 80,]$weight)


# отобрать нужные данные с помощью команды subset
data1 <- subset(data, sex == "male")
data2 <- subset(data, height >= 168 & sex == "male")

#сортировка 
data[order(data$weight), ]

# отсортировать наши данные сначала по полу, а потом по росту
data[order(data$sex, data$height), ]


#Удаление элементов 
df.lowweight <- subset(data, weight <= 80 )
length(subset(df.lowweight, weight > 80)$weight)

#______________________LAB1____________________________________________

