library(ggplot2)
## Data Folder Read

setwd("C:/Repositories/Explore/ExploreNEI")
NEI <- readRDS("./rawData/summarySCC_PM25.rds")
SCC <- readRDS("./rawData/Source_Classification_Code.rds")

BaltimoreSources <- subset(NEI, fips == "24510")

#Limits set at 4 tons / source to zoom in on median line for the various types of pollution
g <-ggplot(BaltimoreSources, aes(factor(year),Emissions, fill =type))+geom_boxplot()
g <- g + geom_boxplot()+ylim(0,4)
g<- g +xlab("Year")+ ylab("Emissions - Tons / Source")+ggtitle("Trends of Pollution Types in Baltimore")


png("plot3.png", width=640, height=480, res=120)
g
dev.off()