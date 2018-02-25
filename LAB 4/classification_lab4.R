# extracting DWT coefficients (with Haar filter)
sc <- read.table("synthetic_control.data", header = F, sep = "")
library(wavelets)
wtData <- NULL

for (i in 1:nrow(sc)) {
  a <- t(sc[i,])
  wt <- dwt(a, filter="haar", boundary="periodic")
  wtData <- rbind(wtData, unlist(c(wt@W,wt@V[[wt@level]])))
  }
wtData <- as.data.frame(wtData)

# set class labels into categorical values
classId <- c(rep("1",100), rep("2",100), rep("3",100) ,rep("4",100), rep("5",100), rep("6",100))
wtSc <- data.frame(cbind(classId, wtData))

# build a decision tree with ctree() in package party
library(party)
ct <- ctree(classId ~ ., data=wtSc, controls = ctree_control(minsplit=30, minbucket=10, maxdepth=5))
pClassId <- predict(ct)
# check predicted classes against original class labels
table(classId, pClassId)

# accuracy
(sum(classId==pClassId)) / nrow(wtSc)
plot(ct, ip_args=list(pval=FALSE), ep_args=list(digits=0))