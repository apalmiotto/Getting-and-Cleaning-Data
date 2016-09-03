### Merge data sets.
library(plyr)

X_train <- read.table(".\\train\\X_train.txt")
y_train <- read.table(".\\train\\y_train.txt")
subject_train <- read.table(".\\train\\subject_train.txt")

X_test <- read.table(".\\test\\X_test.txt")
y_test <- read.table(".\\test\\y_test.txt")
subject_test <- read.table(".\\test\\subject_test.txt")

xmerge <- rbind(X_train, X_test)
ymerge <- rbind(y_train, y_test)
submerge <- rbind(subject_train, subject_test)

## Extract measurements on the mean and standard deviation.
features <- read.table("features.txt")

## Grep to find columns which contain 'std' or 'mean()'
fstat <- grep("std|mean\\(\\)", features$V2)

## Create a table
extrax <- xmerge[, fstat]
names(extrax) <- features[fstat, 2]


## Use descriptive activity names 
actlabels <- read.table("activity_labels.txt")
ymerge[,1] <- actlabels[ymerge[,1], 2]
names(ymerge) <- "activity"
names(submerge) <- "subject"

## Bind data into a single data table
all <- cbind(extrax, ymerge, submerge)


## Create a second, independent tidy data set with the average of each variable for each activity and each subject.
tidy <- ddply(.data = all, .variables = c("subject", "activity"), .fun = numcolwise(mean))
write.table(tidy, "tidy.txt", row.names = FALSE)
read.table("tidy.txt")
