# How to import Data and to create data frames.

#Option 1: Select File Manually

Data <- read.csv(file.choose())
Data
rm(Data)

#Option 2: Set working-directory(Default where R-studio saves files) and read data (Often Used)
getwd()
setwd("/Users/kushtrivedi/Downloads")
Data <- read.csv("DemographicData.csv")
Data

# Exploring Data
Data
nrow(Data)
ncol(Data)
head(Data)
tail(Data)
head(Data, n=10)
tail(Data, n=10)
str(Data) # str() is Structure not String
summary(Data)

# Little more insight

Data[3,3]
Data[3,"Birth.rate"]
Data[3,"Internet.users"]
Data[3,"Country.Name"]
Data[3,"Country.Code"] # we can see column not for row (As we have names for column not for row)


Data[,1,drop=F]

#Filtering Data

Filter <- Data$Internet.users < 3
Data[Filter,]

Data[Data$Birth.rate > 40 & Data$Internet.users < 2,]
Data[Data$Income.Group == "High income",]
levels(Data$Income.Group)
Data[Data$Country.Name == "Malta",]


# Q-plot

qplot(data=Data, x = Internet.users)
qplot(data=Data, x = Income.Group, y = Birth.rate)
qplot(data=Data, x = Income.Group, y = Birth.rate, size=I(5))
qplot(data=Data, x = Income.Group, y = Birth.rate, size=I(5), colour = I("blue"))
qplot(data=Data, x = Income.Group, y = Birth.rate, geom = "boxplot")

# Deep insights

qplot(data=Data, x = Internet.users, y = Birth.rate)

qplot(data=Data, x = Internet.users, y = Birth.rate, size=I(4))

qplot(data=Data, x = Internet.users, y = Birth.rate, size=I(4), colour = I("red"))

qplot(data=Data, x = Internet.users, y = Birth.rate, size=I(4), colour = Income.Group)

# Creating data frame and adding new data from vector

myDataFrame <- data.frame(Countries, Country_Codes, Regions)
head(myDataFrame)
colnames(myDataFrame) <- c("Country","Code","Region")
head(myDataFrame)
summary(myDataFrame)

#Now lets merge data frame

head(Data)
head(myDataFrame)

mergeData <- merge(Data, myDataFrame, by.x = "Country.Code", by.y = "Code")
head(mergeData)

#lets remove duplicate column

mergeData$Country <- NULL

head(mergeData)


#Now lets see merge data into q-plot: SHAPE TRANSPARENCY & TITLE

qplot(data = mergeData, x = Internet.users, y = Birth.rate)
qplot(data = mergeData, x = Internet.users, y = Birth.rate, colour= Regions, size= I(5), shape = I(18), alpha = I(0.7))
qplot(data = mergeData, x = Internet.users, y = Birth.rate, colour= Regions, size= I(5), shape = I(18), alpha = I(0.7), main = "Birth Rate vs Internet Users")


