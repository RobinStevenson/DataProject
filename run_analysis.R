library(plyr)

# read in data
# filepathTestData <- "./data/UCI HAR Dataset/test/X_test.txt"
# filepathTestSubjects <- "./data/UCI HAR Dataset/test/subject_test.txt"
# filepathTestLabels <- "./data/UCI HAR Dataset/test/y_test.txt"
# filepathTrainData <- "./data/UCI HAR Dataset/Train/X_Train.txt"
# filepathTrainSubjects <- "./data/UCI HAR Dataset/Train/subject_Train.txt"
# filepathTrainLabels <- "./data/UCI HAR Dataset/Train/y_Train.txt"
# mydataTest <- read.table(filepathTestData)
# mydataTestSubjects<-read.table(filepathTestSubjects)
# mydataTestLabels<-read.table(filepathTestLabels)
# mydataTrain <- read.table(filepathTrainData)
# mydataTrainSubjects<-read.table(filepathTrainSubjects)
# mydataTrainLabels<-read.table(filepathTrainLabels)

# merge data sets
mydata<- rbind(mydataTest,mydataTrain)
mydataSubjects<- rbind(mydataTestSubjects,mydataTrainSubjects)
mydataLabels<- rbind(mydataTestLabels,mydataTrainLabels)

# extract only the rows, and add subject and activity labels
subdata<-cbind(mydataSubjects,mydataLabels,mydata[,1:6])
names(subdata)<-c("subject","activity","meanx","meany","meanz",
                  "standarddeviationx","standarddeviationy","standarddeviationz")
# convert to subject and activity to factors
subdata$subject<-factor(subdata$subject)
subdata$activity<-factor(subdata$activity)
levels(subdata$activity)<-c("walking","walking up","walking down", "sitting", 
                            "standing", "laying")

# make new data set with average of each variable
means<-aggregate(subdata[,3:8],by=list(subdata$subject,subdata$activity),mean)
    # aggregate is similar to tapply, but can work on multiple columns at once
# rename first to columns back to subject and activity
names(means)[1]<-"subject"
names(means)[2]<-"activity"
write.table(means,file="./tablemeans.txt",row.names=F)