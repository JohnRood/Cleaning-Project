##
## Script for Getting and Cleaning Data project
##
## Parts of this script have benefitted from the forum discussions.
##
## Step 1
##
## Script should be executed in the top level directory of the data set,
## i.e. in the directory "UCI HAR dataset" when the zip file has been extracted.
##
getwd()
d_train <- read.table( "train/X_train.txt" )
d_test <- read.table( "test/X_test.txt" )
d_full <- rbind( d_train, d_test )
dim( d_full )
y_train <- read.table( "train/y_train.txt" )
y_test <- read.table( "test/y_test.txt" )
y_full <- rbind( y_train, y_test )
dim( y_full )
s_train <- read.table( "train/subject_train.txt" )
s_test <- read.table( "test/subject_test.txt" )
s_full <- rbind( s_train, s_test )
dim( s_full )
foobar <- cbind( s_full, y_full, d_full )
str( foobar )
##
## Step 2
##
tmp_vector <- read.csv( "features.txt", sep=" ", header=FALSE )
tmpl1 <- grepl( pattern="-mean()", x=tmp_vector$V2, fixed=TRUE )
tmpl2 <- grepl( pattern="-std()", x=tmp_vector$V2, fixed=TRUE )
tmpl <- tmpl1 | tmpl2
foobar_2 <- foobar[ tmpl ]
str( foobar_2 )
foo <- foobar_2
names( foo )[1] <- "subject"
names( foo )[2] <- "activity"
##
## Step 3
##
foobar_2$V1.1 <- lapply( foobar_2$V1.1, gsub, pattern="1", replace="WALKING", fixed=TRUE )
foobar_2$V1.1 <- lapply( foobar_2$V1.1, gsub, pattern="2", replace="WALKING_UPSTAIRS", fixed=TRUE )
foobar_2$V1.1 <- lapply( foobar_2$V1.1, gsub, pattern="3", replace="WALKING_DOWNSTAIRS", fixed=TRUE )
foobar_2$V1.1 <- lapply( foobar_2$V1.1, gsub, pattern="4", replace="SITTING", fixed=TRUE )
foobar_2$V1.1 <- lapply( foobar_2$V1.1, gsub, pattern="5", replace="STANDING", fixed=TRUE )
foobar_2$V1.1 <- lapply( foobar_2$V1.1, gsub, pattern="6", replace="LAYING", fixed=TRUE )
str( foobar_2 )
##
## Step 4
##
classic <- as.character( tmp_vector$V2[ tmpl ] )
names( foobar_2 )[3:68] <- classic
names( foobar_2 )[1] <- "subject"
names( foobar_2 )[2] <- "activity"
str( names( foobar_2 ) )
##
## Step 5
##
library( dplyr )
foo_tidy <- summarise_each( foo, funs(mean), foo$subject, foo$activity )
str( foo_tidy )

