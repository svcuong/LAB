library(neuralnet)

# 1. creating the initial data
mydata <- data.frame (
  input = c(0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10),
  output = c(0, 1, 4, 9, 16, 25, 36, 49, 64, 81, 100)
)

attach(mydata)
names(mydata)

# Train the model based on output from input

model <- neuralnet(formula = output~input, 
                   data = mydata, hidden = 10, 
                   threshold = 0.01)

print(model)

# Lets plot and see layers
plot(model)

# Check the data - actual and predicted

final_output = cbind(input, output, as.data.frame(model$net.result))
colnames(final_output) = c("input", "expected output", "neural net output")

print(final_output)
