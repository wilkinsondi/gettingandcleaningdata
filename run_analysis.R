run_analysis <- function(url) {

# Download the file if it does not already exist  
  url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
  if (!file.exists("projectdata.zip")){
          download.file(url, destfile="~/Coursera/projectdata.zip")   
          }
  unzip("projectdata.zip")

#Create data tables from raw test information  
  varname <- read.table("~/Coursera/UCI HAR Dataset/features.txt", stringsAsFactors=F)
  vartest <- read.table("~/Coursera/UCI HAR Dataset/test/X_test.txt")
  activitytest <- read.table("~/Coursera/UCI HAR Dataset/test/y_test.txt",)
  subjecttest <- read.table("~/Coursera/UCI HAR Dataset/test/subject_test.txt")

#Combine into one data table and label for raw test information
  testdata <- cbind(subjecttest,activitytest,vartest)
  colnames(testdata) <- c("Subject","Activity",varname[,2])

#Create data tables from raw train information  
  vartrain <- read.table("~/Coursera/UCI HAR Dataset/train/X_train.txt")
  activitytrain <- read.table("~/Coursera/UCI HAR Dataset/train/y_train.txt",)
  subjecttrain <- read.table("~/Coursera/UCI HAR Dataset/train/subject_train.txt")

#Combine into one data table and label for raw test information
  traindata <- cbind(subjecttrain,activitytrain,vartrain)
  colnames(traindata) <- c("Subject","Activity",varname[,2])  

#Combine train and test data files
  alldata <- rbind(testdata,traindata)  

#Extract only the columns with data on mean and sd
  meancols <- alldata[grep("mean()",names(alldata), fixed=TRUE)]
  sdcols <- alldata[grep("std()",names(alldata), fixed=TRUE)]

#Aggregate the data in a single frame
  ssdata <- cbind(alldata$Subject,alldata$Activity,meancols,sdcols)  
  
#Change the activity value to names
  ssdata$Activity <- rep(NA, nrow(ssdata))
  ssdata[ssdata[,2] == 1, ][, "Activity"] <- "WALKING"
  ssdata[ssdata[,2] == 2, ][, "Activity"] <- "WALKING_UPSTAIRS"
  ssdata[ssdata[,2] == 3, ][, "Activity"] <- "WALKING_DOWNSTAIRS"
  ssdata[ssdata[,2] == 4, ][, "Activity"] <- "SITTING"
  ssdata[ssdata[,2] == 5, ][, "Activity"] <- "STANDING"
  ssdata[ssdata[,2] == 6, ][, "Activity"] <- "LAYING"

# rename subject
  colnames(ssdata)[1] <- "Subject"  

# Assign names to activity
  ssdata[,2] <- ssdata$Activity
  ssdata$Activity <- NULL
  colnames(ssdata)[2] <- "Activity"

#Summarize the data by activity and by subject
  tidy <- ssdata %>% group_by(Subject,Activity) %>% summarise_each(funs(mean))
  
# View output in R
  View(tidy)

# Write a .txt file called tidy.txt
  write.table(tidy,file="tidy.txt",row.names=FALSE)

}