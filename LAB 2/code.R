
# 2.1 Creating a scatter plot
###################################################################
#Using plot()
plot(mtcars$wt, mtcars$mpg)

#Using ggplot2
library(ggplot2)
qplot(mtcars$wt, mtcars$mpg)

# Using ggplot2 if the two vectors are already in the same data frame
qplot(wt, mpg, data=mtcars)
# This is equivalent to:
ggplot(mtcars, aes(x=wt, y=mpg)) + geom_point()
####################################################################



# 2.2 Creating a Line Graph
####################################################################
# Using plot()
plot(pressure$temperature, pressure$pressure, type="l")
# add points and/or multiple lines
plot(pressure$temperature, pressure$pressure, type="l")
points(pressure$temperature, pressure$pressure)
lines(pressure$temperature, pressure$pressure/2, col="red")
points(pressure$temperature, pressure$pressure/2, col="red")

# Using ggplot2
library(ggplot2)
qplot(pressure$temperature, pressure$pressure, geom="line")

#Using ggplot2 if two vectors are already in the same data frame
qplot(temperature, pressure, data=pressure, geom="line")
# This is equivalent to:
ggplot(pressure, aes(x=temperature, y=pressure)) + geom_line()
# Lines and points together
qplot(temperature, pressure, data=pressure, geom=c("line", "point"))
# Equivalent to:
ggplot(pressure, aes(x=temperature, y=pressure)) + geom_line() + geom_point()
#####################################################################


#2.3 Creating a Bar Graph
####################################################################
# Using barplot()
barplot(BOD$demand, names.arg=BOD$Time)

# Using ggplot2
library(ggplot2)
qplot(BOD$Time, BOD$demand, geom="bar", stat="identity")
# Convert the x variable to a factor, so that it is treated as discrete
qplot(factor(BOD$Time), BOD$demand, geom="bar", stat="identity")

# Using ggplot2 If the vector is in a data frame
# Bar graph of values. This uses the BOD data frame, with the
#"Time" column for x values and the "demand" column for y values.
qplot(Time, demand, data=BOD, geom="bar", stat="identity")
# This is equivalent to:
ggplot(BOD, aes(x=Time, y=demand)) + geom_bar(stat="identity")
##################################################################


# 2.4 Creating a Histogram
##################################################################
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
##################################################################


# 2.5 Creating a Box Plot
####################################################################
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
####################################################################






