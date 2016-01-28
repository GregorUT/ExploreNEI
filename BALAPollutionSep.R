library(dplyr)
library(ggplot2)
## Data Folder Read

setwd("C:/Repositories/Explore/ExploreNEI")
NEI <- readRDS("./rawData/summarySCC_PM25.rds")
SCC <- readRDS("./rawData/Source_Classification_Code.rds")


## limit SCC to Vehicles as per requirements
VehicleSubset <- SCC[grep("Vehicles", SCC$EI.Sector),]

VehicleSCCInd <- as.factor(as.character(VehicleSubset$SCC))
VehicleSCCInd <- data.frame(VehicleSCCInd)
colnames(VehicleSCCInd)<- "SCC"

Bal_NEI <- subset(NEI,fips == "24510" )
LA_NEI <- subset(NEI,fips == "06037")

BalNEI$SCC <- as.factor(as.character(BalNEI$SCC))
LANEI$SCC <- as.factor(as.character(LANEI$SCC))

BalVehiclePolution <- inner_join(Bal_NEI, VehicleSCCInd, by="SCC")
LAVehiclePolution <- inner_join(LA_NEI, VehicleSCCInd, by="SCC")
## quick and dirty plot
## full US Data


BalVehiclePolution$fips <- c("Baltimore")
LAVehiclePolution$fips <- c("LA")
combPol <- rbind(BalVehiclePolution, LAVehiclePolution)
colnames(combPol)[1] <- "City"

# simple box plot
with(combPol,boxplot(Emissions~year))
# ggplot
g <-ggplot(combPol, aes(factor(year),Emissions))+geom_boxplot()
# still need to break out by city
g<- ggplot(combPol, aes(factor(year), Emissions, fill = City)) + geom_boxplot()+ylim(0,15)
g<- g +xlab("Year")+ ylab("Emissions due to gasoline vehicles")+ggtitle("Trend Comparison of Vehicle Emissions in Baltimore and LA")

png("plot6.png", width=640, height=480, res=120)
g
dev.off()


mnLA99 <- mean(LAVehiclePolution$Emissions[LAVehiclePolution$year == 1999])
mnBA99 <- mean(BalVehiclePolution$Emissions[BalVehiclePolution$year == 1999])

mnLA02 <- mean(LAVehiclePolution$Emissions[LAVehiclePolution$year == 2002])
mnBA02 <- mean(BalVehiclePolution$Emissions[BalVehiclePolution$year == 2002])


mnLA05 <- mean(LAVehiclePolution$Emissions[LAVehiclePolution$year == 2005])
mnBA05 <- mean(BalVehiclePolution$Emissions[BalVehiclePolution$year == 2005])


mnLA08 <- mean(LAVehiclePolution$Emissions[LAVehiclePolution$year == 2008])
mnBA08 <- mean(BalVehiclePolution$Emissions[BalVehiclePolution$year == 2008])
