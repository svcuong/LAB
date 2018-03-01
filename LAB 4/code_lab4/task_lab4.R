

#___________Задания для Лабораторной работы № 4__________________________

##########################################################################
# dataset: longley: Longley's Economic Regression Data
# Predict number of people employed from economic variables

###########################################################################
# Задание 1: Загрузка набора данных longley и у становка небходимых пакетов party
#url<https://raw.githubusercontent.com/vincentarelbundock/Rdatasets/master/csv/datasets/longley.csv>
library(RCurl)
ll.dataset <- getURL('https://raw.githubusercontent.com/vincentarelbundock/Rdatasets/master/csv/datasets/longley.csv', ssl.verifyhost=FALSE, ssl.verifypeer=FALSE)
longley.dataset <- read.csv(textConnection(ll.dataset), header=T)
head(longley.dataset)

install.packages("party") 


#############################################################################
# Задание 3: Изучение свойств набора данных longley
head(longley.dataset)
dim(longley.dataset)
str(longley.dataset)
summary(longley.dataset)

#############################################################################
# Задание 3: Linear Regression для longley dataset
# вызов небходимого пакета party
library(party)
# fit model
fit <- lm(Employed~., longley.dataset)
# summarize the fit
summary(fit)

# Сделать прогнозирование
predictions <- predict(fit, longley.dataset)
plot(predictions)
# оценки точности
rmse <- mean((longley$Employed - predictions)^2)
print(rmse)


#################################################################################################################
#___________ Кластеризация IRIS набора данных________________________________________________________________
# dataset: attitude:	The Chatterjee-Price Attitude Data
##############################################################
#url<https://raw.githubusercontent.com/vincentarelbundock/Rdatasets/master/csv/datasets/attitude.csv>

# # Задание 4: Загрузка набора данных attitude из источника:
#url<https://raw.githubusercontent.com/vincentarelbundock/Rdatasets/master/csv/datasets/attitude.csv>
attitude  <- getURL('https://raw.githubusercontent.com/vincentarelbundock/Rdatasets/master/csv/DAAG/nsw74psid1.csv', ssl.verifyhost=FALSE, ssl.verifypeer=FALSE)
attitude  <- read.csv(textConnection(myfile), header=T)
head(attitude)

#########################################################
# Задание 5: создание нового набора данных, состоящих из 2 columns age и edu из набора данных attitude. 
# Применение K-means с количество кластеров: 2
dat <- attitude[,c(3,4)]
head(dat)
# применение k-means clustering model путем использования функции kmeans
datCluster <- kmeans(dat, centers = 2, nstart = 100)
datCluster
#построение результатов
plot(dat, col =(datCluster$cluster +1), main="K-Means result with 2 clusters", pch=20, cex=2 )

###########################################################################################################
#_______________________________LAB 4_______________________________________________________________________
