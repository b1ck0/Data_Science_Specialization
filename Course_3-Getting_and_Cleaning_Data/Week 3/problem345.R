df1 <- read.csv("GDP.csv", skip = 4)
df2 <- read.csv("EDU.csv")

names(df1) <- c("CountryCode","Ranking", "3", "Economy", "USD", "6", "7", "8", "9")

mergedData <- merge(df1, df2, all = FALSE)
mergedData <- mergedData[mergedData$Ranking != "",]

mergedData$Ranking <- as.numeric(levels(mergedData$Ranking ))[mergedData$Ranking ]

sortedData <- mergedData[order(mergedData$Ranking,decreasing = TRUE),]

mean1 <- sortedData[sortedData$Income.Group == "High income: OECD",]
mean(mean1$Ranking)

mean2 <- sortedData[sortedData$Income.Group == "High income: nonOECD",]
mean(mean2$Ranking)

sortedData <- tbl_df(sortedData)

sortedData$quartile <- ntile(sortedData$Ranking, 5)

temp <- sortedData[sortedData$quartile == 1,]
temp1 <- temp$Income.Group == "Lower middle income"
sum(temp1)