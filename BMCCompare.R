## Data Folder Read

setwd("C:/Repositories/Explore/ExploreNEI")
NEI <- readRDS("./rawData/summarySCC_PM25.rds")
SCC <- readRDS("./rawData/Source_Classification_Code.rds")

## Break out data by year
Data1999 <- subset(NEI, year == 1999)
Data2002 <- subset(NEI, year == 2002)
Data2005 <- subset(NEI, year == 2005)
Data2008 <- subset(NEI, year == 2008)

## Extract Baltimore by fips
BCM1999 <- subset (Data1999,fips == "24510")
BCM2002 <- subset (Data2002,fips == "24510")
BCM2005 <- subset (Data2005,fips == "24510")
BCM2008 <- subset (Data2008,fips == "24510")

## Box Plot with outliers turned off
boxplot(BCM1999$Emissions, BCM2002$Emissions, BCM2005$Emissions, BCM2008$Emissions, outline = FALSE)