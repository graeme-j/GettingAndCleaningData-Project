library(dplyr)
library(data.table)

## Read in all the datasets

train <- read.table("UCI HAR Dataset/train/X_train.txt")
test <- read.table("UCI HAR Dataset/test/X_test.txt")
features <- read.table("UCI HAR Dataset/features.txt", stringsAsFactors = FALSE)
train_y <- read.table("UCI HAR dataset/train/y_train.txt")
test_y <- read.table("UCI HAR dataset/test/y_test.txt")
train_subject <- read.table("UCI HAR dataset/train/subject_train.txt")
test_subject <- read.table("UCI HAR dataset/test/subject_test.txt")
activity_t <- read.table("UCI HAR Dataset/activity_labels.txt")

#join the activity info, the subject info and the data for the training set
train_tbl = data.table(cbind(train_y, train_subject, train))

#join the activity info, the subject info and the data for the test set
test_tbl = data.table(cbind(test_y,test_subject,test))

#join the test set and the training set
full_tbl = data.table(rbind(train_tbl,test_tbl))

#create the column names vector
coln = c("activity","subject", features$V2)

#attach the column names
colnames(full_tbl) <- coln

#select only the columns refering to a mean() or std() and then replace the activity id with the name
#and then re-arrange the table
full_tbl <-full_tbl %>% 
                select(activity,subject,matches("mean[(][)]|std[(][)]")) %>%
                merge(activity_t, by.x = "activity", by.y = "V1") %>%
                select(V2,everything(),-activity)

#add back the column name for the activity as we lost it when cutting the activity id column
colnames(full_tbl)[1] <- "Activity"

#group by subject and activity and then summarise with the means of each column for each subset
summarized_data <- full_tbl %>%
                    group_by(Activity, subject) %>%
                    summarise_each(funs(mean)) %>% 
                    arrange(Activity, subject)

#copy the full tidy dataset and the summarized data set to file
write.table(full_tbl, file="tidy_data.txt", row.name = F)
write.table(summarized_data, file="tidy_summary_data.txt", row.name = F)
