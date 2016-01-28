library(dplyr)
library(ggplot2)
## Data Folder Read

setwd("C:/Repositories/Explore/ExploreNEI")
NEI <- readRDS("./rawData/summarySCC_PM25.rds")
SCC <- readRDS("./rawData/Source_Classification_Code.rds")
CoalSubset <- SCC[grep("Coal", SCC$EI.Sector),]
CoalSCCInd <- as.factor(as.character(CoalSubset$SCC)) 

CoalSCCInd <- data.frame(CoalSCCInd)
colnames(CoalSCCInd)<- "SCC"
NEI$SCC <- as.factor(as.character(NEI$SCC))
CoalPolution <- inner_join(NEI, CoalSCCInd)
#quick Box plot
with(CoalPolution, boxplot(Emissions~year, ylim = c(0,20)))
## It looks like coal polution is increasing

