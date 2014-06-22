#Set the work directory to the directory contains "X_test.txt","subject_test
.txt","y_test.txt","X_train.txt","subject_train.txt","y_train.txt",
"features.txt".
#Read test data set and append the subject column and test label on the left
side of the dataframe.#

testdata<-read.csv("X_test.txt", sep="", header=FALSE)
testsubject<-read.csv("subject_test.txt", sep="")
testlabel<-read.csv("y_test.txt",sep="")
testdataupdated1<-cbind(testlabel,testdata)
testdatafinal<-cbind(testsubject,testdataupdated1)

#Read train data set and append the subject column and test label on the left
side of the dataframe.#

traindata<-read.csv("X_train.txt",sep="", header=FALSE)
trainsubject<-read.csv("subject_train.txt",sep="")
trainlabel<-read.csv("y_train.txt",sep="")
traindataupdated1<-cbind(trainlabel,traindata)
traindatafinal<-cbind(trainsubject,traindataupdated1)

#Merge test data set and train data set#

names(testdatafinal)<-names(traindatafinal)
data<-rbind(traindatafinal, testdatafinal)

#Add colname to the newly merged data.frame#

featurename<-read.csv("features.txt",sep="",header=F)
colnameA<-c("subject","activity")
colnameB<-as.vector(featurename[,2])
names(data)<-c(colnameA, colnameB)

#select the column with measurement of std or mean
dataSTD<-data[,grep('std',names(data))]
dataMean<-data[,grep('mean',names(data))]
dataSTDorMean<-cbind(dataSTD,dataMean)
datafinal<-cbind(data[,1:2],dataSTDorMean)

#Uses descriptive activity names to name the activities in the data set
datafinal[,2]<-gsub("1", "WALKING",datafinal[,2],fixed=T)
datafinal[,2]<-gsub("2", "WALKING_UPSTAIRS",datafinal[,2],fixed=T)
datafinal[,2]<-gsub("3", "WALKING_DOWNSTAIRS",datafinal[,2],fixed=T)
datafinal[,2]<-gsub("4", "SITTING",datafinal[,2],fixed=T)
datafinal[,2]<-gsub("5","STANDING",datafinal[,2],fixed=T)
datafinal[,2]<-gsub("6", "LAYING",datafinal[,2],fixed=T)

#caculate the average of each variable for each activity and each subject
variable<-as.vector(names(datafinal[,3:ncol(datafinal)]))
dataMelt<-melt(datafinal, id=c("subject","activity"), measure.vars=variable)
datasubjectMean<-dcast(dataMelt,subject~variable, mean)
dataactivityMean<-dcast(dataMelt,activity~variable, mean)

