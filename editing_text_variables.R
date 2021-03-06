#Fixing character vectors - tolower(), toupper()
if(!file.exists("./data")){dir.create("./data")}
fileUrl <- "https://data.baltimorecity.gov/api/views/dz54-2aru/rows.csv?accessType=DOWNLOAD"
download.file(fileUrl,destfile="./data/cameras.csv",method="curl")
cameraData <- read.csv("./data/cameras.csv")
names(cameraData)
tolower(names(cameraData))


# Fixing character vectors - strsplit()
# Good for automatically splitting variable names
# Important parameters: x, split
splitNames = strsplit(names(cameraData),"\\.")
splitNames[[5]]
splitNames[[6]]

# Fixing character vectors - sapply()
# Applies a function to each element in a vector or list
# Important parameters: X,FUN
splitNames[[6]][1]
firstElement <- function(x){x[1]}
sapply(splitNames,firstElement)

#Peer review data
fileUrl1 <- "https://dl.dropboxusercontent.com/u/7710864/data/reviews-apr29.csv"
fileUrl2 <- "https://dl.dropboxusercontent.com/u/7710864/data/solutions-apr29.csv"
download.file(fileUrl1,destfile="./data/reviews.csv",method="internal")
download.file(fileUrl2,destfile="./data/solutions.csv",method="internal")
reviews <- read.csv("./data/reviews.csv"); solutions <- read.csv("./data/solutions.csv")
head(reviews,2)
head(solutions,2)

# Fixing character vectors - sub()
# Important parameters: pattern, replacement, x
names(reviews)
sub("_","",names(reviews),)

#Fixing character vectors - gsub()
testName <- "this_is_a_test"
sub("_","",testName)
gsub("_","",testName)

#Finding values - grep(),grepl()
grep("Alameda",cameraData$intersection)
table(grepl("Alameda",cameraData$intersection))
cameraData2 <- cameraData[!grepl("Alameda",cameraData$intersection),]

#More on grep()
grep("Alameda",cameraData$intersection,value=TRUE)
grep("JeffStreet",cameraData$intersection)
length(grep("JeffStreet",cameraData$intersection))

#More useful string functions
library(stringr)
nchar("Jeffrey Leek")
substr("Jeffrey Leek",1,7)
paste("Jeffrey","Leek")
paste0("Jeffrey","Leek")
str_trim("Jeff      ")