# Check for plyr package
require(plyr)

# Set working directory
setwd("C:/Rdata")

# Read in activity labels and features
activityl <- read.table("UCI HAR Dataset/activity_labels.txt", sep = "", 
                        header = F)
names(activityl) <- c("activityID", "activity")
features <- read.table("UCI HAR Dataset/features.txt", sep = "", 
                       colClasses = "character", header = F)

# Read in train data
trainx <- read.table("UCI HAR Dataset/train/X_train.txt", sep = "", header = F)
trainy <- read.table("UCI HAR Dataset/train/y_train.txt", sep = "", header = F)
trains <- read.table("UCI HAR Dataset/train/subject_train.txt", sep = "", 
                     header = F)

# Read in test data
testx <- read.table("UCI HAR Dataset/test/X_test.txt", sep = "", header = F)
testy <- read.table("UCI HAR Dataset/test/y_test.txt", sep = "", header = F)
tests <- read.table("UCI HAR Dataset/test/subject_test.txt", sep = "", 
                    header = F)

# 1. Merge the training and test data into a single data set, set labels

alltrain <- cbind(cbind(trainx, trainy), trains)
alltest <- cbind(cbind(testx, testy), tests)
alldata <- rbind(alltrain, alltest)

labels <- rbind(rbind(features, c(562, "subjectID")), c(563, "activityID"))[, 2]
names(alldata) <- labels

# 2. Extract mean and standard deviation 
finaldata <- alldata[, grepl("mean|std|subjectID|activityID", 
                             names(alldata))]

# 3. Descriptive activity names
finaldata <- join(finaldata, activityl, by = "activityID", match = "first")
finaldata <- finaldata[, -1]

# 4. Appropriately label the data with descriptive names
names(finaldata) <- make.names(names(finaldata))
names(finaldata) <- gsub("\\(|\\)", "", names(finaldata), perl = T)
names(finaldata) <- gsub("Acc", "accceleration", names(finaldata))
names(finaldata) <- gsub("Mag", "magnitude", names(finaldata))
names(finaldata) <- gsub("^t", "time", names(finaldata))
names(finaldata) <- gsub("^f", "frequency", names(finaldata))
names(finaldata) <- gsub("Freq\\.", "frequency", names(finaldata))
names(finaldata) <- gsub("Freq$", "frequency", names(finaldata))
names(finaldata) <- gsub("[Bb]ody[Bb]ody", "body", names(finaldata))

# 5. Create a tidy data set with the average of each variable for each activity and each subject
tidyset <- ddply(finaldata, c("subjectID", "activity"), numcolwise(mean))
write.table(tidyset, file = "tidydata.txt", row.name = F)