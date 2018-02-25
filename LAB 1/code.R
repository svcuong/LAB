
# Create data frame

name <- c("Kolia", "Jenhia", "Sasha", "Kastia", "Vasia", " Jora")
weight <- c(60, 68, 71, 87, 67, 93)
height <- c(174, 168, 178, 188, 165, 172)
size <- c("L", "S", "XL", "XXL", "S", "M")
sex <- c("male", "female", "male", "male", "female", "male")
data <- data.frame(name, weight, height, size, sex)
data

#
data[,-1]
data[,2:4]
data$weight
data[data$sex == "female",]
data1 <- subset(data, sex == "male")
data1
data2 <- subset(data, height >= 168 & sex == "male")
data2
# sort data
data[order(data$sex, data$height), ]

