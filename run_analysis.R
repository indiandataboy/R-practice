#Downloaded the UCI HAR Dataset directly from browser
#Reading all features
library(tidyr)
features <- read.table("./UCI\ HAR\ Dataset/features.txt")
#Reading activity_labels
activity <- read.table("./UCI\ HAR\ Dataset/activity_labels.txt", col.names=c("activityid", "label"))
head(activity)
#Reading Train Tables
xtrain <- read.table("./UCI\ HAR\ Dataset/train/X_train.txt", col.names = features$V2)
ytrain <- read.table("./UCI\ HAR\ Dataset/train/Y_train.txt", col.names="activityid")
?read.table
subjecttrain <- read.table("./UCI\ HAR\ Dataset/train/subject_train.txt", col.names = "subjectid")
#Reading test tables
xtest <-read.table("./UCI\ HAR\ Dataset/test/X_test.txt", col.names = features$V2)
ytest <-read.table("./UCI\ HAR\ Dataset/test/Y_test.txt", col.names = "activityid")
subjecttest <- read.table("./UCI\ HAR\ Dataset/test/subject_test.txt", col.names = "subjectid")

#Merging all the data together
#train
trainmerge <- cbind(ytrain, subjecttrain, xtrain)
testmerge <- cbind(ytest, subjecttest, xtest)
# as both have same number of columns with same data type, use rowbind to bind together
finalset <- rbind(trainmerge, testmerge)
# extracting means and standard deviations
columns <- colnames(finalset)
meansd <- grepl(".mean.|.std.", columns) 
#activity and subject ids are also needed which are the 1st and 2nd columns
meansd[1:2] <- T
#subsetting from total set the means and deviations
finalsubset <- finalset[ , meansd == T]
#merging with appropriate activity label (Step 3)
labelledfinal <- merge(activity, finalsubset, by="activityid", all=FALSE)
#converting every column in labelled final to numeric before taking mean
labelledfinal[, 4:ncol(labelledfinal)] <- sapply(labelledfinal[ ,4:ncol(labelledfinal)], as.numeric)
#removing the activity id column as it has been replaced by activity label
labelledfinal <- labelledfinal[, -1]
#creating final table by grouping with subject id and label and summarising with mean
finaltidy <- labelledfinal %>%
                    group_by(subjectid, label) %>%
                         summarise_each(mean)
#writing data to tidy text file
write.table(finaltidy, "tidy_dataset.txt", row.names = FALSE)
