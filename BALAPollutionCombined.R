library(dplyr)
library(ggplot2)
## Data Folder Read

setwd("C:/Repositories/Explore/ExploreNEI")
NEI <- readRDS("./rawData/summarySCC_PM25.rds")
SCC <- readRDS("./rawData/Source_Classification_Code.rds")


Bal_LA_NEI <- subset(NEI,fips == "24510" | fips == "06037")

## limit SCC to Vehicles as per requirements
VehicleSubset <- SCC[grep("Vehicles", SCC$EI.Sector),]

VehicleSCCInd <- as.factor(as.character(VehicleSubset$SCC))
VehicleSCCInd <- data.frame(VehicleSCCInd)
colnames(VehicleSCCInd)<- "SCC"
Bal_LA_NEI$SCC <- as.factor(as.character(Bal_LA_NEI$SCC))
BALAVehiclePolution <- inner_join(Bal_LA_NEI, VehicleSCCInd, by="SCC")
## quick and dirty plot
## full US Data
SortedBALAPol <- group_by(BALAVehiclePolution, fips, year)

with(VehiclePolution, boxplot(Emissions~year, ylim = c(0,10)))
