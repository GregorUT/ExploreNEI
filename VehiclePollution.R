library(dplyr)
library(ggplot2)
## Data Folder Read

setwd("C:/Repositories/Explore/ExploreNEI")
NEI <- readRDS("./rawData/summarySCC_PM25.rds")
SCC <- readRDS("./rawData/Source_Classification_Code.rds")


BaltimoreNEI <- subset(NEI,fips == "24510")
## limit SCC to Vehicles as per requirements
VehicleSubset <- SCC[grep("Vehicles", SCC$EI.Sector),]

VehicleSCCInd <- as.factor(as.character(VehicleSubset$SCC))
VehicleSCCInd <- data.frame(VehicleSCCInd)
colnames(VehicleSCCInd)<- "SCC"
BaltimoreNEI$SCC <- as.factor(as.character(BaltimoreNEI$SCC))
VehiclePolution <- inner_join(BaltimoreNEI, VehicleSCCInd, by="SCC")
## quick and dirty plot
## full US Data
with(VehiclePolution, boxplot(Emissions~year, ylim = c(0,10)))

g<- ggplot(combPol, aes(factor(year), Emissions)) + geom_boxplot()
g<- g+ ylim(0,2)
g<- g +xlab("Year")+ ylab("Emissions due to gasoline vehicles")+ggtitle("Vehicle Polution Trends for Baltimore")


png("plot5.png", width=640, height=480, res=120)
g
dev.off()