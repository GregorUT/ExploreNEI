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
# with(CoalPolution, boxplot(Emissions~year, ylim = c(0,20)))
## It looks like coal polution is increasing

BACoPolution <-  subset(CoalPolution,fips == "24510" )

# still need to break out by city
g<- ggplot(BACoPolution, aes(factor(year), Emissions)) + geom_boxplot()+ylim(0,15)
g<- g +xlab("Year")+ ylab("Emissions due to coal consupmtion")+ggtitle("Baltimore Trends of Coal Pollution")

png("plot6.png", width=640, height=480, res=120)
g
dev.off()

