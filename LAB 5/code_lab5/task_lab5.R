
#___________________ Задания для Лабораторной работы № 5___________________________________________
# datasets: IRIS-классификация цветков ириса по небольшому набору параметров
############################################################
# Задание 1.Загрузка набора данных IRIS и разбиене данных в training set and tsting set.
#вызов пакета neuralnet

data(iris)
iris.dataset <-iris
View(iris.dataset)

# Разбиение данных на 80% training и 20% testing
index <- createDataPartition(iris.dataset$Species, p=0.80, list=FALSE)
testset <- iris.dataset[-index,]
trainset <- iris.dataset[index,]

library(neuralnet)

#############################################################

# Задание 2. Добавить 3 столбца versicolor, setosa, и virginica на основе подобранных названий из столца
# Species

trainset$setosa = trainset$Species == "setosa"
trainset$virginica = trainset$Species == "virginica"
trainset$versicolor = trainset$Species == "versicolor"

# Задание 3: Обучение нейронной сети с функцией neuralnet из пакета neuralnet с 3 hidden neurons
model = neuralnet(versicolor + virginica + setosa~ Sepal.Length + Sepal.Width + Petal.Length + Petal.Width, trainset, hidden=3)
model
plot(model)
# 
#___________________ Задания для Лабораторной работы № 1___________________________________________