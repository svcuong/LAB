

#___________________ LAB 1____________________________________
###############################################################

# 1. Класический вариант загрузки данных (.csv and .txt файлы)
# Выбрать Working directory
setwd("~/R/LAB1")

# Загрузка FORA.csv и signal.txt из Working directory
data1 <- read.csv("d:\\Projects\\R.LAB\\LAB\\LAB 1\\Code_Lab1\\FORA.csv", sep = ";")
data2 <- data <- read.table("d:\\Projects\\R.LAB\\LAB\\LAB 1\\Code_Lab1\\signal.txt",sep = "\t")

# посмотреть начальные строки объекта
head(data1)
head(data2)

# 2. Загрузка данных из других пакетов R
# Загрузка набора данных M3 из пакета Mcomp
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
name <- c("Kolia", "Jenhia", "Sasha", "Kastia", "Vasia", " Jora")
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

# отобрать нужные данные с помощью команды subset
data1 <- subset(data, sex == "male")
data2 <- subset(data, height >= 168 & sex == "male")

# отсортировать наши данные сначала по полу, а потом по росту
data[order(data$sex, data$height), ]

#______________________LAB1____________________________________________





