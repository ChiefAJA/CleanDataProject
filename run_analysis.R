##load files 

sub_test <- read.table("./UCI HAR Dataset/test/subject_test.txt")
x_test <- read.table("./UCI HAR Dataset/test/X_test.txt")
y_test <- read.table("./UCI HAR Dataset/test/Y_test.txt")

x_columnames <- read.table("./UCI HAR Dataset/features.txt")

sub_train <- read.table("./UCI HAR Dataset/train/subject_train.txt")
x_train <- read.table("./UCI HAR Dataset/train/X_train.txt")
y_train <- read.table("./UCI HAR Dataset/train/Y_train.txt")



## changes the column names to be more descriptive 
x<- t(x_columnames[2])
colnames(x_test) <- x
colnames(x_train) <- x
colnames(sub_test) <- "subject"
colnames(sub_train) <- "subject"
colnames(y_test) <- "activity"
colnames(y_train) <- "activity"

## joining the data set to their respective subjects and activity labels
total_test<- cbind(sub_test,x_test)
total_test<- cbind(total_test, y_test)

total_train<- cbind(sub_train, x_train, y_train)

##merging test and training data into one larger data set
total<- rbind(total_test,total_train)

##cleans up column names
valid_column_names <- make.names(names = names(total), unique = TRUE, allow_ = TRUE)
names(total) <- valid_column_names

temp <- select(total,contains("subject"),contains("mean"), contains("std"), contains("activity"))


## rename activities to be more descriptive 
test <- temp[,88] == 1
temp[test,88] = "WALKING"

test <- temp[,88] == 2
temp[test,88] = "WALKING UPSTAIRS"

test <- temp[,88] == 3
temp[test,88] = "WALKING DOWNSTAIRS"

test <- temp[,88] == 4
temp[test,88] = "SITTING"

test <- temp[,88] == 5
temp[test,88] = "STANDING"

test <- temp[,88] == 6
temp[test,88] = "LAYING"


temp2 <- group_by(temp,subject, activity)
final_ans<- summarise_each(temp2, funs(mean))

write.table(final_ans, file = "answer.txt", row.names= FALSE)
