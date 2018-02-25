ibrary(neuralnet)

# 1. creating the initial data, plotting
data <- data.frame (
  input = c(0.225, 690, 2313, 2931, 4061, 4937, 5809, 7096, 8803, 10095, 12229, 13572),
  output = c(0.118, 274, 949, 1270, 1668, 2001, 2434, 3028, 3393, 4519, 5594, 7610)
)
plot(data$output ~ data$input, main="Distribution of the pension relative to the salary", xlab="Salary", ylab="Pension")

# 2. normalizing the data, plotting
min.input <- min(data$input)
min.output <- min(data$output)
range.input <- diff(range(data$input))
range.output <- diff(range(data$output))
data.norm <- data.frame (
  input = (data$input - min.input) / range.input,
  output = (data$output - min.output) / range.output
)
plot(data.norm$output ~ data.norm$input, main="Distribution of the pension relative to the salary (normalized)", xlab="Salary", ylab="Pension")

# 3. neural network
net <- neuralnet(output ~ input, data.norm)

# 4. test the output
testdata <- seq(0, 25000, by=500)
testdata.norm <- (testdata - min.input) / range.input
result <- round(compute(net, testdata.norm)$net.result * range.output + min.output)
plot(testdata, result, main="Predicred outcome", xlab="Salary", ylab="Pension")
