## Data Folder Read

setwd("C:/Repositories/Explore/ExploreNEI")
NEI <- readRDS("./rawData/summarySCC_PM25.rds")
SCC <- readRDS("./rawData/Source_Classification_Code.rds")

## Break out data by year
Data1999 <- subset(NEI, year == 1999)
Data2002 <- subset(NEI, year == 2002)
Data2005 <- subset(NEI, year == 2005)
Data2008 <- subset(NEI, year == 2008)

## Log10 of Emissions by year
boxplot(log10(Data1999$Emissions),log10(Data2002$Emissions), log10(Data2005$Emissions), log10(Data2008$Emissions))

## Actual Emissons by year without Outliers
boxplot(Data1999$Emissions, Data2002$Emissions, Data2005$Emissions, Data2008$Emissions, outline = FALSE)


