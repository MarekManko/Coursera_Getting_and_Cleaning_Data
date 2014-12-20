# Step 0 
# INITIAL SETTINGS
library(plyr)

# Set working directory
# Please change your working directory here:
setwd("E:\\Marek\\Studia\\Coursera\\Getting and Cleaning Data\\W3\\")

# Step 1 
# MERGE THE TRAINING AND TEST DATA SETS TO CREATE ONE DATA SET
Train.X_train <- read.table("UCI HAR Dataset\\train\\X_train.txt")
Train.y_train <- read.table("UCI HAR Dataset\\train\\y_train.txt")
Train.subject_train <- read.table("UCI HAR Dataset\\train\\subject_train.txt")

Test.X_test <- read.table("UCI HAR Dataset\\test\\X_test.txt")
Test.y_test <- read.table("UCI HAR Dataset\\test\\y_test.txt")
Test.subject_test <- read.table("UCI HAR Dataset\\test\\subject_test.txt")

# Create merged datasets
All.X <- rbind(Train.X_train, Test.X_test)
All.y <- rbind(Train.y_train, Test.y_test)
All.subject <- rbind(Train.subject_train, Test.subject_test)
# ________________________________________________________________________________________________________________


# 2. EXTRACT ONLY THE MEASUREMENTS ON THE MEAN AND THE STANDARD DEVIATION FOR EACH MEASUREMENT ####

Main.Features <- read.table("UCI HAR Dataset\\features.txt")

# Extract columns named with "mean" or "std" 
iColNum <- grep("-(mean|std)\\(\\)", Main.Features[, 2])
All.X <- All.X[, iColNum]

# Adjust column names
names(All.X) <- Main.Features[iColNum, 2]
# ________________________________________________________________________________________________________________


# 3. USE DESCRIPTIVE ACTIVITY NAMES TO NAME THE ACTIVITIES IN THE DATA SET ####

Main.Activities <- read.table("UCI HAR Dataset\\activity_labels.txt")

# Change numerical values with their description
All.y[, 1] <- Main.Activities[All.y[, 1], 2]
names(All.y) <- "Activity"
# ________________________________________________________________________________________________________________


# 4. APPROPRIATELY LABEL THE DATA SET WITH DESCRIPTIVE VARIABLE NAMES ####

# Adjust column name
names(All.subject) <- "Subject"

# Combine date into single data set
All.Data <- cbind(All.X, All.y, All.subject)
# ________________________________________________________________________________________________________________

# 5. CREATE A SECOND, INDEPENDENT TIDY DATA SET WITH THE AVERAGE OF EACH VARIABLE FOR EACH ACTIVITY AND EACH SUBJECT ####

# Group against last two columns
Tidy.Averages <- ddply(All.Data, .(Subject, Activity), numcolwise(mean))
write.table(Tidy.Averages, "Tidy.Averages.txt", row.name=FALSE)
# ________________________________________________________________________________________________________________
