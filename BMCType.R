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

PointBMC1999 <- subset(BCM1999,type=="POINT")
nPointBMC1999 <- subset(BCM1999, type == "NONPOINT")
oRoadBMC1999 <- subset(BCM1999, type == "ON-ROAD")
nRoadBMC1999 <- subset(BCM1999, type == "NON-ROAD")

PointBMC2002 <- subset(BCM2002,type=="POINT")
nPointBMC2002 <- subset(BCM2002, type == "NONPOINT")
oRoadBMC2002 <- subset(BCM2002, type == "ON-ROAD")
nRoadBMC2002 <- subset(BCM2002, type == "NON-ROAD")


PointBMC2005 <- subset(BCM2005,type=="POINT")
nPointBMC2005 <- subset(BCM2005, type == "NONPOINT")
oRoadBMC2005 <- subset(BCM2005, type == "ON-ROAD")
nRoadBMC2005 <- subset(BCM2005, type == "NON-ROAD")


PointBMC2008 <- subset(BCM2008,type=="POINT")
nPointBMC2008 <- subset(BCM2008, type == "NONPOINT")
oRoadBMC2008 <- subset(BCM2008, type == "ON-ROAD")
nRoadBMC2008 <- subset(BCM2008, type == "NON-ROAD")

mnPnt1999 <- mean(PointBMC1999$Emissions)
mnPnt2002 <- mean(PointBMC2002$Emissions)
mnPnt2005 <- mean(PointBMC2005$Emissions)
mnPnt2008 <- mean(PointBMC2008$Emissions)

mnNPnt1999 <- mean(nPointBMC1999$Emissions)
mnNPnt2002 <- mean(nPointBMC2002$Emissions)
mnNPnt2005 <- mean(nPointBMC2005$Emissions)
mnNPnt2008 <- mean(nPointBMC2008$Emissions)

mnOnRd1999 <- mean(oRoadBMC1999$Emissions)
mnOnRd2002 <- mean(oRoadBMC2002$Emissions)
mnOnRd2005 <- mean(oRoadBMC2005$Emissions)
mnOnRd2008 <- mean(oRoadBMC2008$Emissions)

mnNRd1999 <- mean(nRoadBMC1999$Emissions)
mnNRd2002 <- mean(nRoadBMC2002$Emissions)
mnNRd2005 <- mean(nRoadBMC2005$Emissions)
mnNRd2008 <- mean(nRoadBMC2008$Emissions)
## Create Table with Baltimore Data
BMData <- NULL
BMData <- rbind(BMData, c(as.numeric(as.character(mnPnt1999)),as.numeric(as.character("1999"))))
BMData <- rbind(BMData, c(as.numeric(as.character(mnPnt2002)), as.numeric(as.character("2002"))))
BMData <- rbind(BMData, c(as.numeric(as.character(mnPnt2005)), as.numeric(as.character("2005"))))
BMData <- rbind(BMData, c(as.numeric(as.character(mnPnt2008)), as.numeric(as.character("2008"))))
BMData <- rbind(BMData, c(as.numeric(as.character(mnNPnt1999)), as.numeric(as.character("1999"))))
BMData <- rbind(BMData, c(as.numeric(as.character(mnNPnt2002)), as.numeric(as.character("2002"))))
BMData <- rbind(BMData, c(as.numeric(as.character(mnNPnt2005)), as.numeric(as.character("2005"))))
BMData <- rbind(BMData, c(as.numeric(as.character(mnNPnt2008)), as.numeric(as.character("2008"))))
BMData <- rbind(BMData, c(as.numeric(as.character(mnOnRd1999)), as.numeric(as.character("1999"))))
BMData <- rbind(BMData, c(as.numeric(as.character(mnOnRd2002)), as.numeric(as.character("2002"))))
BMData <- rbind(BMData, c(as.numeric(as.character(mnOnRd2005)), as.numeric(as.character("2005"))))
BMData <- rbind(BMData, c(as.numeric(as.character(mnOnRd2008)), as.numeric(as.character("2008"))))
BMData <- rbind(BMData, c(as.numeric(as.character(mnNRd1999)), as.numeric(as.character("1999"))))
BMData <- rbind(BMData, c(as.numeric(as.character(mnNRd2002)), as.numeric(as.character("2002"))))
BMData <- rbind(BMData, c(as.numeric(as.character(mnNRd2005)), as.numeric(as.character("2005"))))
BMData <- rbind(BMData, c(as.numeric(as.character(mnNRd2008)), as.numeric(as.character("2008"))))
BMData <- structure(BMData)

## Converting to Dataframe at this step keeps numeric data as the correct type
BMData <- data.frame(BMData)
colnames(BMData)<-c("Emissions","Year")
# Add Type Info in final collumn
Type <- c(rep("Point",4), rep("Non-Point",4),rep("On-Road",4), rep("nonRoad",4))
BMData<- cbind(BMData, Type)

## We Have good Data - Need to graph now.

