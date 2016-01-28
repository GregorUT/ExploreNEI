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

# still need to break out by city
g<- ggplot(CoalPolution, aes(factor(year), Emissions))+ geom_boxplot()
# limit Y to focus on box plot trends
g<- g+ylim(0,.4)
g<- g +xlab("Year")+ ylab("Emissions due to coal consupmtion")+ggtitle("Trends of Coal Pollution in United States")

png("plot4.png", width=640, height=480, res=120)
g
dev.off()

