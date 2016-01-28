## Data Folder Read

setwd("C:/Repositories/Explore/ExploreNEI")
NEI <- readRDS("./rawData/summarySCC_PM25.rds")
SCC <- readRDS("./rawData/Source_Classification_Code.rds")

BaltimoreSources <- subset(NEI, fips == "24510")

png("plot2.png", width=640, height=480, res=120)

# limited to .3 Tons / source to zoom in on the box which shows the 25%, Median, and 75% of all sources to better show the trend of the median
# ouliers have been disabled to remove clutter from map.
with(BaltimoreSources,boxplot(Emissions~year, ylim = c(0, 5.5),xlab="Year", ylab= "Tons of PM2.5 / Source", outline = FALSE))
mtext("Pollution Trends in the Baltimore")
dev.off()
