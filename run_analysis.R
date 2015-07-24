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

#Remove "Bodybody" erroneous columns
  xbody <- alldata[!grepl("BodyBody",names(alldata), fixed=TRUE)]
  
#Extract only the columns with data on mean and sd
  meancols <- xbody[grep("mean()",names(xbody), fixed=TRUE)]
  sdcols <- xbody[grep("std()",names(xbody), fixed=TRUE)]

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

# Assign name to activity
  ssdata[,2] <- ssdata$Activity
  ssdata$Activity <- NULL
  colnames(ssdata)[2] <- "Activity"

# rename columns
  colnames(ssdata)[1] <- "Subject"
  colnames(ssdata)[3] <- "Time Body Acceleration Mean X"
  colnames(ssdata)[4] <- "Time Body Acceleration Mean Y"
  colnames(ssdata)[5] <- "Time Body Acceleration Mean Z"
  colnames(ssdata)[6] <- "Time Gravity Acceleration Mean X"
  colnames(ssdata)[7] <- "Time Gravity Acceleration Mean Y"
  colnames(ssdata)[8] <- "Time Gravity Acceleration Mean Z"
  colnames(ssdata)[9] <- "Time Body Acceleration Jerk Mean X"
  colnames(ssdata)[10] <- "Time Body Acceleration Jerk Mean Y"
  colnames(ssdata)[11] <- "Time Body Acceleration Jerk Mean Z"
  colnames(ssdata)[12] <- "Time Body Gyroscope Mean X"
  colnames(ssdata)[13] <- "Time Body Gyroscope Mean Y"
  colnames(ssdata)[14] <- "Time Body Gyroscope Mean Z"
  colnames(ssdata)[15] <- "Time Body Gyroscope Jerk Mean X"
  colnames(ssdata)[16] <- "Time Body Gyroscope Jerk Mean Y"
  colnames(ssdata)[17] <- "Time Body Gyroscope Jerk Mean Z"
  colnames(ssdata)[18] <- "Time Body Acceleration Magnitude Mean"
  colnames(ssdata)[19] <- "Time Gravity Acceleration Magnitude Mean"
  colnames(ssdata)[20] <- "Time Body Acceleration Jerk Magnitude Mean"
  colnames(ssdata)[21] <- "Time Body Gyroscope Magnitude Mean"
  colnames(ssdata)[22] <- "Time Body Gyroscope Jerk Magnitude Mean"
  colnames(ssdata)[23] <- "Frequency Body Acceleration Mean X"
  colnames(ssdata)[24] <- "Frequency Body Acceleration Mean Y"
  colnames(ssdata)[25] <- "Frequency Body Acceleration Mean Z"
  colnames(ssdata)[26] <- "Frequency Body Acceleration Jerk Mean X"
  colnames(ssdata)[27] <- "Frequency Body Acceleration Jerk Mean Y"
  colnames(ssdata)[28] <- "Frequency Body Acceleration Jerk Mean Z"
  colnames(ssdata)[29] <- "Frequency Body Gyroscope Mean X"
  colnames(ssdata)[30] <- "Frequency Body Gyroscope Mean Y"
  colnames(ssdata)[31] <- "Frequency Body Gyroscope Mean Z"
  colnames(ssdata)[32] <- "Frequency Body Acceleration Magnitude Mean"

  colnames(ssdata)[33] <- "Time Body Acceleration StDev X"
  colnames(ssdata)[34] <- "Time Body Acceleration StDev Y"
  colnames(ssdata)[35] <- "Time Body Acceleration StDev Z"
  colnames(ssdata)[36] <- "Time Gravity Acceleration StDev X"
  colnames(ssdata)[37] <- "Time Gravity Acceleration StDev Y"
  colnames(ssdata)[38] <- "Time Gravity Acceleration StDev Z"
  colnames(ssdata)[39] <- "Time Body Acceleration Jerk StDev X"
  colnames(ssdata)[40] <- "Time Body Acceleration Jerk StDev Y"
  colnames(ssdata)[41] <- "Time Body Acceleration Jerk StDev Z"
  colnames(ssdata)[42] <- "Time Body Gyroscope StDev X"
  colnames(ssdata)[43] <- "Time Body Gyroscope StDev Y"
  colnames(ssdata)[44] <- "Time Body Gyroscope StDev Z"
  colnames(ssdata)[45] <- "Time Body Gyroscope Jerk StDev X"
  colnames(ssdata)[46] <- "Time Body Gyroscope Jerk StDev Y"
  colnames(ssdata)[47] <- "Time Body Gyroscope Jerk StDev Z"
  colnames(ssdata)[48] <- "Time Body Acceleration Magnitude StDev"
  colnames(ssdata)[49] <- "Time Gravity Acceleration Magnitude StDev"
  colnames(ssdata)[50] <- "Time Body Acceleration Jerk Magnitude StDev"
  colnames(ssdata)[51] <- "Time Body Gyroscope Magnitude StDev"
  colnames(ssdata)[52] <- "Time Body Gyroscope Jerk Magnitude StDev"
  colnames(ssdata)[53] <- "Frequency Body Acceleration StDev X"
  colnames(ssdata)[54] <- "Frequency Body Acceleration StDev Y"
  colnames(ssdata)[55] <- "Frequency Body Acceleration StDev Z"
  colnames(ssdata)[56] <- "Frequency Body Acceleration Jerk StDev X"
  colnames(ssdata)[57] <- "Frequency Body Acceleration Jerk StDev Y"
  colnames(ssdata)[58] <- "Frequency Body Acceleration Jerk StDev Z"
  colnames(ssdata)[59] <- "Frequency Body Gyroscope StDev X"
  colnames(ssdata)[60] <- "Frequency Body Gyroscope StDev Y"
  colnames(ssdata)[61] <- "Frequency Body Gyroscope StDev Z"
  colnames(ssdata)[62] <- "Frequency Body Acceleration Magnitude StDev"

#Summarize the data by activity and by subject
  tidy <- ssdata %>% group_by(Subject,Activity) %>% summarise_each(funs(mean))
  
# View output in R
  View(tidy)

# Write a .txt file called tidy.txt
  write.table(tidy,file="tidy.txt",row.names=FALSE)

}