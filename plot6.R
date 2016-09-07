library(ggplot2)
# read the data set
SCC <- readRDS("../exdata_data_NEI_data/Source_Classification_Code.rds")
NEI <- readRDS("../exdata_data_NEI_data/summarySCC_PM25.rds")

# for plotting the numbers in non exponential form
options(scipen = 10)

#compute the aggregate for plotting for Baltimore City, Maryland (fips == "24510") 
# and Los Angeles County, California (fips == "06037") 
NEI_BalLA <- NEI[ (NEI$fips =="24510" | NEI$fips =="06037" ) & NEI$type == "ON-ROAD", ]

NEI_BalLA$county[NEI_BalLA$fips == "24510"] <- "Baltimore City, Maryland"
NEI_BalLA$county[NEI_BalLA$fips == "06037"] <- "Los Angeles County, California"

# merge NEI_BalLA and SCC
NEI_BalLA_SCC <- merge(NEI_BalLA, SCC, by = "SCC")

emission_aggregate <- aggregate(Emissions ~ year + county, data = NEI_BalLA_SCC, sum)

#plot the bar graph to plot6.png

png('plot6.png')

gg <- ggplot(emission_aggregate,aes(year, Emissions, color = county))
gg <- gg + geom_line()
gg <- gg + xlab("Years") + ylab("total PM 2.5") + 
        ggtitle("Comparison for Baltimore City, Maryland\n and Los Angeles County, California by Motor Vehicle")
print(gg)
dev.off()
