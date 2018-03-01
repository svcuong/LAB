
# Import dataset from different sources
# 1. URL using package data.table or Rcurl
library(data.table)
mydat <- fread('https://raw.githubusercontent.com/vincentarelbundock/Rdatasets/master/csv/DAAG/cps1.csv')
View(mydat)

# or
library(RCurl)
myfile <- getURL('https://raw.githubusercontent.com/vincentarelbundock/Rdatasets/master/csv/DAAG/cps1.csv', ssl.verifyhost=FALSE, ssl.verifypeer=FALSE)
class(myfile)

# how to get this into a data.frame object? use textConnection() to open a “connection” 
#with the string, much like you would open a connection with a file on your hard drive 
#in order to read it. Then we’ll have read.csv() (or you could use read.table() or fread() 
#or similar) to read the string object like a text file and create a data.frame object.

mydat <- read.csv(textConnection(myfile), header=T)
head(mydat)


# Import excel datasets
# Using readxl pacakge
library(readxl)
M3C <- read_excel("C:/Users/svcuo/Downloads/M3C.xls")
View(M3C)

# From Text (base)
FORA <- read.csv("~/GitHub/LAB/LAB 1/Code_Lab1/FORA.csv")
View(FORA)

# From Text (readr)
library(readr)
FORA <- read_csv("FORA.csv")
View(FORA)