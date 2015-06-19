library(plyr)

# set directory to be the current directory of the script
script.dir <- dirname(sys.frame(1)$ofile)
setwd(script.dir)


# read in data
filepathTestData <- "./data/UCI HAR Dataset/test/X_test.txt"
filepathTestSubjects <- "./data/UCI HAR Dataset/test/subject_test.txt"
filepathTestLabels <- "./data/UCI HAR Dataset/test/y_test.txt"
filepathTrainData <- "./data/UCI HAR Dataset/Train/X_Train.txt"
filepathTrainSubjects <- "./data/UCI HAR Dataset/Train/subject_Train.txt"
filepathTrainLabels <- "./data/UCI HAR Dataset/Train/y_Train.txt"
filepathFeatures <- "./data/UCI HAR Dataset/features.txt"
dataTest <- read.table(filepathTestData)
TestSubjects<-read.table(filepathTestSubjects)
TestLabels<-read.table(filepathTestLabels)
dataTrain <- read.table(filepathTrainData)
TrainSubjects<-read.table(filepathTrainSubjects)
TrainLabels<-read.table(filepathTrainLabels)
Features<-read.table(filepathFeatures,colClasses="character")

# merge data sets
mydata<- rbind(dataTest,dataTrain)
Subjects<- rbind(TestSubjects,TrainSubjects)
Labels<- rbind(TestLabels,TrainLabels)


# make logical vector of whether feature names contain "mean" or "std"
meanorstd<-grepl("mean|std",Features[,2])

# extract only the rows, and add subject and activity labels
subdata<-cbind(Subjects,Labels,mydata[,meanorstd])
names(subdata)<-c("subject","activity",Features[meanorstd,2])
# convert to subject and activity to factors
subdata$subject<-factor(subdata$subject)
subdata$activity<-factor(subdata$activity)
levels(subdata$activity)<-c("walking","walking up","walking down", "sitting", 
                            "standing", "laying")

# make new data set with average of each variable
means<-aggregate(subdata[,-(1:2)],by=list(subdata$subject,subdata$activity),mean)
    # aggregate is similar to tapply, but can work on multiple columns at once
# rename first to columns back to subject and activity
names(means)[1]<-"subject"
names(means)[2]<-"activity"
write.table(means,file="./tablemeans.txt",row.names=F)